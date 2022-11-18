import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maths_puzz/third_page.dart';
import 'package:maths_puzz/volate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class second extends StatefulWidget {
  int current;
  second(this.current);



  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  String ans="";
  int cu_lavel=0;
  SharedPreferences ?pref;



  @override
  void initState() {
    super.initState();

    cu_lavel=widget.current;
   getdata();
  }
  getdata()
  async {
    pref = await SharedPreferences.getInstance();
    // print("level_status");
  }

  @override
  Widget build(BuildContext context) {
    double tot_size=MediaQuery.of(context).size.height;
    double statusbar_size=MediaQuery.of(context).padding.top;
    double screen_size=tot_size-statusbar_size;
    return Scaffold(
      body:Column(
        children: [
          Expanded(child: Container(
            margin: EdgeInsets.only(top: statusbar_size),
            height: screen_size,
            width: double.infinity,
            decoration: BoxDecoration(
                image:DecorationImage(image: AssetImage("xyz/gameplaybackground.jpg"),fit:BoxFit.fill)
            ),
            child: Column(
              children: [
                Container(
                    height: 70,
                    child:Row(
                      children: [
                        InkWell(
                          onTap: (){
                            setState((){
                              showDialog(barrierColor: Colors.transparent,
                                  barrierDismissible: false,context: context, builder: (context){
                                    return AlertDialog(
                                      content: Text("Are you sure skip this level"),
                                      actions: [
                                        TextButton(onPressed: () {
                                          setState((){
                                            pref!.setString("level_status$cu_lavel", "skip");
                                            cu_lavel++;
                                            pref!.setInt("levelno", cu_lavel);
                                          });
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                            return third(cu_lavel);
                                          },));
                                          Navigator.pop(context);
                                        }, child: Text("yes")),
                                        TextButton(onPressed: () {
                                          Navigator.pop(context);
                                        }, child: Text("No")),
                                      ],
                                    );
                                  });
                            });
                          },
                          child: Container
                            (
                            margin: EdgeInsets.all(15),
                            child:Image(image: AssetImage("xyz/skip.png"),fit: BoxFit.fill,),
                          ),
                        ),
                        Expanded(child: Container(
                            height: 50,
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("xyz/level_board.png"),fit: BoxFit.fill,)
                            ),
                          child: Text("Puzzle ${cu_lavel+1}",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 30,fontWeight: FontWeight.bold),),
                        ),),
                        Container(
                          margin: EdgeInsets.all(15),
                          child:Image(image: AssetImage("xyz/hint.png"),fit: BoxFit.fill,),
                        ),
                      ],
                    )
                ),
                Expanded(child: Container(
                  height: double.infinity,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(15),
                  child:Image(image: AssetImage("${volate.p_img[cu_lavel]}"),fit: BoxFit.fill,),
                )),
                Container(
                  height: 130,
                  color: Colors.black,
                  child: Column(
                    children: [
                       Container(
                         height: 75,
                        color: Colors.black,
                         child: Row(
                           children: [
                             Container(
                               height: 50,
                               width: 190,
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.all(Radius.circular(10))
                               ),
                               margin: EdgeInsets.all(15),
                               padding: EdgeInsets.only(bottom: 5),
                               child: Text("$ans",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

                             ),
                             InkWell(
                               onTap: () {

                                 setState((){
                                   ans=ans.substring(0,ans.length-1);
                                 });
                               },
                               child: Container(
                                 color: Colors.white,
                                 width: 50,
                                 margin: EdgeInsets.only(right: 4,top: 3),
                                 child: Image(image: AssetImage("xyz/delete.png")),
                               ),
                             ),
                              Expanded(child: InkWell(
                                onTap: (){
                                  setState((){
                                    if (volate.ans[cu_lavel]==int.parse(ans))
                                    {
                                      pref!.setString("level_status$cu_lavel", "yes");
                                      cu_lavel++;
                                      pref!.setInt("levelno", cu_lavel);
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {

                                            return third(cu_lavel);

                                          },)
                                        );
                                    }
                                    else
                                      {
                                        FlutterClipboard.copy(ans).then((value) =>
                                        Fluttertoast.showToast(
                                            msg: "Wrong",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 3,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0
                                        ),
                                      );
                                      }
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 85,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(color: Colors.white,style: BorderStyle.solid)
                                  ),
                                  alignment: Alignment.center,
                                  child: Text("SUBMIT",style: TextStyle(fontSize: 20,color:Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),textAlign: TextAlign.center,),
                                ),
                              ))
                           ],
                         ),
                      ),
                      Expanded(child: Row(
                        children: [
                          Expanded(child: InkWell(onTap: (){abc("1");},child: Container(height:40,alignment: Alignment.center,margin: EdgeInsets.all(3),color: Colors.white,child: Text("1",textAlign: TextAlign.center,),),)),
                          Expanded(child: InkWell(onTap: (){abc("2");},child: Container(height:40,alignment: Alignment.center,margin: EdgeInsets.all(3),color: Colors.white,child: Text("2",textAlign: TextAlign.center,),),)),
                          Expanded(child: InkWell(onTap: (){abc("3");},child: Container(height:40,alignment: Alignment.center,margin: EdgeInsets.all(3),color: Colors.white,child: Text("3",textAlign: TextAlign.center,),),)),
                          Expanded(child: InkWell(onTap: (){abc("4");},child: Container(height:40,alignment: Alignment.center,margin: EdgeInsets.all(3),color: Colors.white,child: Text("4",textAlign: TextAlign.center,),),)),
                          Expanded(child: InkWell(onTap: (){abc("5");},child: Container(height:40,alignment: Alignment.center,margin: EdgeInsets.all(3),color: Colors.white,child: Text("5",textAlign: TextAlign.center,),),)),
                          Expanded(child: InkWell(onTap: (){abc("6");},child: Container(height:40,alignment: Alignment.center,margin: EdgeInsets.all(3),color: Colors.white,child: Text("6",textAlign: TextAlign.center,),),)),
                          Expanded(child: InkWell(onTap: (){abc("7");},child: Container(height:40,alignment: Alignment.center,margin: EdgeInsets.all(3),color: Colors.white,child: Text("7",textAlign: TextAlign.center,),),)),
                          Expanded(child: InkWell(onTap: (){abc("8");},child: Container(height:40,alignment: Alignment.center,margin: EdgeInsets.all(3),color: Colors.white,child: Text("8",textAlign: TextAlign.center,),),)),
                          Expanded(child: InkWell(onTap: (){abc("9");},child: Container(height:40,alignment: Alignment.center,margin: EdgeInsets.all(3),color: Colors.white,child: Text("9",textAlign: TextAlign.center,),),)),
                          Expanded(child: InkWell(onTap: (){abc("0");},child: Container(height:40,alignment: Alignment.center,margin: EdgeInsets.all(3),color: Colors.white,child: Text("0",textAlign: TextAlign.center,),),)),
                        ],
                      ))
                     
                    ],
                  ),
                )
              ],
            ),
          ),)
        ],
      )
    );
  }
  abc(String a)
  {
    setState((){ans=ans+a;});
  }

}
