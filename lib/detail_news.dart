// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_apps/data/models/responses/get_all_news_responses_model.dart';

class DetailNews extends StatelessWidget {
  final Article article;
  const DetailNews({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title!),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Created by: ${article.author ?? 'Anonymous'}'),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(article.urlToImage ??
                      'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(article.description ?? 'No Description'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(article.content ?? 'No Content'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(article.publishedAt.toString()),
                ],
              ))),
    );
  }
}
