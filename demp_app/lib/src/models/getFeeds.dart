import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../mixin/env_keys.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import './newsList.dart';


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
        backgroundColor:Color.fromRGBO( 71, 107, 158, 7.0),
        title: new Text("$title Headlines",
            style: new TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color:Color.fromRGBO(227, 227, 227, 7.0)),
      ),
      body: new SafeArea(
          child: new Column(
        children: [
          new Expanded(
            flex: 1,
            child: new Container(
                width: width,
                color: Color.fromRGBO(227, 227, 227, 7.0),
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
    url = KeyVal.baseUrl +
        "top-headlines?country=my&category=business&apiKey=" +
        KeyVal.key;
  } else if (id == 2) {
    url = KeyVal.baseUrl +
        "everything?q=time&sortBy=publishedAt&apiKey=" +
        KeyVal.key;
  } else if (id == 3) {
    url = KeyVal.baseUrl +
        "top-headlines?sources=bbc-news&apiKey=" +
        KeyVal.key;
  } else if (id == 4) {
    url = KeyVal.baseUrl +
        "everything?q=apple&sortBy=publishedAt&apiKey=" +
        KeyVal.key;
  } else if (id == 5) {
    url =
        KeyVal.baseUrl + "everything?q=huawei&sortBy=popularity&apiKey=" + KeyVal.key;

  } else if (id == 6) {
    url =
        KeyVal.baseUrl + "everything?domains=wsj.com&apiKey=" + KeyVal.key;
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
