import 'package:flutter/material.dart';
import 'package:news_app_record/detail_page/detail_cnn.dart';
import 'package:news_app_record/model/response.dart' as response;

class ItemsNews extends StatelessWidget {
    final response.Data news;
  const ItemsNews({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailCnn(news: news)));
            },
            child: Card(
              child: Padding(padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        news.image?.large ?? '',
                        width: 200,
                        height: 120,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image, size: 100);
                        },
                      ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(news.title ?? 'no title', 
                    maxLines: 2, 
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 16
                    ),
                    ))
                ],
              ),

              ),
            ),
          )
        ],
      ),
    );
  }
}
