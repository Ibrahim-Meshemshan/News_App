import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_maneger.dart';
import 'package:news_app/category/category_detailse_view_model.dart';
import 'package:news_app/category/cubit/SourceState.dart';
import 'package:news_app/category/tab_widget.dart';
import 'package:news_app/model/category.dart';
import 'package:provider/provider.dart';

import '../MyTheme.dart';
import '../model/sourseResponse.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category';
  CategoryDM category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {

  CategoryDetailseViewModel viewModel = CategoryDetailseViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSource(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailseViewModel,SourceState>(
      bloc: viewModel,
      builder:(context, state) {
        if(state is SourceLoadingState){
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primaryLightColor,
            ),
          );
        }else if(state is SourceErrorState){
          return Column(
            children: [
              Text(state.errorMessage!),
              ElevatedButton(onPressed: (){
                viewModel.getSource(widget.category.id);
                setState(() {

                });
              }, child: Text("Try Again"))
            ],
          );
        }else if(state is SourceSuccessState){
          return TabWidget(sourcesList: state.sourceList);
        }else
          return Container();
    },





      // FutureBuilder<SourseResponse?>(
      //       future: ApiManager.getSource(widget.category.id), // load for source response
      //       builder: (context, snapshot) {
      //         if(snapshot.connectionState == ConnectionState.waiting){
      //           return Center(
      //             child: CircularProgressIndicator(
      //               color: MyTheme.primaryLightColor,
      //             ),
      //           );
      //         }else if(snapshot.hasError){

      //         } // server (success, error)
      //         if(snapshot.data?.status!= 'ok'){
      //           return Center(
      //             child: Column(
      //               children: [
      //                 Text(snapshot.data?.message ?? "Somthing went wrong"),
      //                 ElevatedButton(onPressed: (){
      //                   ApiManager.getSource(widget.category.id);
      //                   setState(() {
      //
      //                   });
      //                 }, child: Text("Try Again"))
      //               ],
      //             ),
      //           );
      //         }
      //         var sourcesList = snapshot.data?.sources ?? [];
      //
      //       }
      // ),
    );
  }
}
