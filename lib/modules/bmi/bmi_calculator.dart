import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled2/modules/bmi_resulte/bmi_resulte.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {

  bool isMale = true;

  double height = 150 ;

  int weight = 40 ;

  int age = 40 ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CLCULATOR",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true;

                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image:AssetImage( "assets/images/men.png" ),
                              height: 100.0,
                              width: 90.0,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "MALE",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isMale ? Colors.blue: Colors.grey  [400] ,
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(
                    width: 15,
                  ),
                  
                  Expanded(
                    child: GestureDetector(
                       onTap: (){
                        setState(() {
                          isMale = false ;

                        });
    },
                      child: Container (
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Image(
                              image:AssetImage( "assets/images/woman.jpg" ),
                              height: 100.0,
                              width: 90.0,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "FEMALE",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: !isMale? Colors.blue : Colors.grey[400],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HIGHT",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,

                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${height.round()}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45.0,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "cm",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: height,
                      max: 250,
                      min: 80,
                      onChanged:( value){
                        setState(() {
                          height = value ;
                        });
                        print(value.round());
                      } ,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded (
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,

                            ),
                          ),
                          Text(
                            "$weight",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 45.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                                heroTag: "weight-",
                                mini: true,
                              child: Icon(Icons.remove,),
                              ),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                                heroTag: 'weight+',
                                mini: true,
                                child: Icon(Icons.add,),
                              ),

                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),

                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded (
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "age",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,

                            ),
                          ),
                          Text(
                            "$age",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 45.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                                heroTag:"age-" ,
                                mini: true,
                                child: Icon(Icons.remove,),
                              ),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                                heroTag:"age+",
                                mini: true,
                                child: Icon(Icons.add,),
                              ),

                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),

                    ),
                  ),

                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.blue,
            child: MaterialButton(onPressed: (){
              double result = weight / pow(height / 100, 2);
              print(result.round());
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BMIResulteScreen(
                  age: age,
                  resulte:result.round() ,
                  isMale: isMale,
                ),
                ),
              );
            },
            child: Text(
              "CALCULATE",
            ),
            ),
          ),
        ],
      ),
    );
  }
}
// var resulte = weight / pow(height / 100, 2);
// print ( resulte.rounf());