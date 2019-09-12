import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../env_keys.dart';
// import 'dart:async';
// import 'dart:convert';
import 'package:flutter/foundation.dart';
import './fullArticle.dart';




class News {
  String author;
  String title;
  String description;
  String url;
  String imageUrl;
  String website;

  News({this.author, this.title, this.description, this.url,this.imageUrl,this.website});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      // source = Source.fromJson(json['source']) as String,
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      imageUrl: json["urlToImage"] as String,
      website: json["source"]["name"] as String);
      
  }
}

class NewsList extends StatelessWidget {
  final List<News> news;
  // final List<Source>source;

  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
         scrollDirection: Axis.vertical,
        shrinkWrap: true,
      itemCount: news.length,
      itemBuilder: (context, index) {
        return new Card(
          child: new ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
             leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              
              decoration: new BoxDecoration(
                
              border: new Border(
              right: new BorderSide(width: 1.0, color: Color.fromRGBO(30, 30, 30, 7.0)))),
              // child: Icon(Icons.event_note, color: Colors.white),
              child: Image.network(
                news[index].imageUrl ?? "https://dummyimage.com/300x200/000/fff",height: 140,width: 70),
        ),
            title: Text(news[index].title),
            onTap: () {
              var imageUrl = news[index].imageUrl ?? "https://dummyimage.com/300x200/000/fff";
              var title = news[index].title;
              var description = news[index].description;
              var author = news[index].author ?? "author unknown";
              var url =news[index].url;
              // print()
              var web = news[index].website ?? "no name available";
              // print(web);
              // var name = source[index].name;
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new FullArticlePage(author,url,imageUrl,title,description,web),
                  ));
            },
          ),

          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          // body: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),

        );
      },
    );
  }
}

// Future<List<News>> fatchNews(http.Client client, id) async {
//   String url;
//     url = KeyVal.baseUrl +
//         "top-headlines?country=my&category=business&apiKey=" +
//         KeyVal.key;
//   }