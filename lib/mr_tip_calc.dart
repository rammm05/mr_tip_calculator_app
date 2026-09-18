import 'package:flutter/material.dart';

class MrTipCalc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MrTipCalcState();
}

class _MrTipCalcState extends State<MrTipCalc> {
  TextEditingController billController = TextEditingController();
  TextEditingController tipController = TextEditingController();

  ///0 -> 10% , 1 -> 15% , 2 -> 20% , 3 -> customTip
  int? tipSelected;

  num enteredBill = 0;
  num? selectedTipPercentage;

  int splitCurrentTotal = 1;

  num totalTip = 0;
  num totalBill = 0;
  num totalPPerson = 0;

  void calcFunc() {
    enteredBill = int.tryParse(billController.text) ?? 0;

    if (selectedTipPercentage != null && tipController.text.isEmpty) {
      totalTip = selectedTipPercentage!;
    } else {
      totalTip = int.tryParse(tipController.text) ?? 0;
    }

    totalBill = enteredBill + totalTip;
    totalPPerson = totalBill / splitCurrentTotal;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade200,
        body: Padding(
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 40, top: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getTitle(),
                SizedBox(height: 20),
                getCard(),
                SizedBox(height: 30),
                enterBill(),
                SizedBox(height: 30),
                chooseTip(),
                SizedBox(height: 30),
                splitTotal(),
              ],
            ),
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
        Icon(Icons.local_cafe_outlined, size: 80),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: "Mr",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "TIP",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            Text(
              "Calculator",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  ///...card part2
  Widget getCard() {
    return Card(
      elevation: 15,
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              "Total p/person",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text.rich(
              TextSpan(
                text: "₹ ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                children: [
                  TextSpan(
                    text: totalPPerson == 0
                        ? "000"
                        : totalPPerson.toInt() == totalPPerson
                        ? totalPPerson.toInt().toString()
                        : totalPPerson.toStringAsFixed(2),
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 45,
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 2,color: Colors.grey,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 10),
                    Text("Total Bill", style: TextStyle(fontSize: 20)),
                    Text.rich(
                      TextSpan(
                        text: "₹ ",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlueAccent,
                        ),
                        children: [
                          TextSpan(
                            text: totalBill == 0
                                ? "000"
                                : totalBill.toInt() == totalBill
                                ? totalBill.toInt().toString()
                                : totalBill.toStringAsFixed(2),
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
                Column(
                  children: [
                    SizedBox(height: 10),
                    Text("Total Tip", style: TextStyle(fontSize: 20)),
                    Text.rich(
                      TextSpan(
                        text: "₹ ",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlueAccent,
                        ),
                        children: [
                          TextSpan(
                            text: totalTip == 0 ? "000" : totalTip.toInt() == totalTip ? totalTip.toInt().toString() : totalTip.toStringAsFixed(2),
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
              ],
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
          child: Text.rich(
            TextSpan(
              text: "Enter\n",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              children: [
                TextSpan(
                  text: "your bill",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: TextField(
            onSubmitted: (value) {
              calcFunc();
            },
            onChanged: (value){
              calcFunc();
            },
            controller: billController,
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              alignLabelWithHint: true,
              hint: Text(
                "\₹",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide()),
            ),
          ),
        ),
      ],
    );
  }

  ///...chooseTip part4
  Widget chooseTip() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 130,
            //color: Colors.red,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text.rich(
                TextSpan(
                  text: "Choose\n",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  children: [
                    TextSpan(
                      text: "your tip",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      tipController.clear();
                      selectedTipPercentage = enteredBill * 0.10;
                      tipSelected == 1 ? tipSelected = 0 : tipSelected = 1;
                      calcFunc();
                    },
                    child: Container(
                      width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: tipSelected == 1
                            ? Border.all(width: 5)
                            : null,
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
                    onTap: () {
                      tipController.clear();
                      selectedTipPercentage = enteredBill * 0.15;
                      tipSelected == 2 ? tipSelected = 0 : tipSelected = 2;
                      calcFunc();
                    },
                    child: Container(
                      width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: tipSelected == 2
                            ? Border.all(width: 5)
                            : null,
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
                    onTap: () {
                      tipController.clear();
                      selectedTipPercentage = enteredBill * 0.20;
                      tipSelected == 3 ? tipSelected = 0 : tipSelected = 3;
                      calcFunc();
                    },
                    child: Container(
                      width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: tipSelected == 3
                            ? Border.all(width: 5)
                            : null,
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
                onTap: () {
                  tipSelected == 4 ? tipSelected = 0 : tipSelected = 4;
                  setState(() {

                  });
                },
                onSubmitted: (value) {
                  calcFunc();
                },
                onChanged: (value){
                  calcFunc();
                },
                keyboardType: TextInputType.number,
                controller: tipController,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: tipSelected == 4
                        ? BorderSide(width: 5)
                        : BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.lightBlueAccent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
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
      ],
    );
  }

  ///...splitTotal part5
  Widget splitTotal() {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              text: "Split\n",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              children: [
                TextSpan(
                  text: "the total",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    if (splitCurrentTotal > 1) {
                      splitCurrentTotal--;
                    }
                    calcFunc();
                  },
                  child: Container(
                    width: 70,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(15),
                      ),
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
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    splitCurrentTotal++;
                    calcFunc();
                  },
                  child: Container(
                    width: 70,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(15),
                      ),
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
            ],
          ),
        ),
      ],
    );
  }
}
