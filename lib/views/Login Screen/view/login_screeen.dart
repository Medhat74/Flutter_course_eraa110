import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session8/blocs/authentication_cubit/authentication_cubit.dart';
import 'package:session8/blocs/doctor_appointment_app_cubit.dart';
import 'package:session8/components/custom_text_field.dart';
import 'package:session8/models/login_model.dart';
import 'package:session8/views/Appointment%20Screen/view/appointments_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AuthenticationCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3abdd7),
        title: const Text('Login Screen'),
      ),
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if(state is UserLoginSuccessState){

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login Successful')),
            );
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (BuildContext context) => const AppointmentsScreen()),  (route) => false,);

          }

          else if(state is UserLoginErrorState){
            ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text(state.errorMess)),
            );
          }

        },
        builder: (context, state) {
          return Form(
            //key: cubit.formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    label: 'Email ',
                    controller: cubit.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                    isNumeric: true,
                  ),
                  CustomTextField(
                    label: 'Password',
                    controller: cubit.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  Center(
                    child: state is UserLoginLoadingState ?
                    const CircularProgressIndicator()  :
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff3abdd7)),
                      onPressed: () {


                          LoginRequestModel l = LoginRequestModel(
                              cubit.emailController.text,
                              cubit.passwordController.text);
                          cubit.userLogin(l);

                      },
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
