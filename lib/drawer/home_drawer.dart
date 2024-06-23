import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';
import 'package:news_app/category/category_detailse.dart';
import 'package:news_app/category/category_fragment.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;
  Function onSideMenuItem;
  HomeDrawer({required this.onSideMenuItem});




  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: MyTheme.primaryLightColor,
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.2,
            child: Text("News App!",style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                onSideMenuItem(categories);
              },
              child: Row(
                children: [
                  Icon(Icons.list,size: 30,),
                  SizedBox(width: 12),
                  Text("Categories",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: MyTheme.blackColor
                  ),)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                onSideMenuItem(settings);
              },
              child: Row(
                children: [
                  Icon(Icons.settings,size: 30,),
                  SizedBox(width: 12),
                  Text("Settings",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: MyTheme.blackColor
                  ),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
