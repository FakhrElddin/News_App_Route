import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_response_model.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.articles});
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: Color(0xff171717),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: articles.urlToImage ?? "https://play-lh.googleusercontent.com/BnqLAI0JrnO5asdM74QdKrACRYtqYsyBIoEYrXeXL_HQdKtS0d5BJasLVQOwGKsTrfuUbfzOWo9IP4M2KpiHgg=w480-h960-rw",
                placeholder: (context, url) =>
                    Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff171717),
                        ),
                    ),
                errorWidget: (context, url, error) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      color: Color(0xff171717),
                      size: 32,
                    ),
                    Text(
                      'No image for this article',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff171717),
                      ),
                    ),
                  ],
                ),
              ),
            
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            articles.title ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff171717),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  articles.author != null ? 'by : ${articles.author ?? ''}' : '',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffA0A0A0),
                  ),
                ),
              ),
              Text(
                articles.publishedAt ?? '',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffA0A0A0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
