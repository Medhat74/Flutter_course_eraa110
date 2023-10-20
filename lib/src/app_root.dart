import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_eraa_soft/blocs/pokemon_cubit/pokemon_cubit.dart';

import '../screens/home_screen/home_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=> PokemonCubit()..getAllPokemonsData()  )
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
