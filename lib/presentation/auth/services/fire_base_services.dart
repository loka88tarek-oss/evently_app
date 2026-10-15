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
      UserModel? userData=await _getUserInfo(credential.user!.uid);
      log("Success");
      return userData;
    } on FirebaseAuthException catch (e) {
     String errorMessage=_getFreindlyMessage(e.code);
     throw errorMessage;
    }catch(e){
      String errorMessage="Authentication failed.PLease try again.";
      throw errorMessage;
    }
  }
  
  static Future<void> register(UserModel user) async {
    try {
     UserCredential credential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password!,
      );
       user.id= credential.user?.uid;
       await _createUser(user);
      log("Success");
    }  on FirebaseAuthException catch (e) {
     String errorMessage=_getFreindlyMessage(e.code);
     throw errorMessage;
    }catch(e){
      String errorMessage="Authentication failed.PLease try again.";
      throw errorMessage;
    }
  }
  static   CollectionReference<UserModel> _getUserCollection(){
    return FirebaseFirestore.instance
        .collection("users")
        .withConverter<UserModel>(
          fromFirestore: (snapshot, options) =>
              UserModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  static Future _createUser(UserModel user) async {
    CollectionReference<UserModel> collection =_getUserCollection(); 
    DocumentReference doc = collection.doc(user.id);
    await doc.set(user);
  }

  static Future<UserModel?> _getUserInfo(String id)async{
     CollectionReference<UserModel> collection =_getUserCollection(); 
    DocumentReference<UserModel>  doc = collection.doc(id);
    DocumentSnapshot<UserModel>  snapshot= await doc.get();
    return snapshot.data();
  }
  static String _getFreindlyMessage(String code){
   switch (code) {
    case 'invalid-email':
     return'The email format is incorrect.';
     
    case 'user-not-found':
     return'No user found for that email.';
     
    case 'wrong-password':
     return'Wrong password provided.';
     
    default:
     return'Authentication failed.PLease try again.';
  }
  }
}
