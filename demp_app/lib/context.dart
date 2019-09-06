// import 'package:flutter/material.dart';
// import 'feeds.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// // void main() => runApp(new DescriptionPage(null));

// class DescriptionPage extends StatelessWidget {
//   static String tag = 'description-page';
//   DescriptionPage(this.urlnews);
//   final String urlnews;
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: new Text(
//           "Full Article",
//           style: new TextStyle(color: Colors.white),
//         ),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: new SafeArea(
//         child: new Column(
//           children: <Widget>[
//             MaterialApp(
//               routes: {
//                 "/": (_) => new WebviewScaffold(
//                       url: urlnews,
//                       appBar: new AppBar(title: new Text("")),
//                     )
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
// import 'feeds.dart';
import 'package:link/link.dart';

// void main() => runApp(new DescriptionPage(null));

class DescriptionPage extends StatelessWidget {
  static String tag = 'description-page';
  
  DescriptionPage(this.name,this.url,this.imageUrl,this.title,this.descritption);
  final imageUrl;
  final title;
  final  descritption;
  final name;
  final url;
  Widget build(BuildContext context) {



        final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // SizedBox(height: 120.0),
       
        
        SizedBox(height: 10.0, width: MediaQuery.of(context).size.width,
),
        
        Flexible(
          child:Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),),

        Container(
          width: 130.0,
                    // width: MediaQuery.of(context).size.width,

          child: new Divider(color: Colors.green),
        ),

           Text(
          "by $name",
          style: TextStyle(color: Colors.white24, fontSize: 20.0),
        ),
        // SizedBox(height: 30.0),
       
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            // padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
              child: Image.network(imageUrl,fit:BoxFit.cover),
            ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .4)),
          child: Center(
            child: topContentText,
          ),
        ),
       
      ],
    );

    final bottomContentText = Text(
      
      descritption,
      style: TextStyle(fontSize: 19.5),
      overflow: TextOverflow.clip,
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        width: MediaQuery.of(context).size.width*1.2,
        child: RaisedButton(
          onPressed: () => {
          },
          color: Color.fromRGBO(58, 66, 86, 1.0),
          // width:width;
          child:
              Text("link", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Full article page',
          style: new TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
  
  



      body: new SafeArea(
        child: new Column(
          children: <Widget>[
              topContent, 
              bottomContent

          ],
        ),
      ),
    );
  }
}