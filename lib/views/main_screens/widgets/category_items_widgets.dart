import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/controllers/category_controller.dart';
import 'package:shop_app/models/category_model.dart';
import 'package:shop_app/provider/category_notifier.dart';
import 'package:shop_app/views/main_screens/details/product_by_category_screen.dart';

class CategoryItemsWidget extends ConsumerStatefulWidget {
  const CategoryItemsWidget({super.key});

  @override
  ConsumerState<CategoryItemsWidget> createState() => _CategoryItemsWidgetState();
}

class _CategoryItemsWidgetState extends ConsumerState<CategoryItemsWidget> {
  // FIRST 
  late Future<List<CategoryModel>> _categoriesFuture;
  @override
  // SECOND
  void initState() {
    super.initState();
    CategoryController().fetchCategories().then((categories){
      ref.read(categoryProvider.notifier).setCategory(categories);
    });
  }
  Widget build(BuildContext context) {
    // THIRD
    final screenWidth = MediaQuery.of(context).size.width;
    //FORTH
    final categories = ref.watch(categoryProvider);
    if(categories.isEmpty){
      return SizedBox(
        height: screenWidth * 0.4,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: screenWidth * 0.02,
            crossAxisSpacing: screenWidth * 0.02,
            childAspectRatio: 1
          ), 
        itemBuilder: (context,index){
          // TENTH
          final category = categories[index];
          // ELEVENTH
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductByCategoryScreen(category: category.categoryName),
                ),
              );
            },

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  category.imageUrl, 
                  width: MediaQuery.of(context).size.width * 0.12, 
                  height: screenWidth * 0.15
                ),
                Text(
                  category.categoryName, 
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                  ), 
                  overflow: TextOverflow.ellipsis
                ),
              ],
            ),
          );
        }
      );
  }
}