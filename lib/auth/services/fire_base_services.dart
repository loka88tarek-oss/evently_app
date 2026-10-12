import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseServices {
  static Future<UserModel?> login(UserModel user) async {
    try {
     UserCredential credential=   await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password!,
      );
      UserModel? userData=await getUserInfo(credential.user!.uid);
      log("Success");
      return userData;
    } catch (e) {
      log("-------------->$e");
    }
  }

  static Future<void> register(UserModel user) async {
    try {
     UserCredential credential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password!,
      );
       user.id= credential.user?.uid;
       await createUser(user);
      log("Success");
    } catch (e) {
      log("-------------->$e");
    }
  }
  static   CollectionReference<UserModel> getUserCollection(){
    return FirebaseFirestore.instance
        .collection("users")
        .withConverter<UserModel>(
          fromFirestore: (snapshot, options) =>
              UserModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  static Future createUser(UserModel user) async {
    CollectionReference<UserModel> collection =getUserCollection(); 
    DocumentReference doc = collection.doc(user.id);
    await doc.set(user);
  }
  static Future<UserModel?> getUserInfo(String id)async{
     CollectionReference<UserModel> collection =getUserCollection(); 
    DocumentReference<UserModel>  doc = collection.doc(id);
    DocumentSnapshot<UserModel>  snapshot= await doc.get();
    return snapshot.data();
  }
}
