import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/page/providers/user_provider.dart';

class UserDataPage extends StatefulWidget {
  @override
  _UserDataPageState createState() => _UserDataPageState();
}

/// Selector 只会监听当前的变量
/// Consumer 监听的所有 只要会变
class _UserDataPageState extends State<UserDataPage> {
  final UserProvider _userProvider = UserProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _userProvider.dispose();
    super.dispose();
  }

  int consumerInt = 0;
  int consumerBool = 0;
  int selectorInt = 0;
  int selectorBool = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _userProvider,
      child: Scaffold(
        appBar: AppBar(
          title: Text('providers'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Consumer<UserProvider>(
                    builder: (_, value, child) {
                      consumerInt++;
                      return OutlineButton(
                        child: Text('更改Int --当前build次数$consumerInt'),
                        onPressed: () {
                          value.changePosition(++value.position);
                        },
                      );
                    },
                  ),
                  Consumer<UserProvider>(
                    builder: (_, value, child) {
                      consumerBool++;
                      return OutlineButton(
                        child: Text('更改Bool --当前build次数$consumerBool'),
                        onPressed: () {
                          value.changeSwitch(!value.openSwitch);
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 50),
              Selector<UserProvider, bool>(
                builder: (_, value, child) {
                  selectorBool++;
                  return Text('bool --build次数$selectorBool');
                },
                selector: (_, provider) => provider.openSwitch,
              ),
              SizedBox(height: 50),
              Selector<UserProvider, int>(
                builder: (_, value, child) {
                  selectorInt++;
                  return Text('int --build次数$selectorInt');
                },
                selector: (_, provider) => provider.position,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
