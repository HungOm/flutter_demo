// import 'package:flutter/material.dart';
// // import './models/card.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final articleUrl;

  WebViewContainer(this.articleUrl);

  @override
  createState() => _WebViewContainerState(this.articleUrl);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _articleUrl;
  final _key = UniqueKey();

  _WebViewContainerState(this._articleUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: _articleUrl)
              )
          ],
        ));
  }
}

// void main() => runApp(new DescriptionPage(null));

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
//             //  child: SizedBox
//             MaterialApp(
//             //  width:30,
            

//               routes: {
//                 "/": (_) => new WebviewScaffold(
//                       url: urlnews,
//                       // appBar: new AppBar(title: new Text("")),
//                     )
//               },
//             ),
//         ],
             
//         ),
//       ),
//     );
//   }
// }