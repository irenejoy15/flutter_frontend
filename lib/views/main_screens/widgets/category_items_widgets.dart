import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/controllers/category_controller.dart';
import 'package:shop_app/models/category_model.dart';

class CategoryItemsWidget extends StatefulWidget {
  const CategoryItemsWidget({super.key});

  @override
  State<CategoryItemsWidget> createState() => _CategoryItemsWidgetState();
}

class _CategoryItemsWidgetState extends State<CategoryItemsWidget> {
  // FIRST 
  late Future<List<CategoryModel>> _categoriesFuture;
  @override
  // SECOND
  void initState() {
    super.initState();
    _categoriesFuture = CategoryController().fetchCategories();
  }
  Widget build(BuildContext context) {
    // THIRD
    final screenWidth = MediaQuery.of(context).size.width;
    //FORTH
    return FutureBuilder(future: _categoriesFuture,builder: (context,snapshot){
      // FIFTH
      if(snapshot.connectionState == ConnectionState.waiting){
        //SIXTH
        return const Center(child: CircularProgressIndicator());
      }
      // SEVENTH
      if(snapshot.hasError){
        return Center(child: Text('Error: ${snapshot.error}'));
      }

      // EIGHTH
      final categories = snapshot.data!;
      // NINTH
      return GridView.builder(
        shrinkWrap: true,
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                category.imageUrl, 
                width: screenWidth * 0.15, 
                height: screenWidth * 0.15
              ),
              Text(
                category.categoryName, 
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w500,
                ), 
                overflow: TextOverflow.ellipsis
              ),
            ],
          );
        }
      );
    });
  }
}