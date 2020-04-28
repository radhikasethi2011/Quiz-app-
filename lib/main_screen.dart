import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      body: RefreshIndicator(
        onRefresh: fetchQuestions,
              child: FutureBuilder(
          future: fetchQuestions(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.connectionState == ConnectionState.done)
              {
                return Container(
                  child: getQuestionsList(),

                );
              }
              else{
                return Center(
                  child:CircularProgressIndicator(),
                );
              }
          },
        ),
      ),
      );
  }//buld method ends. 
  ListView getQuestionsList()//returning a list view of widgets
  {
    return ListView.builder( //builder increments the index for the whole length of the widgets. (for itemCount length)
      itemCount: results.length, //total items = no of results. 
      itemBuilder: (BuildContext context, int index){
        return Card(
          child: ExpansionTile(
            title : ListTile(
              title : Text(results[index].question, 
              style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle : Text(results[index].category, 
              style: TextStyle(fontStyle: FontStyle.italic),
              ),

            ),
            children: results[index].allAnswers.map((option)//now for displaying all the answers. mapping List to widget
            {
              return AnswerWidget(results, index, option);
              
            }).toList(),

            
          ),
        );
      },
    );
  }
}

class AnswerWidget  extends StatefulWidget {
  final List<Results> results;
  final int index;
  final String option;
  AnswerWidget(this.results, this.index, this.option);
  @override 
  _AnswerWidgetState createState() =>  _AnswerWidgetState();

  
}

class _AnswerWidgetState extends State<AnswerWidget> {
  @override
  Color tick;
  Widget build(BuildContext context) {
      return ListTile(
      onTap: (){
       
       setState(() {
          if(widget.option == widget.results[widget.index].correctAnswer)
        {
          tick = Colors.green;
        }
        else
        {
          tick = Colors.red;
        }
       });
      },
        title: Text(
          widget.option, 
          textAlign: TextAlign.center, 
          style: TextStyle(color: tick)), 
      );
    
  }
}