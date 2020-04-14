import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/page/providers/data_list_provider.dart';
import 'package:random_names/random_names.dart';

class DataListPage extends StatefulWidget {
  @override
  _DataListPageState createState() => _DataListPageState();
}

class _DataListPageState extends State<DataListPage> {
  DataListProvider _provider;
  ScrollController _scrollController;

  @override
  void initState() {
    _provider = DataListProvider();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.extentAfter < 50) {
        _provider.loadMoreData();
      }
      //596
    });
    super.initState();
  }

  @override
  void dispose() {
    _provider.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _provider,
      child: Scaffold(
        appBar: AppBar(
          title: Text('dataList'),
        ),
        body: Consumer<DataListProvider>(
          builder: (_, value, child) {
            return RefreshIndicator(
              onRefresh: () {
                return value.refreshData();
              },
              child: ListView.separated(
                controller: _scrollController,
                itemBuilder: (_, index) {
                  if (index == value.listData.length) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                            ),
                          ),
                          SizedBox(width: 30),
                          Text('loading...'),
                        ],
                      ),
                    );
                  }
                  return ListTile(
                    title: Text(value.listData[index]),
                  );
                },
                separatorBuilder: (_, index) {
                  return Divider(height: 1);
                },
                itemCount: value.listData.length + 1,
              ),
            );
          },
        ),
      ),
    );
  }
}
