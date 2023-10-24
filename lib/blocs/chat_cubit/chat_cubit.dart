import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_session/models/message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context)=>BlocProvider.of(context);

  String? userEmail;
  Stream? messagesStream;

  void sendMessage(String text){
    var time = DateTime.now();
    userEmail = FirebaseAuth.instance.currentUser!.email!;
    Message message = Message(text: text, time: time, sender: userEmail!);
    emit(SendMassageLoadingState());
    FirebaseFirestore.instance
        .collection("message")
        .add(message.toMap()).then((value) {
          emit(SendMassageSuccessState());
      }).catchError((onError){
        emit(SendMassageErrorState());
    });

  }

  void reseveMessages(){
    userEmail = FirebaseAuth.instance.currentUser!.email!;
    messagesStream = FirebaseFirestore.instance
        .collection("message")
        .orderBy("time")
        .snapshots();
  }
}
