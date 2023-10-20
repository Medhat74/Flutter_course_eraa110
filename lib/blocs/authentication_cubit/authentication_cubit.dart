import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:session8/models/login_model.dart';
import 'package:session8/models/user_profile_model.dart';
import 'package:session8/services/api_end_points.dart';
import 'package:session8/services/dio_helper.dart';
import 'package:session8/services/shared_prefrence_helper.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  static AuthenticationCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  UserProfileModel? userProfileModel;

  void userLogin(LoginRequestModel loginRequestModel){

    emit(UserLoginLoadingState());
    DioHelper.postData(url: postUserLogin,
        data: loginRequestModel.toJson() ).then((value) {
            if(value.statusCode == 200 ||value.statusCode == 201 ){
              var jsonData = jsonDecode(value.data);
              LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonData);
              SharedPreferenceHelper.saveData(key: "USER_TOKEN", value: loginResponseModel.data!.token!);
              SharedPreferenceHelper.saveData(key: "USER_NAME", value: loginResponseModel.data!.username!);
              print(loginResponseModel.data!.token!);
              emit(UserLoginSuccessState());
            }
            else{
              var jsonData = jsonDecode(value.data);
              print(jsonData);
              emit(UserLoginErrorState(jsonData['data'].toString()));
            }

        }).catchError((onError){
          emit(UserLoginErrorState(onError.toString()));
        });
  }

  void getUserProfileData(){
    emit(GetUserProfileDataLoadingState());
    DioHelper.getData(url: "user/profile",
        token: SharedPreferenceHelper.getData(key: "USER_TOKEN")
    ).then((value) {
        if(value.statusCode == 200 || value.statusCode == 201){
          var jsonData = jsonDecode(value.data);
          userProfileModel = UserProfileModel.fromJson(jsonData);
          print(jsonData);
          emit(GetUserProfileDataSuccessState());
        }else{
          emit(GetUserProfileDataErrorState("User Not Found"));
        }

    }).catchError((onError){
      emit(GetUserProfileDataErrorState(onError.toString()));

    });

  }

}
