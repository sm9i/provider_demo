import 'package:flutter/material.dart';
import 'package:provider_demo/page/data_list_page.dart';
import 'package:random_names/random_names.dart';

class DataListProvider extends ChangeNotifier {
  DataListProvider() {
    listData.addAll(generateRandomNames(20));
  }

  List<String> listData = [];
  bool isLoadMore = false;

  loadMoreData() {
    if (isLoadMore) return;
    isLoadMore = true;
    print("load More");
    return Future.delayed(Duration(milliseconds: 500), () {
      listData.addAll(generateRandomNames(20));
      isLoadMore = false;
      notifyListeners();
      return null;
    });
  }

  refreshData() {
    return Future.delayed(Duration(milliseconds: 500), () {
      listData.clear();
      listData.addAll(generateRandomNames(20));
      notifyListeners();
      return null;
    });
  }

  @override
  void dispose() {
    listData.clear();
    listData = null;
    super.dispose();
  }
}
