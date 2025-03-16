import 'package:flutter/material.dart';

class NewsModel {
  final String id;
  final String title;
  final String image;
  final String description;
  final int likes;

  NewsModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.likes,
  });
}

class DetailPage extends StatelessWidget {
  final NewsModel news;

  const DetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(news.image),
            const SizedBox(height: 16.0),
            Text(
              news.title,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Likes: ${news.likes}',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              news.description,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}