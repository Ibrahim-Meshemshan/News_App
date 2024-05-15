import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';

import '../model/sourseResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source;
  TabItem({required this.isSelected,required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18),
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 12),
      decoration: BoxDecoration(
          color: isSelected?MyTheme.primaryLightColor: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: MyTheme.primaryLightColor,
          width: 2
        )
      ),

      child: Text(source.name?? '',style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: isSelected?MyTheme.whiteColor:MyTheme.primaryLightColor,
        fontSize: 18
      ),),
    );
  }
}
