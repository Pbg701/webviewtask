import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:webviewtask/controller/url_provider.dart';

import 'presentation/screens/home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UrlProvider()),
      ],
      child: MaterialApp(
        title: 'WebView Gaming Platform',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}
