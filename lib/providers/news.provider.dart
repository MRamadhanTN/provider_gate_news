import 'package:flutter/material.dart';
import 'package:provider_gate_news/helpers/api.dart';
import 'package:provider_gate_news/models/TopNews.dart';
import 'package:provider_gate_news/utils/const.dart';

class NewsProvider with ChangeNotifier{
  bool isDataEmpty = true;
  bool isLoading = true;
  bool isLoadingSearch = true;
  TopNews? resultNews;
  TopNews? resultSearch;

  setLoad(data) {
    isLoading = data;
    notifyListeners();
  }

  getTopNews() async {
    // panggil API get news
    final res = await api('${baseUrl}top-headlines?country=us&apiKey=$apiKey');

    if(res.statusCode == 200) {
      resultNews = TopNews.fromJson(res.data);
    } else {
      resultNews = TopNews();
    }
    isLoading = false;
    notifyListeners();
  }

  search(String search) async {
    isLoadingSearch = true;
    notifyListeners();

    // panggil API get news
    final res = await api('${baseUrl}everything?q=${search}&sortBy=popularity&apiKey=$apiKey');

    if(res.statusCode == 200) {
      resultSearch = TopNews.fromJson(res.data);
    } else {
      resultSearch = TopNews();
    }

    isDataEmpty = false;
    isLoadingSearch = false;
    notifyListeners();
  }
}
