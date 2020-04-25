import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QUIZ APP',
          style: TextStyle(
            color: Colors.black,

          ),
        ), 
        backgroundColor: Colors.blue,
        
        ),
         body: Stack(
           children: <Widget>[

             new Container(
               decoration: BoxDecoration(
                 image: new DecorationImage(
                 image: new AssetImage("assets/images/background.jpeg"),
                 fit: BoxFit.fill,
                 ),
               ),
             ),
             Padding(
               padding: EdgeInsets.all(20),
               child: Center(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: 30,//to give space below the app bar. 
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: RaisedButton( //to add text, child again
                          child: Text(
                            'Start Game',
                            style: TextStyle(
                              fontSize: 35,
                            ),
                          ),
                          color: Colors.red,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)
                          ),
                          onPressed: (){},

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: RaisedButton( //to add text, child again
                          child: Text(
                            'Levels',
                            style: TextStyle(
                              fontSize: 35,
                            ),
                          ),
                          color: Colors.red,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)
                          ),
                          onPressed: (){},

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: RaisedButton( //to add text, child again
                          child: Text(
                            'About Us',
                            style: TextStyle(
                              fontSize: 35,
                            ),
                          ),
                          color: Colors.red,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)
                          ),
                          onPressed: (){},

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: RaisedButton( //to add text, child again
                          child: Text(
                            'Share',
                            style: TextStyle(
                              fontSize: 35,
                            ),
                          ),
                          color: Colors.red,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)
                          ),
                          onPressed: (){},

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: RaisedButton( //to add text, child again
                          child: Text(
                            'Exit',
                            style: TextStyle(
                              fontSize: 35,
                            ),
                          ),
                          color: Colors.red,
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)
                          ),
                          onPressed: (){
                            SystemNavigator.pop();
                          },
                        ),
                      ),
                    ],
                 )
               ),
             ),
           ],

         ),
      );
    
  }
}