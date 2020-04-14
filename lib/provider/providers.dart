import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/provider/theme_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider.value(value: ThemeProvider()),
];
