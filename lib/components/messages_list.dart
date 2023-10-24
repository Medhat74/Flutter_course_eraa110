import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_session/blocs/chat_cubit/chat_cubit.dart';
import 'package:firebase_session/blocs/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesList extends StatelessWidget {
  MessagesList({Key? key, this.userEmail, required this.messageStream}) : super(key: key);

  var messageStream;
  String? userEmail;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: messageStream,
      builder: (context, snapshot) {
        if(messageStream != null && userEmail != null) {
          if (snapshot.hasData) {
            QuerySnapshot values = snapshot.data as QuerySnapshot;
            return Expanded(
              child: ListView.builder(

                itemCount: values.docs.length,
                itemBuilder: (context, index) =>
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Align(
                        alignment: values.docs[index]['sender'] == userEmail?
                        Alignment.bottomRight : Alignment.bottomLeft,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: values.docs[index]['sender'] == userEmail?
                          const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ) ):
                              const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20),
                              )
                          ),

                          child: Column(
                            children: [
                              Text(values.docs[index]['text']),
                            ],
                          ),
                        ),
                      ),
                    ),
              ),
            );
          }
          else {
            return const Center(child: Text("No Data"),);
          }
        }else {
          return const CircularProgressIndicator();
        }
      }
    );
  }
}
