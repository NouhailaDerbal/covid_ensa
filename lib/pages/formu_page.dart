import 'package:covidensa/core/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForPage extends StatefulWidget{
  @override
  _ForPageState createState() =>  _ForPageState();


}

class _ForPageState  extends State<ForPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors:
            [
              AppColors.mainColor,
              AppColors.mainColor.withOpacity(.5),
            ])
        ),
        child: Stack(
          children: <Widget>[
            _buildHeader(),
            Align(
              alignment:Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width * .7,
                child:Center(
                  child: Image.asset("assets/images/virus.png"),
                ),
              ),
            ),

            _buildFooter(context)
          ],
        ),
      ),
    );
  }
}
Padding _buildHeader(){
  return Padding(
    padding:const EdgeInsets.only(top:50),
    child:Align(
      alignment: Alignment.topCenter,
      child: Text(" Veuillez remplir ce formulaire",
          style: TextStyle(fontSize: 35,height:1.5,color: Colors.white,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
    ),
  );
}
Widget _buildFooter(BuildContext context){
  return Positioned(bottom: 50,
    child:Container(
        width: MediaQuery.of(context).size.width,
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding:EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border:Border(bottom: BorderSide(color: Colors.white))
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Nom et prenom",
                  hintStyle: TextStyle(color: Colors.white),
                  border:InputBorder.none,
                ),
              ),
            ),
            Container(
              padding:EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border:Border(bottom: BorderSide(color: Colors.white))
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "email",
                  hintStyle: TextStyle(color: Colors.white),
                  border:InputBorder.none,
                ),
              ),
            ),
            Container(
              padding:EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border:Border(bottom: BorderSide(color: Colors.white))
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Etat",
                  hintStyle: TextStyle(color: Colors.white),
                  border:InputBorder.none,
                ),
              ),
            ),
            Container(
              padding:EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border:Border(bottom: BorderSide(color: Colors.white))
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Adresse",
                  hintStyle: TextStyle(color: Colors.white),
                  border:InputBorder.none,
                ),
              ),
            ),
            Container(
              padding:EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border:Border(bottom: BorderSide(color: Colors.white))
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Telephone",
                  hintStyle: TextStyle(color: Colors.white),
                  border:InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 25),
            GestureDetector(
              onTap:(){

              } ,
              child:Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(1, 1),
                          spreadRadius: 3,
                          blurRadius: 3,
                        )
                      ]
                  ),
                  width: MediaQuery.of(context).size.width * .85,
                  height: 60,
                  child:Center(
                      child:Text("remplir ce formulaire",
                        style:TextStyle(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20) ,))
              ),),],
        )
    ),);
}