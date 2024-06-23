import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/apiConstants.dart';
import 'package:news_app/model/NewsRespose.dart';
import 'package:news_app/model/sourseResponse.dart';

class ApiManager{

  static Future<SourseResponse?> getSource(String categoryId)async{
    /// adb949e7be28414a8b0eb647e4696f0a {api_key}
    /// https://newsapi.org/v2/top-headlines/sources?apiKey=adb949e7be28414a8b0eb647e4696f0a
    Uri url = Uri.https(
      ApiConstants.baseurl, /* server name*/
      ApiConstants.sourcesApi, /* complete url */
      {
        'apiKey': 'adb949e7be28414a8b0eb647e4696f0a',
        'category': categoryId
      }
    );
    try{
      var response = await http.get(url);
      var responseBody = response.body; // String
      var json = jsonDecode(responseBody); // String => json
      return SourseResponse.fromJson(json); //  object => json
    }catch(e){
      throw e;
    }

  }


  static Future<NewsRespose?> getNewsBySourceId(String sourceId)async{

    /// https://newsapi.org/v2/everything?q=bitcoin&apiKey=adb949e7be28414a8b0eb647e4696f0a

    Uri url = Uri.https(
      ApiConstants.baseurl,
      ApiConstants.newsApi,
      {
        'apiKey' : 'adb949e7be28414a8b0eb647e4696f0a',
        'sources': sourceId
      }
    );
    try{

      var respose = await http.get(url);
      var resposeBody = respose.body;
      var json = jsonDecode(resposeBody);
      return NewsRespose.fromJson(json);

    } catch(e){
      throw e;
    }
  }
}