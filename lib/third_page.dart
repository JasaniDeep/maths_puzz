// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:maths_puzz/first_page.dart';
import 'package:maths_puzz/second_page.dart';

class third extends StatefulWidget {
  int cu_lavel;
   third(this.cu_lavel);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  List<Color> grad= [const Color(0xFF494949), const Color(0xffd0d0d0), const Color(0xFF2A2A2A)];
  @override
  Widget build(BuildContext context) {
    double tot_size=MediaQuery.of(context).size.height;
    double statusbar_size=MediaQuery.of(context).padding.top;
    double screen_size=tot_size-statusbar_size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: statusbar_size),
        height: screen_size,
        width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(image:  AssetImage("xyz/background.jpg"),fit: BoxFit.fill)
          ),
          child: Column(
            children: [
              Container(
                height: 80,
                // color: Colors.deepPurple,
                alignment: Alignment.center,
                child:  Text("PUZZLE  ${widget.cu_lavel} COMPLETED",textAlign: TextAlign.center,style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 20),),
              ),
              Container(
                height: 200,
                margin: const EdgeInsets.all(10),
                // color: Colors.orange,
                child: const Image(image: AssetImage("xyz/trophy.png"),fit: BoxFit.fill,),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return second(widget.cu_lavel);
                  },));

                },
                child:  Container(
                  height: 50,
                  width: 170,

                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: kElevationToShadow[8],
                      color: Theme.of(context).bottomAppBarColor,
                      gradient: LinearGradient(colors: grad,begin: Alignment.bottomLeft,end: Alignment.topRight),
                      borderRadius: const BorderRadius.all(Radius.circular(15))
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Text("CONTINUE",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 20)),
                ),
              ),
              Container(
                height: 50,
                width: 170,

                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[8],
                    color: Theme.of(context).bottomAppBarColor,
                    gradient: LinearGradient(colors: grad,begin: Alignment.bottomLeft,end: Alignment.topRight),
                    borderRadius: const BorderRadius.all(Radius.circular(15))
                ),
                margin: const EdgeInsets.only(bottom: 10),

                child: const Text("MAIN MENU",textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 20)),

              ),
              Container(
                height: 50,
                width: 170,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[8],
                    color: Theme.of(context).bottomAppBarColor,
                    gradient: LinearGradient(colors: grad,begin: Alignment.bottomLeft,end: Alignment.topRight),
                    borderRadius: const BorderRadius.all(Radius.circular(15))
                ),
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text("BUY PRO",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 20)),

              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                child: const Text("SHARE THIS PUZZLE",textAlign: TextAlign.center,style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 20)),

              ),
              Container(
                height: 40,
                width: 40,

                alignment: Alignment.center,
                decoration: BoxDecoration(
                    // boxShadow: kElevationToShadow[8],
                    // color: Theme.of(context).bottomAppBarColor,
                    gradient: LinearGradient(colors: grad,begin: Alignment.bottomLeft,end: Alignment.topRight),
                    borderRadius: const BorderRadius.all(Radius.circular(5))
                ),

                child: const SizedBox(
                  height: 30,
                  width: 30,
                  child:
                    Image(image: AssetImage("xyz/shareus.png"),)
                )
              ),
            ],
          ),
          // child:
      ),
    );
  }
}
