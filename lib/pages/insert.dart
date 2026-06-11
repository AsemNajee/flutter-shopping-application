import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  bool isSyncing = false;

  void push() {
    syncProductsToSingleTable();
    isSyncing = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isSyncing
          ? Center(
              child: SizedBox(height: 60, width: 60, child: CircularProgressIndicator()),
            )
          : Center(
              child: ElevatedButton(
                onPressed: () {
                  push();
                },
                child: Text("Insert"),
              ),
            ),
    );
  }
Future<void> syncProductsToSingleTable() async {
    final supabase = Supabase.instance.client;
    const apiUrl = 'https://dummyjson.com/products?limit=30&skip=60';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode != 200) throw Exception('فشل جلب البيانات');

      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List products = jsonData['products'];

      for (final product in products) {
        // تحويل الحقول المركبة إلى JSONB (كائنات أو مصفوفات)
        final dimensionsJson = product['dimensions'] != null
            ? jsonEncode(product['dimensions'])
            : null;
        final metaJson = product['meta'] != null
            ? jsonEncode(product['meta'])
            : null;
        final tagsJson = product['tags'] != null
            ? jsonEncode(product['tags'])
            : null;
        final reviewsJson = product['reviews'] != null
            ? jsonEncode(product['reviews'])
            : null;
        final imagesJson = product['images'] != null
            ? jsonEncode(product['images'])
            : null;

        // إدراج أو تحديث (إذا كان id موجوداً) باستخدام upsert
        await supabase.from('products').upsert({
          'id': product['id'],
          'title': product['title'],
          'description': product['description'],
          'category': product['category'],
          'price': product['price'],
          'discount_percentage': product['discountPercentage'],
          'rating': product['rating'],
          'stock': product['stock'],
          'brand': product['brand'],
          'sku': product['sku'],
          'weight': product['weight'],
          'dimensions': dimensionsJson,
          'warranty_information': product['warrantyInformation'],
          'shipping_information': product['shippingInformation'],
          'availability_status': product['availabilityStatus'],
          'return_policy': product['returnPolicy'],
          'minimum_order_quantity': product['minimumOrderQuantity'],
          'thumbnail': product['thumbnail'],
          'meta': metaJson,
          'tags': tagsJson,
          'reviews': reviewsJson,
          'images': imagesJson,
          'updated_at': DateTime.now().toIso8601String(),
        });
      }

      print('✅ تمت مزامنة المنتجات إلى جدول واحد بنجاح');
    } catch (e) {
      print('❌ خطأ في المزامنة: $e');
      rethrow;
    }
    isSyncing = false;
    setState((){});
  }
}
