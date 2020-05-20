
import 'package:covidensa/pages/quest_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/painting.dart';
import 'package:covidensa/core/consts.dart';


import 'home_page.dart';


class FormPage extends StatefulWidget {
  @override
  _FormPageState  createState() => _FormPageState();
}


class _FormPageState extends State<FormPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding:true,

        body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        colors: [
          AppColors.mainColor,
          AppColors.mainColor.withOpacity(.5),
        ]
    )
    ),
         child:Column(
           crossAxisAlignment: CrossAxisAlignment.start,
children: <Widget>[
  SizedBox(height: 80,),
  Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      children: <Widget>[
        Text("Login",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 40),),
        SizedBox(height: 10,),
        Text("Welcome back",style: TextStyle(color: Colors.white,fontSize: 20),)

      ],
    ),
    
  ),
  SizedBox(height: 20,),
  Expanded(
    child: Container(
      decoration: BoxDecoration(
      color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))
      ),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            SizedBox(height: 60,),
            Container(
              padding:EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                  color: AppColors.mainColor,
                      blurRadius: 20,
                  offset: Offset(0,10),
                )]
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding:EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border:Border(bottom: BorderSide(color: Colors.grey[200]))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Email or  cin",
                        hintStyle: TextStyle(color: Colors.grey),
                        border:InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    padding:EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border:Border(bottom: BorderSide(color: Colors.grey[200]))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey),
                        border:InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40,),
            Text("Forgot Password",style: TextStyle(color: Colors.grey),),
            SizedBox(height: 40,),
        GestureDetector(
          onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder:(_) => QuestPage(), ),);
          } ,
           child: Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.deepPurple,

              ),
              child: Center(
                child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),



              ),),

        ),],
        ),
      ),
    ),
  )
],


            ),
              )





     );
  }
}


