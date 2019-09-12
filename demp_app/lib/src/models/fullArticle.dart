
import 'package:flutter/material.dart';
import '../webPage.dart';
// import 'package:link/link.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';



class FullArticlePage extends StatelessWidget {
  static String tag = 'description-page';
  
  FullArticlePage(this.author,this.url,this.imageUrl,this.title,this.descritption,this.web);
  final imageUrl;
  final title;
  final  descritption;
  final author;
  final url;
  final web;
  Widget build(BuildContext context) {



        final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // SizedBox(height: 120.0),
       
        
        SizedBox(height: 50.0, width: MediaQuery.of(context).size.width,
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

        SizedBox(height: 30.0),



            Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,

                children: <Widget>[
                  
                  Text('$web',style: TextStyle(fontSize: 20.2,color:Colors.white),overflow: TextOverflow.ellipsis,),
                
                  Text('$author',style: TextStyle(fontSize: 13.2,color:Colors.white),overflow: TextOverflow.clip,maxLines: 1,),
                ],
              ),

                   
            //         ),
            // var randomVariable = "MMMM";

          ],
        ),

     
       
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



          onPressed: () {

            WebViewContainer(url);

            // var urlm = url;
            // print(urlm);
            //   Navigator.push(
            //       context,
            //       new MaterialPageRoute(
            //         builder: (BuildContext context) => new DescriptionPage(urlm),
            //       ));
          },
          color: Color.fromRGBO( 71, 107, 158, 1.0),
          // width:width;
          child:
              Text("Read full story", style: TextStyle(color: Colors.white)),
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
        backgroundColor: Color.fromRGBO( 71, 107, 158, 2.0),
        title: new Text(
          '$web',
          style: new TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
  
  



      body: new SafeArea(
        child: new Column(
          children: <Widget>[
              topContent, 
              bottomContent,          
              

          ],
        ),
      ),
    );
  }
}


// void main() => runApp(new FullPage(null));

// class FullPage extends StatelessWidget {
//   static String tag = 'web-page';
//   FullPage(this.urlnews);
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
  
//           ],
//         ),
//       ),
//     );
//   }
// }
