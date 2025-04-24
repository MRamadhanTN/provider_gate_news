import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_gate_news/components/news.dart';
import 'package:provider_gate_news/pages/search_page.dart';
import 'package:provider_gate_news/providers/news.provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getNews(){
    Provider.of<NewsProvider>(context, listen: false).getTopNews();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (BuildContext context, news, Widget? child) {
        return RefreshIndicator(
          onRefresh: () async {
            news.setLoad(true);
            return await getNews();
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('Berita Terbaru'),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SearchPage()),
                    );
                  }, icon: Icon(Icons.search)),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(news.isLoading.toString()),
                    news.isLoading
                        ? Center(child: CircularProgressIndicator() )
                        : Column(
                          children: [
                            ...news.resultNews!.articles!.map((e) =>
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
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
