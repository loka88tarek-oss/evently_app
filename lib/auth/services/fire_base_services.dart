import 'dart:developer';

import 'package:evently_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseServices {
 static Future <void>login(UserModel user)async{
    try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(email: user.email, password: user.password);
     log("Success");
    }catch(e){
      log("-------------->$e");
    }

  }
 static Future <void>register(UserModel user)async{
    try{
     await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: user.password);
     log("Success");
    }catch(e){
      log("-------------->$e");
    }

  }

}