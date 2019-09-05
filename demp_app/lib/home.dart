import 'package:flutter/material.dart';
import 'feeds.dart';
class Dashboard extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
       appBar: AppBar(
        title: Text("Recode News"),
        elevation: 8.8,
        backgroundColor: Color.fromRGBO(77, 77, 77, 1.0),
      ),


          body: Container(
          // backgroundColor: Color.fromRGBO(400, 87, 110, 1.0),
          decoration: BoxDecoration(
    color: const Color(0xFFCCCCCC),
    // image: DecorationImage(
    //   image: ExactAssetImage('assets/.jpeg'),
    //   fit: BoxFit.cover,
    // ),
    border: Border.all(
      color: Colors.black,
      // width: 8.0,
    ),
  ),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          
          children: <Widget>[
            makeDashboardItem("assets/business.jpg","Business Headlines", context,1),
            makeDashboardItem("assets/time-magazine.jpg","Time", context,2),
            makeDashboardItem("assets/tc.png","TechCrunch", context,3),
            makeDashboardItem("assets/apple.jpg","Apple news", context,4),
            makeDashboardItem("assets/huawei.png","Huawei news", context,5),
            makeDashboardItem("assets/wsj.jpeg","Wall Streeth", context,6)
          ],
    
        ),
      ),

      );
      
  }
}

Card makeDashboardItem(String imageVal,String title, BuildContext context, int number) {
    return Card(
       elevation: 1.0,
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
          decoration: BoxDecoration(color: Color.fromRGBO(117, 117, 117, 1.0)),
      
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                // SizedBox(height: 60.0),
                // Center(
                  //   child: Icon(
                  // icon,
                  // size: 40.0,
                  // color: Colors.white,

                  Image.asset(
                          imageVal,
                          alignment: Alignment.center,
                          width: 120.0,
                          height: 100.0,
                            


                  
                ),
                 
                // SizedBox(height: 60),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.white),
                        textAlign:TextAlign.center),
                )
              ],
            ),
           

          ),

           
    
    ),
    );
        
  }