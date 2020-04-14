import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider_demo/page/data_list_page.dart';
import 'package:provider_demo/page/providers/data_list_provider.dart';
import 'package:provider_demo/provider/providers.dart';
import 'package:provider_demo/provider/theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<ThemeProvider>(builder: (_, value, __) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: value.currentTheme,
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  value: 1,
                  child: Text('改变主题'),
                ),
              ];
            },
            icon: Icon(Icons.more_horiz),
            onSelected: (value) {
              if (value == 1) {
                /// listen  =false
                final provider =
                    Provider.of<ThemeProvider>(context, listen: false);
                provider.changeTheme(!provider.isDark);
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('加载更多provider'),
            onTap: () {
              _goPage(DataListPage());
            },
          )
        ],
      ),
    );
  }

  Future _goPage(Widget child) {
    return Navigator.push(
      context,
      new MaterialPageRoute(builder: (_) => child),
    );
  }
}
