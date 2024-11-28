import 'package:flutter/material.dart';
import 'package:news_app_record/model/response.dart';
import 'package:news_app_record/network/net_client.dart';
import 'package:news_app_record/widget/items_news.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'News App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<ResponseNews>(
          future: NetClient().fetchByProvider(
              provider: currentIndex == 0 ? 'cnn-news' : 'cnbc-news'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Mengambil data')
                  ],
                ),
              );
            } else if (snapshot.hasError || snapshot.data == null) {
              return Center(
                child: Text('errr: $snapshot.error'),
              );
            } else {
              final news = snapshot.data!.data;
              return ListView.builder(
              itemCount: news!.length,
              itemBuilder: (context, index) {
                return ItemsNews(news: news[index]);
              },
            );
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/cnn.png'),
              color: Colors.red,
            ),
            label: "CNN News",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/cnbc.png'),
            ),
            label: "CNBC News",
          ),
        ],
      ),
    );
  }
}
