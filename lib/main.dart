import 'package:flutter/material.dart';
import 'package:pokemon_eraa_soft/serviece/dio/dio_helper.dart';
import 'package:pokemon_eraa_soft/serviece/shared_prefrence/shared_prefrence_helper.dart';
import 'package:pokemon_eraa_soft/src/app_root.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefrenceHelper.init();
  DioHelper.init();

  runApp(const AppRoot());
}



