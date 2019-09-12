import 'package:flutter/material.dart';
import './getFeeds.dart';

Card homePageItem(String imageVal,String title, BuildContext context, int number) {
    return Card(
       elevation: 4.0,
        margin: new EdgeInsets.all(8.0),
     child: InkWell(
        onTap: () {

          var id =number;
          Navigator.push(
            context,
              new MaterialPageRoute(
                builder: (BuildContext context) =>
                    new NewsFeedPage(id),
              ));
            // function gets executed on a tap
        },
  
       
           child: Container(
           decoration: BoxDecoration(color: Color.fromRGBO(192, 192, 192, 7.0)),
          // height: 180,
      
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                  Image.asset(
                          imageVal,
                          alignment: Alignment.center,
                         width: double.infinity,
                         fit: (BoxFit.fitWidth),
                         height:100,                
                ),
                 
                // SizedBox(height: 100),
                new Center(
                  child: new Text(title,
                      style:new TextStyle(
                        fontSize: 18.0, 
                        color: Color.fromRGBO(30, 30, 30, 7.0)),
                        textAlign:TextAlign.center),
                )
                
              ],
            ),
           

          ),

           
    
    ),
    );
        
  }

  

