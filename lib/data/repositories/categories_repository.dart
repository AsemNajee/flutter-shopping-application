import 'package:self_built_market/data/repositories/categories_repository_supabase.dart';
import 'package:self_built_market/data/repositories/db_repository.dart';

class CategoriesRepository {
  static final DbRepository instance = CategoriesRepositorySupabase();
}
