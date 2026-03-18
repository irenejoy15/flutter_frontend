import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/models/category_model.dart';

class CategoryNotifier extends Notifier<List<CategoryModel>>{
  @override
  List<CategoryModel> build() {
    return [];
  }

  void setCategory(List<CategoryModel> categories){
    state = categories;
  }
}

final categoryProvider = NotifierProvider<CategoryNotifier, List<CategoryModel>>(() => CategoryNotifier());