import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/model/category.dart';

class CategoryFragment extends StatelessWidget {
  static const String routeName = 'CategoryFragment';
    var categoriesList = CategoryDM.getCategories();
    Function onCategoryClick;
    CategoryFragment({required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Pick your category \nof interest ",style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: MyTheme.blackColor
          ),),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
              mainAxisSpacing: 15,
                crossAxisSpacing: 15
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategoryClick(categoriesList[index]);
                    },
                    child: CategoryItem(category: categoriesList[index], index: index));
              },
              itemCount: categoriesList.length,),
          )
        ],
      ),
    );
  }
}
