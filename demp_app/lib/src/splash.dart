import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}




class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(71, 107, 158, 3.5),
      body: new Center(
          child: ColorizeAnimatedTextKit(
          // duration: Duration(milliseconds: 5000),
          
          onTap: () {
              print("Tap Event");
            },
        
          text: [
            "my News",
            // "Word's Top News"
          ],
          
    
    
          textStyle: TextStyle(
            
              fontSize: 50.0, 
              fontFamily: "Horizon",
              color:Color.fromRGBO(158,149,71,3.0),
          ),
          colors: [
          
            Color.fromRGBO(158,149,71,3.0),
            Color.fromRGBO(158,149,71,3.0),
            // dark-brown 
            Color.fromRGBO(192, 192, 192,3.0),
            Color.fromRGBO(208,  208, 208,3.0),
            Color.fromRGBO(158,149,71,3.0),
            Color.fromRGBO(158,149,71,3.0),

            // Colors.red,
          ],
   
    
  ),
),
      // ),
    );
  }
}



// class FullPage extends StatefulWidget {


//   @override
//   _MyAppState createState() => _MyAppState();

// }

// class _MyAppState extends State<FullPage> {

//    void _opennewpage() {
//     Navigator.of(context).pushNamed('/widget');
//   }
 

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//           appBar: AppBar(
//             title: Text("Sample App"),
//           ),
//           body: new SafeArea(
//             child: new RaisedButton(
//               child: Text('Open Link'),
//               onPressed: () { 
//                 _opennewpage();                               
//               }
//             ) ,
//           )
//     ); 
//   }

// }


