part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class SendMassageLoadingState extends ChatState {}
class SendMassageSuccessState extends ChatState {}
class SendMassageErrorState extends ChatState {}
