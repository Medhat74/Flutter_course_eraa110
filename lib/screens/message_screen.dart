import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/chat_cubit/chat_cubit.dart';
import '../components/messages_list.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({Key? key}) : super(key: key);
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ChatCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title:  Center(child: Text("Welcome ${cubit.userEmail}"),),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               MessagesList(messageStream: cubit.messagesStream,userEmail: cubit.userEmail),
              TextFormField(
                controller: messageController,
                decoration: InputDecoration(
                  labelText: 'Message',
                  hintText: 'Type Here  ',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      cubit.sendMessage(messageController.text);
                      messageController.clear();
                    },
                    icon: const Icon(Icons.send),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
