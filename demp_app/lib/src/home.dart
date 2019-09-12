import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import './models/card.dart';
import 'dart:io';






class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0), // here the desired height
        
          child: AppBar(
            centerTitle: true ,
           backgroundColor: Color.fromRGBO(71, 107, 158, 1.0),
        // title: Text("Recode News"),
        
            title:const Icon(Icons.home),
          )
        ),
        // body: // ...
      

      


          body: Container(
          // backgroundColor: Color.fromRGBO(400, 87, 110, 1.0),
          decoration: BoxDecoration(
          color: const Color.fromRGBO(208,  208, 208, 3),
          border: Border.all(
                color: Colors.black,
              ),
            ),
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
          child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(3.0),
              
              children: <Widget>[
                homePageItem("assets/my-min-min.jpg","Business Headlines", context,1),
                homePageItem("assets/time.png","Time", context,2),
                homePageItem("assets/tc.png","TechCrunch", context,3),
                homePageItem("assets/apple.jpg","Apple news", context,4),
                homePageItem("assets/huawei_logo.png","Huawei news", context,5),
                homePageItem("assets/wst.png","Wall Streeth", context,6)
              ],
        
            ),
        
      ),
        floatingActionButton: new FloatingActionButton(
            onPressed: ()=> exit(0),
            tooltip: 'Close app',
            child: new Icon(Icons.close),
            backgroundColor:Color.fromRGBO( 71, 107, 158, 7.0),
          ), 
      );  
  }
}
