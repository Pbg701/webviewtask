import 'package:flutter/material.dart';


import '../models/url_model.dart';

class UrlProvider with ChangeNotifier {
  UrlModel _currentUrl = UrlModel('https://docs.flutter.dev/packages-and-plugins/using-packages');

  String get currentUrl => _currentUrl.url;

  void updateUrl(String newUrl) {
    _currentUrl = UrlModel(newUrl);
    notifyListeners();
  }
}
