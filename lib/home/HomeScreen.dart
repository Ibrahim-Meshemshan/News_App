import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';
import 'package:news_app/category/category_detailse.dart';
import 'package:news_app/category/category_fragment.dart';
import 'package:news_app/model/category.dart';

import '../drawer/home_drawer.dart';
import '../settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  CategoryDM? category;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: MyTheme.whiteColor,
        image: DecorationImage(image: AssetImage('assets/images/background.png'),fit: BoxFit.cover)
      ),
      child: Scaffold(
        drawer: Drawer(
          child: HomeDrawer(onSideMenuItem: onSideMenuItem),
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            selectedMenuItem == HomeDrawer.settings?
            'Settings':selectedCategory!=null? "${selectedCategory?.title}": 'News App',style: Theme.of(context).textTheme.titleLarge,),
        ),
        body: selectedMenuItem== HomeDrawer.settings? SettingsTab()
        :
        selectedCategory==null
            ? CategoryFragment(onCategoryClick: onCategoryClick,)
            : CategoryDetails(category:selectedCategory!)
      ),
    );
  }


  CategoryDM? selectedCategory;
  void onCategoryClick(CategoryDM newSelectedCategory){
    selectedCategory = newSelectedCategory;
    setState(() {

    });
  }

  int selectedMenuItem = HomeDrawer.categories;
  void onSideMenuItem(int newSelectedMenuItem){
    selectedMenuItem = newSelectedMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }


}
