import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/NewsRespose.dart';

class NewsItem extends StatelessWidget {

  News news;
  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.3,
                fit: BoxFit.fill,
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(news.author??'',style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.bold
          )),
          SizedBox(height: 10),
          InkWell(
            onTap: () {

            },
            child: Text(news.title??'',style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w700
            )),
          ),
          SizedBox(height: 10),

          Text(news.publishedAt??'',style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.grey,
              fontSize: 14),
          textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
