 import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      title: 'Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Calculator',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: HomePage(),
        backgroundColor: Colors.deepPurple.shade100,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> buttons = [
    'CLR',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'Ans',
    '=',
  ];

  bool isOperator(String x){
    if(x=='/'||x=='*'||x=='-'||x=='+'||x=='%'||x=='=') {
      return true;
    }
    return false;

  }

  void equalPressed(){
    String finalQuestion= userQuestions;

    Parser p = Parser();                      //dependency
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswers = eval.toString();



  }

  var userQuestions='';
  var userAnswers='';
  var finalQuestion;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 50.0,),
              Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.centerLeft,
                child: Text(userQuestions,
                style: TextStyle(
                  fontSize: 20,
                ),),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.centerRight,
                child: Text(userAnswers,
                  style:TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),

        ),
        Expanded(
          flex: 2,
          child: Container(

            child: Center(
              child: GridView.builder(

                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index){


                    if(index==0){
                    return MyButton(
                      buttonTapped: (){

                       setState(() {
                         userQuestions=' ';
                         userAnswers=' ';
                       });
                      },


                        color:Colors.green,
                        textColor:Colors.white,
                        buttonText:buttons[index] );


                  }//CLear
                  if(index==1){
                    return MyButton(
                        buttonTapped: (){
                          setState(() {
                            
                            userQuestions= userQuestions.substring(0, userQuestions.length-1);
                          });

                        },

                        color:Colors.red,
                        textColor:Colors.white,
                        buttonText:buttons[index] );




                  }

                  if(index==buttons.length-1){
                    return MyButton(
                        buttonTapped: (){

                          setState(() {
                            equalPressed();
                          });
                        },


                        color:Colors.black54,
                        textColor:Colors.white,
                        buttonText:buttons[index] );


                  }

                  if(index==buttons.length-2){
                    return MyButton(
                        buttonTapped: (){

                          setState(() {
                            userQuestions=userAnswers;
                          });
                        },


                        color:Colors.deepPurple[50],
                        textColor:Colors.deepPurple,
                        buttonText:buttons[index] );


                  }

                  return MyButton(
                      buttonTapped:() {
                        setState(() {
                          userQuestions += buttons[index];
                        });

                      },
                      color:isOperator(buttons[index])? Colors.deepPurple: Colors.deepPurple.shade50,
                      textColor:isOperator(buttons[index])?Colors.white: Colors.deepPurple,
                      buttonText:buttons[index] );


                  })
            ),
          ),
        )
      ],
    ));
  }
}
