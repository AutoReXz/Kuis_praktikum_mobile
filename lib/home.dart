import 'package:flutter/material.dart';
import 'package:tugas_2_latihan_quiz/login.dart';
import 'package:tugas_2_latihan_quiz/about.dart';
import 'package:tugas_2_latihan_quiz/detail.dart';
import 'newsmodel.dart';

class Home extends StatefulWidget {
  final String username;

  const Home({super.key, required this.username});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Selamat Datang, ${widget.username}!",
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => AboutPage(username: widget.username)));
              },
              icon: Icon(Icons.person),
              color: Colors.white),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              icon: Icon(Icons.logout),
              color: Colors.red),
            
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Daftar Berita:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            for (var news in dummyNews)
              _newsCard(context, news),
          ],
        ),
      ),
    ));
  }

  Widget _newsCard(BuildContext context, NewsModel news) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        try {
          print("Navigating to detail page with news: ${news.title}");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(news: news),
            ),
          );
        } catch (e) {
          print("Error navigating to detail page: $e");
          // Show a snackbar to inform user
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error opening detail page")),
          );
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    news.image,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    // Add error handling for images
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.grey[300],
                        child: Center(
                          child: Icon(Icons.error, color: Colors.red),
                        ),
                      );
                    },
                    // Add loading placeholder
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.grey[200],
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  news.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  news.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.thumb_up, color: Colors.blue),
                    SizedBox(width: 4),
                    Text(
                      "${news.likes}",
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    Text(
                      "Lihat Detail",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.blue, size: 16),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}
