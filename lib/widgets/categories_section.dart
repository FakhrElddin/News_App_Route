import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_item.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key, required this.onCategoryClicked});
  final List<CategoryModel> categoriesName = const[
    CategoryModel(
      name: 'General',
      image: 'assets/images/general.png',
    ),
    CategoryModel(
      name: 'Business',
      image: 'assets/images/business.png',
    ),
    CategoryModel(
      name: 'Entertainment',
      image: 'assets/images/entertainment.png',
    ),
    CategoryModel(
      name: 'Health',
      image: 'assets/images/health.png',
    ),
    CategoryModel(
      name: 'Science',
      image: 'assets/images/science.png',
    ),
    CategoryModel(
      name: 'Technology',
      image: 'assets/images/technology.png',
    ),
    CategoryModel(
      name: 'Sports',
      image: 'assets/images/sports.png',
    ),
  ];
  final Function(String) onCategoryClicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text(
            'Good Morning\nHere is Some News For You',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                  onCategoryClicked(categoriesName[index].name);
                },
                child: CategoryItem(
                  categoryModel: categoriesName[index],
                  isRight: index % 2 == 0 ? true : false ,
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: categoriesName.length,
            ),
          ),
        ],
      ),
    );
  }
}
