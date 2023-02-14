import 'package:flutter/material.dart';

class BMIResulteScreen extends StatelessWidget {

  final int resulte ;
  final bool isMale    ;
  final int    age     ;

  BMIResulteScreen({
  required this.age,
  required this.isMale,
required   this.resulte,
});


  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text(
          " BMIRESULTE ",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " Gender : ${isMale? "male" : "female" } ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              " resulte : $resulte ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,

              ),
            ),
            Text(
              " age : $age ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,

              ),
            ),

          ],
        ),
      ),
    );
  }
}
