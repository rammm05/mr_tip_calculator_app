import 'package:flutter/material.dart';

class MrTipCalc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MrTipCalcState();
}

class MrTipCalcState extends State<MrTipCalc>{

  TextEditingController billController = TextEditingController();
  TextEditingController tipController = TextEditingController();

  int? tipSelected;

  num? selectedTipPercentage;


  int splitCurrentTotal = 1;

  num enteredBill = 0;
  num totalTip = 0;

  num totalBill = 0;
  num totalPPerson = 0;

  calcFunc(){
    enteredBill = int.tryParse(billController.text) ?? 0;
    if(selectedTipPercentage != null && tipController.text.isEmpty){
      totalTip = selectedTipPercentage!;
    } else {
      totalTip = int.tryParse(tipController.text) ?? 0;
    }

    totalBill = enteredBill+totalTip!;
    totalPPerson = totalBill/splitCurrentTotal;
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Padding(
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 40, top: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getTitle(),
              SizedBox(height: 10),
              getCard(),
              SizedBox(height: 30),
              enterBill(),
              SizedBox(height: 30),
              chooseTip(),
              Container(height: 30),
              splitTotal(),
              //Container(height: 30),
              /*SizedBox(
                height: 60,
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,

                    ),
                      onPressed: (){
                        calcFunc();
                      }, child: Text("Calculate",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white
                  ),)))*/
            ],
          ),
        ),
      ),
    );
  }

  ///...title part1
  Widget getTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.local_cafe_outlined, size: 70),
        Text(
          "Mr TIP \nCalculator",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  ///...card part2
  Widget getCard() {
    return Card(
      elevation: 11,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              child: Text(
                "Total p/person",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                "${totalPPerson.toStringAsFixed(0)} RS",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 45),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.black,
            ), //line
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text("Total Bill", style: TextStyle(fontSize: 20)),
                        Text(
                          "${totalBill.toStringAsFixed(0)} RS",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text("Total Tip", style: TextStyle(fontSize: 20)),
                        Text(
                          "${totalTip!.toStringAsFixed(0)} RS",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///...enterBill part3
  Widget enterBill() {
    return Row(
      children: [
        Expanded(
          child: Container(
            //height: 80,
            //color: Colors.red,
            child: Text(
              "Enter \nyour bill",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            //height: 200,
            child: TextField(
              onSubmitted: (value){
                calcFunc();
              },
              controller: billController,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                label: Text(
                  "\$",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
              ),
            ),
          ),
        ),
      ],
    );
  }

  ///...chooseTip part4
  Widget chooseTip(){
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 130,
            //color: Colors.red,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Choose \nyour tip",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            //height: 200,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){
                        selectedTipPercentage = enteredBill*0.10;
                        tipSelected == 1 ? tipSelected =0 : tipSelected =1;
                        calcFunc();
                      },
                      child: Container(
                        width: 70,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(10),
                          border: tipSelected == 1? Border.all(width: 5) : null
                          //border: BoxBorder.all(),
                        ),
                        child: Center(
                          child: Text(
                            "10%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        selectedTipPercentage = enteredBill*0.15;
                        tipSelected == 2 ? tipSelected =0 : tipSelected =2;
                        calcFunc();
                      },
                      child: Container(
                        width: 70,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(10),
                            border: tipSelected == 2? Border.all(width: 5) : null
                          //border: BoxBorder.all(),
                        ),
                        child: Center(
                          child: Text(
                            "15%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        selectedTipPercentage = enteredBill*0.20;
                        tipSelected == 3 ? tipSelected =0 : tipSelected =3;
                        calcFunc();
                      },
                      child: Container(
                        width: 70,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(10),
                            border: tipSelected == 3? Border.all(width: 5) : null
                          //border: BoxBorder.all(),
                        ),
                        child: Center(
                          child: Text(
                            "20%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  onSubmitted: (value){
                    tipSelected = 4;
                    setState(() {

                    });
                    calcFunc();
                  },
                  controller: tipController,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: tipSelected == 4 ? BorderSide(width: 5) : BorderSide.none ),
                    filled: true,
                    fillColor: Colors.lightBlueAccent,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    ),
                    hint: Center(
                      child: Text(
                        "Custom tip",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ///...splitTotal part5
  Widget splitTotal(){
    return Row(
      children: [
        Expanded(
          child: Container(
            //height: 130,
            //color: Colors.red,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Split \nthe total",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            //height: 200,
              children: [
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: (){
                      if(splitCurrentTotal > 1){
                        splitCurrentTotal--;
                      }
                      calcFunc();
                    },
                    child: Container(
                      width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(15)),
                        //border: BoxBorder.all(),
                      ),
                      child: Center(
                        child: Text(
                          "-",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 70,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //borderRadius: BorderRadius.circular(10),
                      //border: BoxBorder.all(),
                    ),
                    child: Center(
                      child: Text(
                        "${splitCurrentTotal}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          //color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: (){
                      splitCurrentTotal++;
                      calcFunc();
                    },
                    child: Container(
                      width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(15)),
                        //border: BoxBorder.all(),
                      ),
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ]
          ),
        ),
      ],
    );
  }


}
