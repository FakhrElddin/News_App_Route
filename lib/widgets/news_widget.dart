import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/news_response_model.dart';
import 'package:news_app/widgets/news_item.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.sourceId});
  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponseModel>(
      future: ApiManager.getNews(sourceId: sourceId),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(snapshot.hasError){
          return Center(
            child: Text(
              'Something Went Wrong, Try Again Later',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        }
        return snapshot.data?.articles?.isNotEmpty ?? false ? ListView.separated(
          itemBuilder: (context, index) => NewsItem(
            articles: snapshot.data!.articles![index],
          ),
          separatorBuilder: (context, index) => SizedBox(height: 16,),
          itemCount: snapshot.data?.articles?.length ?? 0,
        ) : Center(
          child: Text(
            'There is no news for this source',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
