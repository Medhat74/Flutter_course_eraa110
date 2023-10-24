import 'package:firebase_session/blocs/auth_cubit/auth_cubit.dart';
import 'package:firebase_session/blocs/chat_cubit/chat_cubit.dart';
import 'package:firebase_session/blocs/message_cubit/message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AuthCubit()),
        BlocProvider(create: (BuildContext context) => MessageCubit()..receiveMessages()),
        BlocProvider(create: (BuildContext context) => ChatCubit()..reseveMessages()),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
