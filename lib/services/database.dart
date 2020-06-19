import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  //Instance database
  final String uid;
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

}