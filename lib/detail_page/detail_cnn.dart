import 'package:flutter/material.dart';
import 'package:news_app_record/model/response.dart' as response;

class DetailCnn extends StatelessWidget {
  final response.Data news;
  const DetailCnn({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Padding(padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(news.title ?? 'judul tidak tersedia',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
          ),
          SizedBox(height: 20,),
            Center(
               child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  news.image?.large ?? '',
                  width: 400,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 200);
                  },
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(news.contentSnippet ?? ' Deskripsi tidak tersedia', style: TextStyle(fontSize: 17),),
            Text(news.isoDate ?? 'Tanggal Tidak tersedia', style: TextStyle( 
              fontSize: 14,
              color: Colors.grey
            ),)
        ],

        )
      ,
      ),
    );
  }
}