import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';
import 'package:news_app/model/sourseResponse.dart';

import '../api/api_maneger.dart';
import '../model/NewsRespose.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsRespose?>(
        future: ApiManager.getNewsBySourceId(widget.source.id??''),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.primaryLightColor,
              ),
            );
          }else if(snapshot.hasError){
            return Center(
              child: Column(
                children: [
                  Text("Something went error"),
                  ElevatedButton(onPressed: (){
                    ApiManager.getNewsBySourceId(widget.source.id??'');
                        setState(() {

                        });
                  }
                      , child: Text("Try again")
                  )
                ],
              ),
            );
            // server (success,error)
          } if(snapshot.data?.status !='ok'){
            Center(
              child: Column(
                children: [
                  Text(snapshot.data!.message!),
                  ElevatedButton(onPressed: (){
                    ApiManager.getNewsBySourceId(widget.source.id ?? '');
                    setState(() {

                    });
                  }
                      , child: Text("Try again")
                  )
                ],
              ),
            );
          }
          var newsList = snapshot.data?.articles?? [];
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
            return Text(newsList[index].title?? '');
          },
          );
        },
    );
  }
}
