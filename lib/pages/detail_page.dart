import 'package:flutter/material.dart';
import '../models/TopNews.dart';

class DetailByIdPage extends StatelessWidget {
  final String sourceId;
  final List<Articles> articles;

  const DetailByIdPage({super.key, required this.sourceId, required this.articles});

  @override
  Widget build(BuildContext context) {
    // Cari artikel berdasarkan sourceId
    final article = articles.firstWhere(
          (item) => item.source?.id == sourceId,
      orElse: () => Articles(title: "Berita tidak ditemukan"),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(article.source?.name ?? 'Detail Berita'),
      ),
      body: article.title == "Berita tidak ditemukan"
          ? Center(child: Text("Berita tidak ditemukan."))
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(article.urlToImage!),
              ),
            const SizedBox(height: 16),
            Text(
              article.title ?? '',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              article.publishedAt ?? '',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              article.description ?? '',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              article.content ?? '',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
