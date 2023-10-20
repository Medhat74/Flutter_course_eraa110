
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  var emailController= TextEditingController();
  var passwordController= TextEditingController();
  var formKey = GlobalKey<FormState>();


  void createUser(String email, String password){

    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
          print(value);
    }).catchError((onError){
      print(onError.toString());
    });

  }

  void loginUser(String email, String password){

    FirebaseAuth
        .instance
        .signInWithEmailAndPassword(email: email, password: password).then((value) {
          print(value);
    }).catchError((onError){
      print(onError.toString());
    });

  }
}
