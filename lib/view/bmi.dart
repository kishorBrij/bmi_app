import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result ="";

  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           centerTitle: true,
           title: Text("Your BMI"),
         ),

      body: SingleChildScrollView(
        child: Container(
          color: Colors.orange,
          child: Center(
            child: Container(

              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BMI',style: TextStyle(
                    fontSize: 30,fontWeight: FontWeight.bold,
                  ),),

                  SizedBox(height: 20,),

                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('enter your weight in kgs'),
                      prefixIcon: Icon(Icons.line_weight)
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 11,),

                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text('enter your height in feet'),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 11,),

                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                        label: Text('enter your height in inch'),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 16,),

                  ElevatedButton(
                      onPressed:(){

                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();

                        if(wt !="" && ft !="" && inch!=""){
                          //BMI calculate

                          var iWt = int.parse(wt);
                          var iFt = int.parse(ft);
                          var iInch = int.parse(inch);

                          var tInch = (iFt*12)*iInch;

                          var tCm = tInch*2.54;

                          var tM =tCm/100;

                          var bmi = iWt/(tM*tM);

                          var  msg ="";

                          if(bmi>25){
                            msg ="You are OverWeight!!";
                            bgColor = Colors.red;
                          }else if(bmi<18){
                            msg = "you are UnderWeight!!";
                            bgColor = Colors.blue;
                          }else{
                            msg = "you are healthy!! ";
                            bgColor = Colors.green;
                          }

                        setState(() {
                          result = "$msg \n your BMI is : ${bmi.toStringAsFixed(2)}";
                        });


                        }else{
                          setState(() {
                            result = "Please fill all the required blanks";
                          });
                        }

                      },
                      child: Text('Calculate')
                  ),

                  SizedBox(height: 11,),
                  Text(result,style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
