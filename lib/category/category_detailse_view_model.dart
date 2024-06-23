import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_maneger.dart';
import 'package:news_app/category/cubit/SourceState.dart';
import 'package:news_app/model/sourseResponse.dart';

class CategoryDetailseViewModel extends Cubit<SourceState>{
  CategoryDetailseViewModel():super(SourceLoadingState());

  void getSource(String categoryId)async{
    try{
      emit(SourceLoadingState());
     var response = await ApiManager.getSource(categoryId);
     if(response!.status == 'error'){
       emit(SourceErrorState(errorMessage: response.message));
     }else if(response!.status == 'ok'){
       emit(SourceSuccessState(sourceList: response.sources!));
     }
    }
    catch(e){
      emit(SourceErrorState(errorMessage: "Check Your Internet"));
    }
  }
}




///ChangeNotifier{
//
//
//   List<Source> ? sourcesList ;
//   String? errorMessage;
//   Future<void> getSources(String categoryId) async {
//     // if server return error ... must reinitialize
//     sourcesList = null;
//     errorMessage = null;
//     notifyListeners();
//     try{
//
//
//       var response = await ApiManager.getSource(categoryId);
//       if(response?.status == 'error'){
//         /// this error from server
//         errorMessage = response!.message;
//       }else{
//         sourcesList = response?.sources;
//       }
//     }catch(e){
//       errorMessage = 'Error Loading Source List ...';
//     }
//     notifyListeners();
//   }