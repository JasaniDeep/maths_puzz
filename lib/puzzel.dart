import 'package:flutter/material.dart';
import 'package:maths_puzz/second_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class puzzel extends StatefulWidget {
  List level_status=[];
  int cu_level=0;


   puzzel(this.level_status, this.cu_level);
  @override
  State<puzzel> createState() => _puzzelState();
}

class _puzzelState extends State<puzzel> {
  List level_status=[];
  int cu_level=0;


  SharedPreferences ?pref;
  @override
  void initState() {
    super.initState();

        level_status=widget.level_status;
        cu_level=widget.cu_level;

  }
  getdata() async {
    pref = await SharedPreferences.getInstance();
    cu_level=pref!.getInt("levelno") ?? 0;
  }
  @override
  Widget build(BuildContext context) {
    double tot_size=MediaQuery.of(context).size.height;
    double statusbar_size=MediaQuery.of(context).padding.top;
    double screen_size=tot_size-statusbar_size;
    return Scaffold(
      body:Container(
      margin: EdgeInsets.only(top: statusbar_size),
      height: screen_size,
      width: double.infinity,
      decoration: BoxDecoration(
          image:DecorationImage(image: AssetImage("xyz/background.jpg"),fit:BoxFit.fill)
      ),
        child: Column(
          children: [
            Container(
              height: 70,
              // color: Colors.white24,
                 child: Center(child: Text("Select Puzzle",style: TextStyle( color:Colors.deepPurple,fontSize: 35,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                 ),
            ),
            Expanded(child: GridView.builder(itemCount:level_status.length,itemBuilder: (context, index) {
              return InkWell(
                        onTap: (){
                          if(level_status[index]=="skip" || level_status[index]=="yes") {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return second(index);
                              },));
                          }
                        },
                 child: Container(
                      margin: EdgeInsets.all(4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border:Border.all(color: Colors.black,width: 2,style: BorderStyle.solid),
                          image: (level_status[index]=="yes") ?DecorationImage(image: AssetImage("xyz/tick.png")) :
                          (level_status[index]=="no") ? DecorationImage(image: AssetImage("xyz/lock.png")) : null
                      ),
                      child: (index<cu_level+1) ? Text("${index+1}",
                        style: TextStyle(fontSize: 30,
                            fontFamily: "f1",fontWeight: FontWeight.bold),textAlign: TextAlign.center) : null
                  ),
              );
            },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: 6,crossAxisSpacing: 10,), )),
          ],
        ),
      ),
    );
  }
}
