part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class UserLoginLoadingState extends AuthenticationState {}
class UserLoginSuccessState extends AuthenticationState {}
class UserLoginErrorState extends AuthenticationState {
  final String errorMess;

  UserLoginErrorState(this.errorMess);
}

class GetUserProfileDataLoadingState extends AuthenticationState {}
class GetUserProfileDataSuccessState extends AuthenticationState {}
class GetUserProfileDataErrorState extends AuthenticationState {
  final String errorMess;

  GetUserProfileDataErrorState(this.errorMess);
}