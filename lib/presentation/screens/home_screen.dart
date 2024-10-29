import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewtask/controller/url_provider.dart';


import 'webview_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Function to open external links in the browser
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        children: [
          const ListTile(title: Text('Game 1 (Internal WebView)')),
          ElevatedButton(
            onPressed: () {
              context.read<UrlProvider>().updateUrl('https://www.crazygames.com/');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WebViewScreen()),
              );
            },
            child: const Text('Open WebView'),
          ),
          const Divider(),
          // External links in containers
          const ListTile(
            title: Text('Top Gaming Websites'),
          ),
          GestureDetector(
            onTap: () => _launchUrl("https://www.similarweb.com/top-websites/games/"),
            child: Container(
              color: Colors.blueAccent,
              padding: const EdgeInsets.all(20),
              child: const Center(child: Text("Visit SimilarWeb Games", style: TextStyle(color: Colors.white))),
            ),
          ),
          GestureDetector(
            onTap: () => _launchUrl("https://www.crazygames.com/"),
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(20),
              child: const Center(child: Text("Visit CrazyGames", style: TextStyle(color: Colors.white))),
            ),
          ),
          GestureDetector(
            onTap: () => _launchUrl("https://aelieve.com/rankings/websites/category/gaming/best-gaming-websites/"),
            child: Container(
              color: Colors.orange,
              padding: const EdgeInsets.all(20),
              child: const Center(child: Text("Visit Aelieve Rankings", style: TextStyle(color: Colors.white))),
            ),
          ),
          GestureDetector(
            onTap: () => _launchUrl("https://www.gamestheshop.com/?srsltid=AfmBOorYCfAMPNuh_JgfM5Im6OKspH4591gr1KBNiOEuifqG--KCGq5J"),
            child: Container(
              color: Colors.redAccent,
              padding: const EdgeInsets.all(20),
              child: const Center(child: Text("Visit GamesTheShop", style: TextStyle(color: Colors.white))),
            ),
          ),
        ],
      ),
    );
  }
}
