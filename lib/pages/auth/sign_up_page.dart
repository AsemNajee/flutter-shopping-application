import 'package:flutter/material.dart';
import 'package:self_built_market/main.dart';
import 'package:self_built_market/pages/auth/login_page.dart';
import 'package:self_built_market/pages/home/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final response = await supabase.auth.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        data: {
          'name': _nameController.text.trim(), // ✅ حفظ الاسم
        },
      );

      if (response.user != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('تم إنشاء الحساب بنجاح')));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message), backgroundColor: Colors.red),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إنشاء حساب')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ الاسم
              TextFormField(
                controller: _nameController,
                decoration: _buildInputDecoration(
                  label: 'الاسم',
                  hint: 'أدخل اسمك',
                  icon: Icons.person,
                ),
                validator: (v) => v == null || v.isEmpty ? 'أدخل الاسم' : null,
              ),
              const SizedBox(height: 16),

              // email
              TextFormField(
                controller: _emailController,
                decoration: _buildInputDecoration(
                  label: 'Email',
                  hint: 'example@mail.com',
                  icon: Icons.email,
                ),
                validator: (v) => v == null || v.isEmpty ? 'أدخل البريد' : null,
              ),
              const SizedBox(height: 16),

              // password
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: _buildInputDecoration(
                  label: 'Password',
                  hint: '********',
                  icon: Icons.lock,
                ),
                validator: (v) =>
                    v == null || v.length < 6 ? 'كلمة المرور ضعيفة' : null,
              ),

              const SizedBox(height: 24),

              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _signUp,
                      child: const Text('إنشاء حساب'),
                    ),

              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                child: const Text('لديك حساب؟ تسجيل الدخول'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
