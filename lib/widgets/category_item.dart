import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryModel, required this.isRight});
  final CategoryModel categoryModel;
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: isRight ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        Stack(
          alignment: isRight ? Alignment.topRight : Alignment.topLeft,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                categoryModel.image,
              ),
            ),
              Padding(
                padding: isRight ? const EdgeInsets.only(top: 38.0,right: 28,) : const EdgeInsets.only(top: 38.0,left: 28,),
                child: Text(
                  categoryModel.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: isRight ? const EdgeInsets.only(bottom: 16,right: 16,) : const EdgeInsets.only(bottom: 16,left: 16,),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(
                alpha: 0.5,
              ),
              borderRadius: BorderRadius.circular(84),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if(isRight)...[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 9,
                      bottom: 9,
                    ),
                    child: Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 27,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff171717),
                    ),
                  ),
                ] else...[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 27,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xff171717),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      top: 9,
                      bottom: 9,
                    ),
                    child: Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],

              ],
            ),
          ),
        ),
      ],
    );
  }
}
