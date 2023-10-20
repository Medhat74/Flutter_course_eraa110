import 'package:firebase_session/blocs/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: context.read<AuthCubit>().formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: context.read<AuthCubit>().emailController,
                //initialValue: 'example@gmail.com',
                validator: (value){
                  if(value == null || value == ""){
                    return "Enter your Email";
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Email ',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: context.read<AuthCubit>().passwordController,
                //initialValue: 'Aaa@#123',
                validator: (value){
                  if(value == null || value == ""){
                    return "Enter your password";
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Password ',
                  border: OutlineInputBorder(),
                ),
              ),

              ElevatedButton(
                onPressed: (){
                  if(context.read<AuthCubit>().formKey.currentState!.validate()) {
                    context.read<AuthCubit>().createUser(
                        context.read<AuthCubit>().emailController.text,
                        context.read<AuthCubit>().passwordController.text);
                  }
                },
                child: const Text("Create User"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
