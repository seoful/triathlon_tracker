import 'package:flutter/material.dart';
import 'package:triathlon_tracker/presentation/onbording2.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFE0F0FF)),
      home: MyCustomForm()
      );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
     body:SingleChildScrollView(
       child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       Container(
       padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 72.0),
       decoration: const BoxDecoration(
       borderRadius: BorderRadius.all(Radius.circular(40.0))),
    child: const ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    child: LinearProgressIndicator(
    minHeight: 5.0,
    value: 0.2,
    color: Color(0xFF4A4999),
    backgroundColor: Colors.grey,
    ),
    ),
       ),
        Container(
          child: Text("We are glad you joined us! Let's get acquainted", style: TextStyle(color: Colors.grey, fontSize:17 ),),
          padding: EdgeInsets.only(top: 44, bottom:0, left:20, right:20),
        ),
        Container(
          child: Text('Your name is', style: TextStyle(fontSize: 28),),
          padding: EdgeInsets.only(top: 24, bottom:0, left:20, right:20),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.pink, width: 20.0)),
              fillColor: Colors.white,
              filled: true,
              labelText: '|enter your name here',
            ),
          ),
        ),
          Container(

          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 360),
          child: ElevatedButton(
            child: Text('Continue  ➜'),
            style: ElevatedButton.styleFrom(primary: Color(0xFF4A4999)),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Onbording()),
              );
            },
          )
          )
      ],
     ),
    ),
    );
  }
}