
import 'package:covidensa/core/consts.dart';
import 'package:covidensa/pages/home_page.dart';
import 'package:covidensa/pages/question_page.dart';
import 'package:covidensa/pages/questions.dart';
import 'package:covidensa/pages/formu_page.dart';
import 'package:covidensa/pages/quiz_page.dart';
import 'package:covidensa/pages/statistic_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'etat_page.dart';
import 'local_page.dart';
import 'package:covidensa/services/auth.dart';


class QuestPage extends StatefulWidget {
  @override
  _QuestPageState  createState() => _QuestPageState();
}


class _QuestPageState extends State<QuestPage> {
  //objet authService
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
             appBar: AppBar(
               title: new Text("Questionnaire",),
               elevation: defaultTargetPlatform==TargetPlatform.android?5.0:0.0,
    ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(accountName: new Text("Genie Info"), accountEmail: new Text("ensas@gmailcom")
             ,currentAccountPicture: new CircleAvatar(backgroundColor: Colors.deepPurpleAccent,child: new Text("GI"),),
            otherAccountsPictures: <Widget>[
              new CircleAvatar(backgroundColor: Colors.deepPurpleAccent,child: new Text("ND"),),


            ],
            ),
            new ListTile(
              title: new Text("Profil"),
              trailing: new Icon(Icons.person),
               onTap:(){
                 Navigator.of(context).push(MaterialPageRoute(builder:(_) => ForPage(), ),);
               } ,
            ),
            new ListTile(
              title: new Text(" Questionaire"),
              trailing: new Icon(Icons.arrow_right),
               onTap:(){
                 Navigator.of(context).push(MaterialPageRoute(builder:(_) => QuestPage(), ),);
               } ,
            ),
            new ListTile(
              title: new Text("Ton etat "),
              trailing: new Icon(Icons.arrow_right),
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(builder:(_) => EtaPage(), ),);
              } ,
            ),
            new ListTile(
              title: new Text(" Localization"),
              trailing: new Icon(Icons.arrow_upward),
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(builder:(_) => LocalPage(), ),);
              } ,
            ),
            new ListTile(
              title: new Text("Statistiques"),
              trailing: new Icon(Icons.arrow_downward),
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(builder:(_) => StatisticPage(), ),);
              } ,
            ),
            new ListTile(
              title: new Text("Déconnexion"),
              trailing: new Icon(Icons.power),
              onTap:() async{
                await _auth.signOut();
                Navigator.of(context).push(MaterialPageRoute(builder:(_) => HomePage(), ),);
              } ,
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
            onTap:()=> Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: Container(
      child: Column(

        children: <Widget>[
          Text("\n \n Testez-vous !!!\n ",
              style: TextStyle(fontSize: 30 ,color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold)),
          Text(" Ce test vous aiderait à savoir si vous etes infectes par ce mortel virus\n ",
              style: TextStyle(fontSize: 20,height:1.5,color: Colors.deepPurple),
              textAlign: TextAlign.center),
          Image.asset('assets/images/quiz.png'),
          SizedBox(height: 25),
          GestureDetector(
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder:(_) => QuizPage(), ),);
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
                    child:Text("GET STARTED",
                      style:TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20) ,))
            ),),],
      )
      ),

    );

    }}
