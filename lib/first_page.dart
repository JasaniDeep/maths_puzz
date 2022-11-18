import 'package:flutter/material.dart';
import 'package:maths_puzz/puzzel.dart';
import 'package:maths_puzz/second_page.dart';
import 'package:maths_puzz/volate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
    bool border= false;
    bool borde= false;
    bool bord= false;
    SharedPreferences ?pref;
    int cu_level=0;
    int i=0;
    List<String> level_status=[];
    @override
  void initState() {
    super.initState();
    level_status=List.filled(volate.ans.length, "no");
    getdata();
  }
  getdata() async {

      pref = await SharedPreferences.getInstance();
      print("pref : ${pref!.getInt("levelno")}");
      cu_level=pref!.getInt("levelno") ?? 0;
      for(i=0;i<=level_status.length;i++)
        {
          level_status[i]=pref?.getString("level_status$i") ?? "no";
          // print(pref!.getString("level_status"));
          print('levl-${i+1}${level_status[i]}');
        }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    body:Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("xyz/background.jpg"),fit: BoxFit.cover)
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(10, 35, 10, 0),
            child: Text("Math Puzzel",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
           )
          ),
          Container(
            height: 400,
            width: 400,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("xyz/blackboard_main_menu.png"),fit: BoxFit.fill)
            ),
            child: Center(
              child: Column(

                children: [
                  Padding(padding: EdgeInsets.only(top: 125),
                    child: GestureDetector(
                      child: InkWell(
                        onTapCancel: () {
                          setState((){
                            border=false;
                          });
                        },
                        onTapUp: (details) {
                          setState((){
                            border=false;
                            Navigator.push(context,MaterialPageRoute(builder: (context) {
                              return second(cu_level);
                            },));
                          });
                        },
                        onTapDown: (details){
                          setState((){
                            border=true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: (border==true)? Colors.white : Colors.black)
                          ),
                          child: Text("CONTINUE",style: TextStyle(fontFamily: "f1",fontSize: 20,color: Colors.white,),),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20),

                    child: GestureDetector(
                      child: InkWell(
                        onTapCancel: () {
                          setState((){
                            borde=false;
                          });
                        },
                        onTapUp: (details) {
                          setState((){
                            borde=false;

                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return puzzel(level_status,cu_level);
                          },));

                        },
                        onTapDown: (details){
                          setState((){
                            borde=true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: (borde==true)? Colors.white : Colors.black)
                          ),

                          child: Text("PUZZLES",style: TextStyle(fontFamily: "f1",fontSize: 20,color: Colors.white,),),

                        ),
                      ),

                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20),

                    child: GestureDetector(
                      child: InkWell(
                        onTapCancel: () {
                          setState((){
                            bord=false;
                          });
                        },
                        onTapUp: (details) {
                          setState((){
                            bord=false;
                          });
                        },
                        onTapDown: (details){
                          setState((){
                            bord=true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: (bord==true)? Colors.white : Colors.black)
                          ),

                          child: Text("BUY PRO",style: TextStyle(fontFamily: "f1",fontSize: 20,color: Colors.white,),),

                        ),
                      ),

                    ),
                  ),
                ],
              ),
            )
          )
        ],
      ),
    ),
    );
  }
}
