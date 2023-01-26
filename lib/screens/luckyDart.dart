import 'package:assignment4/screens/lst.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LuckDrawPage extends StatefulWidget {
  const LuckDrawPage({super.key});

  @override
  State<LuckDrawPage> createState() => _LuckDrawPageState();
}

class _LuckDrawPageState extends State<LuckDrawPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LuckyPage();
          },));
        }, child: Text("Lucky Draw")) ),
    );
  }
}