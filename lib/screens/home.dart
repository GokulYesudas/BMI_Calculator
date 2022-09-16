import 'package:flutter/material.dart';
import 'package:untitled1/widgets/left_bar.dart';

import '../widgets/right_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiResult = 0;
  String textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title:Text("BMI Calculator",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.amberAccent,
          fontSize: 30,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic
        ),)
      ),
      body:
      SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: heightController,
                    style: TextStyle(
                      fontSize: 42,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    color:Colors.amberAccent),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height(in m)",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color:Colors.white70,
                      )
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: weightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        color:Colors.amberAccent),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight(in kg)",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color:Colors.white70,
                        )
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),

            GestureDetector(
              onTap: (){
                double h = double.parse(heightController.text);
                double w = double.parse(weightController.text);
                setState(() {
                  bmiResult = w/(h*h);
                  if(bmiResult > 25){
                    textResult = "You're Overweight";
                  }
                  else if(bmiResult>=18.5 && bmiResult<=25){
                    textResult = "You have normal BMI";
                  }
                  else{
                    textResult = "You're underweight";
                  }
                });

              },
              child: Container(
                child: Text("Calculate",
                  style: TextStyle(fontSize: 22,fontWeight:FontWeight.bold,color: Colors.amberAccent ,fontStyle: FontStyle.italic),),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              child: Text(bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90,fontWeight:FontWeight.bold,color: Colors.amberAccent, fontStyle: FontStyle.italic ),),
            ),
            SizedBox(height: 20,),
            Visibility(
              visible: textResult.isNotEmpty,
              child: Container(
                child: Text(textResult,
                  style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color: Colors.amberAccent,fontStyle: FontStyle.italic ),),
              ),
            ),

            SizedBox(height: 50,),
            LeftBar(barWidth: 40),
            SizedBox(height: 10,),
            LeftBar(barWidth: 70,),
            SizedBox(height: 10,),
            LeftBar(barWidth: 40,),
            SizedBox(height: 10,),
            RightBar(barWidth: 40),
            SizedBox(height: 10,),
            RightBar(barWidth: 70,),
            SizedBox(height: 10,),
            RightBar(barWidth: 40,),

          ],
        ),
      ),

    );
  }
}

