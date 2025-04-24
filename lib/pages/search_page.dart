import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_gate_news/components/news.dart';
import 'package:provider_gate_news/providers/news.provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (BuildContext context, news, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Cari Berita'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: searchController,
                          decoration: const InputDecoration(
                            hintText: 'Cari berita ... ',
                          ),
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.send)),
                    ],
                  ),
                  SizedBox(height: 20),
                  news.isDataEmpty
                      ? SizedBox()

                      : news.isLoadingSearch
                      ? Center(child: CircularProgressIndicator())

                      : Column(
                    children: [
                      ...news.resultSearch!.articles!.map((e) =>
                          NewsCard(
                            title: e.title ?? 'No Title',
                            image: e.urlToImage ?? '',
                            source: e.source?.name ?? 'Unknown',
                            date: e.publishedAt?.split('T').first ?? '',
                            onTap: () {
                              // Arahkan ke halaman detail
                              // Navigator.push(...);
                            },
                          ),
                      ),
                    ],
                  ),
                  // News(
                  //   title: 'Testing',
                  //   image: 'https://fortune.com/img-assets/wp-content/uploads/2025/04/GettyImages-2209419978-e1745352193215.jpg?resize=1200,600',
                  // ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
