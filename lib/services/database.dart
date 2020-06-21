import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidensa/models/user.dart';
import 'package:covidensa/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final  Firestore  myDB = Firestore.instance; 
 
 DatabaseService.authen(){

   this.uid=AuthService.idauth;

 }
  //Instance auth
  final FirebaseAuth _authent = FirebaseAuth.instance;
  //Instance database
   String uid;
  DatabaseService({this.uid});
  //recuperation de l'objet de la collection users
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUser(String nom,String prenom,String etat,String adresse,int score) async {
    return await userCollection.document(uid).setData({
      'nom': nom,
      'prenom' : prenom,
      'etat' : etat,
      'adresse' : adresse,
      'score' : score,
      });
  }

  /*-------Etat user------- */    
 
  Future<String> tonEtat() async {

    final FirebaseUser user  = await _authent.currentUser();
    String etat='';
    final docRef = await myDB.collection("users").document(user.uid).get();
    etat = docRef.data['etat'];
    return etat;
  }
 
  //-------------------------Users

   //insertion
 
Future <  void  > addUser() async { 
  try{
    await myDB.collection ( "users" ) .add ({  
        'nom' : "ELhariri",  
        'prenom' :  "noura",  
    }) ;
        print("fait");  
   }        
    catch(e) {  
        print(e);  
    }
}  
//update 
Future < void > editUser( int score ) async {  
   try{
     FirebaseAuth a=FirebaseAuth.instance;
final FirebaseUser user  = await a.currentUser();
   
if (user == null) {
    // User is not signed in
}
   else{
     String etat="";
      if(score>5){
          etat="ensuivi";

        }
        else {
           etat="normal";

        }
      String d = user.uid;
    await myDB.collection("users").document(d).updateData({  
        'score': score,  
        'etat':etat,
        
        
    }); 
    } 
    }
    catch(e) {  
        print(e);  
    }  
}   
Future <  void  > addUserlier(String nom,String prenom,String adresse,String etat ) async { 
  try{
     FirebaseAuth a=FirebaseAuth.instance;
final FirebaseUser user  = await a.currentUser();
   
if (user == null) {
    // User is not signed in
}
   
      String d = user.uid;
    await myDB.collection("users").document(d).updateData({  
         
        'etat':etat,
        'nom':nom,
        'adresse':adresse,
        'prenom':prenom,
        
        
    }); 
    } 
    
    catch(e) {  
        print(e);  
    }  

}}