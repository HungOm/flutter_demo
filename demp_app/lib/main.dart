import 'package:flutter/material.dart';
import 'src/home.dart';
import 'src/models/getFeeds.dart';
import 'src/models/fullArticle.dart';
import 'src/splash.dart';


void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    
    HomePage.tag: (context) => HomePage(),
    FullArticlePage.tag: (context) => FullArticlePage(null,null,null,null,null,null),
    NewsFeedPage.tag: (context) => NewsFeedPage(null)
    // FullPage.tag: (context) => FullPage(null)
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primaryColor: Color.fromRGBO(71, 107, 158, 1.0)),
      home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => new HomePage()
      // home: HomePage(),
    }
      // routes: routes,
      
    );
    
  }
}

