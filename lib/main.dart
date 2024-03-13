import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _heightSlidervalue = 170;
  double _weightSliderValue = 70;
  int _bmi = 0;
  String _message = "";

  @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBar(title:Text("BMI Calculator"), backgroundColor: Colors.red,),
       body:Column(
         children: [
           Text("BMI Calculator", style: TextStyle(color: Colors.red, fontSize: 32),),
           Text("We care about your health", style: TextStyle(fontSize: 20),),
           Image.network("https://www.cdc.gov/healthyweight/images/assessing/bmi-adult-fb-600x315.jpg"),
           SizedBox(height: 8,),
           Text("Height: ${_heightSlidervalue.round()} (cm)", style: TextStyle(fontSize: 28),),
           Slider(
             value: _heightSlidervalue,
             max: 220,
             onChanged: (double value) {
               setState(() {
                 _heightSlidervalue = value;
               });
             },
           ),
           SizedBox(height: 8,),
           Text("Weight: ${_weightSliderValue.round()}(kg)", style: TextStyle(fontSize: 28),),
           Slider(
             value: _weightSliderValue,
             max: 180,
             onChanged: (double value) {
               setState(() {
                 _weightSliderValue = value;
               });
             },
           ),
           SizedBox(height: 8,),
           _bmi != 0 ? Text("Your BMI is $_bmi") : SizedBox(),v
           SizedBox(height: 8,),
           Text(_message),
           TextButton.icon(onPressed: () {

             //Create a local variable
             //This variable can only be used within
             var bmiTemp = _weightSliderValue /pow((_heightSlidervalue / 100),2);
             print(bmiTemp);


            // _bmi = bmiTemp.round();

             var messageTemp = "";
             if (bmiTemp < 18) {
               messageTemp = "You are underweight";

             } else if (bmiTemp <25) {
               messageTemp = "You are normal";

             } else if (bmiTemp <30) {
               messageTemp = "You are overweight";

             } else if (bmiTemp <35) {
               messageTemp = "You are obese";
             }
             else {
               messageTemp = "You are extremely obese";

             }

             setState(() {
               _bmi = bmiTemp.round();
               _message = messageTemp;
             });

           }, icon: Icon(Icons.favorite), label: Text("Calculate BMI")),

    ],
  ),
  );

    }


}

