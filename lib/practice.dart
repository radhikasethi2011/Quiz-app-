//import 'dart:html';

import 'package:flutter/material.dart';

class practice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
        
          'HELLO',
        
        )
      
      ),
      body: Center(
        child:RaisedButton.icon(
          icon: Icon(
            Icons.mail,
          ),
          label:Text('Account'),
          color: Colors.blueGrey,
          onPressed: (){},
        )
      ),
    );
  }
}