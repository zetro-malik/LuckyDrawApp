import 'dart:async';
import 'dart:math';
import 'package:assignment4/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LuckyPage extends StatefulWidget {
  const LuckyPage({super.key});

  @override
  State<LuckyPage> createState() => _LuckyPageState();
}

class _LuckyPageState extends State<LuckyPage> {
  
static const MaxNumericDigits = 17;
  static final _random = Random();

  static int getInteger(int digitCount) {
    if (digitCount > MaxNumericDigits || digitCount < 1) throw new RangeError.range(0, 1, MaxNumericDigits, "Digit Count");
    var digit = _random.nextInt(9) + 1;  // first digit must not be a zero
    int n = digit;

    for (var i = 0; i < digitCount - 1; i++) {
      digit = _random.nextInt(10);
      n *= 10;
      n += digit;
    }
    return n;
  }
  @override
  void initState() {
    Random random = new Random();
  Timer.periodic(Duration(microseconds: 10), (timer) async {

    int randomNumber = getInteger(4);
    for (int i=0; i < GlobalVars.emps.length; i++)
    {
      if (GlobalVars.emps[i]==randomNumber.toString())
      {
     
        GlobalVars.Luck.add(GlobalVars.emps[i]);
        GlobalVars.emps.removeAt(i);
        setState(() {
          
        });
      }
    }
    if(GlobalVars.emps.length==0)
    {
       timer.cancel();
    showDialog(
    context: context,
    builder: (BuildContext context) {
      return  AlertDialog(
    title: Text("Lucky Draw Ended"),
    content: Text("Congratulations winners"),
    
  );
    },
  );
}
    
    });
    
  }

  @override
  Widget build(BuildContext context) {
    








    return Scaffold(
      appBar: AppBar(
        title: Text("Lucky Employee"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
            child: ListView.builder(
          itemCount: GlobalVars.Luck.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: Text("Employee ID: " + GlobalVars.Luck[index]),
            );
          },
        )),
      ),
    );
  }
}


