import 'package:flutter/material.dart';


import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewtask/controller/url_provider.dart';
import 'package:webviewtask/presentation/widgets/progress_indicator.dart';


class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  WebViewController? _controller;  // Make _controller nullable
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    final url = context.watch<UrlProvider>().currentUrl;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gaming Platform'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              //Check if _controller is initialized before calling reload
              if (_controller != null) {
                _controller!.reload();
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadRequest(Uri.parse(url))
              ..setNavigationDelegate(
                NavigationDelegate(
                  onPageStarted: (_) => setState(() => _isLoading = true),
                  onPageFinished: (_) => setState(() => _isLoading = false),
                  onWebResourceError: (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Failed to load page")),
                    );
                  },
                ),
              ),
          ),
          if (_isLoading) const Center(child: CustomProgressIndicator()),
        ],
      ),
    );
  }
}
