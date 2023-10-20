import 'package:flutter/material.dart';
import 'package:session8/services/dio_helper.dart';
import 'package:session8/services/shared_prefrence_helper.dart';
import 'package:session8/src/app_root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferenceHelper.init();
  DioHelper.init();


  runApp(const AppRoot());
}
