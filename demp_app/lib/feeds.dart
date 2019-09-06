import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'env_keys.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'context.dart';

class NewsFeedPage extends StatelessWidget {
  static String tag = "NewsFeedPage-tag";
  NewsFeedPage(this.text);
  final int text;

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    String title;
    if (text == 1) {
      title = "Top Malaysia Business";
    } else if (text == 2) {
      title = "Times Magazines";
    } else if (text == 3) {
      title = "BBC News";
    } else if (text == 4) {
      title = "Apple";
    } else if (text == 5) {
      title = "Huawei";
    } else if (text == 6) {
      title = "Wall street journal";
    }
    return Scaffold(
      appBar: AppBar(
        title: new Text("$title Headlines",
            style: new TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: new SafeArea(
          child: new Column(
        children: [
          new Expanded(
            flex: 1,
            child: new Container(
                width: width,
                color: Colors.black12,
                child: new GestureDetector(
                  child: new FutureBuilder<List<News>>(
                    future: fatchNews(
                        http.Client(), text), // a Future<String> or null
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);

                      return snapshot.hasData
                          ? NewsList(news: snapshot.data)
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                )),
          ),
        ],
      )),
    );
  }
}

Future<List<News>> fatchNews(http.Client client, id) async {
  String url;
  if (id == 1) {
    url = Constant.baseUrl +
        "top-headlines?country=my&category=business&apiKey=" +
        Constant.key;
  } else if (id == 2) {
    url = Constant.baseUrl +
        "everything?q=time&sortBy=publishedAt&apiKey=" +
        Constant.key;
  } else if (id == 3) {
    url = Constant.baseUrl +
        "top-headlines?sources=bbc-news&apiKey=" +
        Constant.key;
  } else if (id == 4) {
    url = Constant.baseUrl +
        "everything?q=apple&sortBy=publishedAt&apiKey=" +
        Constant.key;
  } else if (id == 5) {
    url =
        Constant.baseUrl + "everything?q=huawei&sortBy=popularity&apiKey=" + Constant.key;

  } else if (id == 6) {
    url =
        Constant.baseUrl + "everything?domains=wsj.com&apiKey=" + Constant.key;
  }
  final response = await client.get(url);
  return compute(parsenews, response.body);
}

List<News> parsenews(String responsebody) {
  final parsed = json.decode(responsebody);
  return (parsed["articles"] as List)
      .map<News>((json) => new News.fromJson(json))
      .toList();
}

class News {
  String auther;
  String title;
  String description;
  String url;
  String imageUrl;

  News({this.auther, this.title, this.description, this.url,this.imageUrl});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      auther: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      imageUrl: json['urlToImage'] as String,
    );
  }
}

class NewsList extends StatelessWidget {
  final List<News> news;

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
              right: new BorderSide(width: 1.0, color: Colors.black12))),
              // child: Icon(Icons.event_note, color: Colors.white),
              child: Image.network(news[index].imageUrl,height: 100,width: 70),
        ),
            title: Text(news[index].title),
            onTap: () {
              var imageUrl = news[index].imageUrl;
              var title = news[index].title;
              var descrioption = news[index].description;
              var name = news[index].auther;
              var url =news[index].url;
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new DescriptionPage(name,url,imageUrl,title,descrioption),
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