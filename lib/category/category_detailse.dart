import 'package:flutter/material.dart';
import 'package:news_app/api/api_maneger.dart';
import 'package:news_app/category/tab_widget.dart';

import '../MyTheme.dart';
import '../model/sourseResponse.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category';
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('News App',style: Theme.of(context).textTheme.titleLarge,),
        ),
        body: FutureBuilder<SourseResponse?>(
          future: ApiManager.getSource(), // load for source response
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: MyTheme.primaryLightColor,
                ),
              );
            }else if(snapshot.hasError){
              return Column(
                children: [
                  Text("Somthing went wrong"),
                  ElevatedButton(onPressed: (){
                    ApiManager.getSource();
                    setState(() {

                    });
                  }, child: Text("Try Again"))
                ],
              );
            } // server (success, error)
            if(snapshot.data?.status!= 'ok'){
              return Center(
                child: Column(
                  children: [
                    Text(snapshot.data?.message ?? "Somthing went wrong"),
                    ElevatedButton(onPressed: (){
                      ApiManager.getSource();
                      setState(() {

                      });
                    }, child: Text("Try Again"))
                  ],
                ),
              );
            }
            var sourcesList = snapshot.data?.sources ?? [];
            return TabWidget(sourcesList: sourcesList);
          }
        ),
      ),

    );
  }
}
