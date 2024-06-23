import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/MyTheme.dart';
import 'package:news_app/model/sourseResponse.dart';
import 'package:news_app/news/cubit/newsState.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/news/news_widget_view_model.dart';
import 'package:provider/provider.dart';


class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {

  NewsWidgetViewModel viewModel = NewsWidgetViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsByCategoryId(widget.source.id?? '');
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsWidgetViewModel,NewsStates>(
      bloc: viewModel,
      builder: (context, state) {
        if(state is NewsLoadingState){
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primaryLightColor,
            ),
          );
        }else if(state is NewsErrorState){
          return Column(
            children: [
              Text(state.errorMessage!),
              ElevatedButton(onPressed: (){
                viewModel.getNewsByCategoryId(widget.source.id?? " ");
                setState(() {

                });
              }, child: Text("Try Again"))
            ],
          );
        }else if(state is NewsSuccessState){
          return ListView.builder(
            itemCount: state.newsList.length,
            itemBuilder: (context, index) {
              return NewsItem(news: state.newsList[index]);
            },
          );
        }else return Container();
      },
    );
  }
}
