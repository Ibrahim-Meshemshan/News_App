import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_maneger.dart';

import '../model/NewsRespose.dart';
import 'cubit/newsState.dart';

class NewsWidgetViewModel extends Cubit<NewsStates>{
  NewsWidgetViewModel():super(NewsLoadingState());
  // todo: hold data _ handle logic

  void getNewsByCategoryId(String sourceId)async{
    try{
      emit(NewsLoadingState());
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if(response!.status == 'error'){
        emit(NewsErrorState(errorMessage: response.message));
        return;
      }else if(response.status == 'ok'){
        emit(NewsSuccessState(newsList: response.articles!));
        return;
      }
    }catch(e){
      emit(NewsErrorState(errorMessage: "Check Your Internet"));

    }
  }
}