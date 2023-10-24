import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/message.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());
  static MessageCubit get(context)=>BlocProvider.of(context);


  String? userEmail;
  Stream? messagesStream;
  //User ? user;
  /// create functions => send , receive

  sendMessage(String text,DateTime time)
  {
    userEmail =FirebaseAuth.instance.currentUser!.email;

    //emit(ChatSendLoadingState());
    Message message = Message(text: text, time:time, sender: userEmail!);
    FirebaseFirestore.instance
        .collection('messages')
        .add(message.toMap())
        .then((value) {
          print(value);
      //emit(ChatSendSuccessState());
    }).catchError((error){
      //emit(ChatSendErrorState());

    });
  }

  receiveMessages()
  {
    userEmail =FirebaseAuth.instance.currentUser!.email;
    messagesStream=FirebaseFirestore.instance
        .collection('messages')
        .orderBy('time')
        .snapshots();
    print(messagesStream);
    //emit(ChatReceiveMessageState());
  }

  /*getUserData()
  {
    user=FirebaseAuth.instance.currentUser;
    emit(ChatGetUserDataState());
  }*/
}
