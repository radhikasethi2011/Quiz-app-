import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:quiz_app/models/Quiz.dart';
class MainScreen extends StatefulWidget{
  MainScreen({Key key}) : super(key: key);

  @override 
  _MainScreenState createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {
  final String url = "https://opentdb.com/api.php?amount=20&difficulty=easy&type=multiple"; //final - wont change in future
  Quiz quiz;
  List<Results> results;
  @override 
  Widget build(BuildContext context)
  {
    Future<void> fetchQuestions() async
    {
      var response = await http.get(url);
      var jsonData = json.decode(response.body),
      quiz = Quiz.fromJson(jsonData);
      results = quiz.results;
      //print(quiz);

    }
    return Scaffold(
      appBar:AppBar(
        title: Text(
          'TRIVIA',
          style:TextStyle(
            color: Colors.white,
            fontSize:25,
          ),
        ),
      ) ,
      body: FutureBuilder(
        future: fetchQuestions(),
        builder: (BuildContext context, AsyncSnapshot snapshot){

        },
      ),
      );
  }
}