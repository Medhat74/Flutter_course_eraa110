import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_eraa_soft/models/pokemon_model.dart';
import 'package:pokemon_eraa_soft/serviece/dio/dio_helper.dart';

import '../../serviece/dio/api_end_points.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());

  static PokemonCubit get(context) => BlocProvider.of(context);

  PokemonModel? pokemonModel;

  void getAllPokemonsData() {
    emit(GetPokemonDataLoadingState());
    print("LL");
    DioHelper.getData(url: "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json").then((value) {
        var jsonData  = jsonDecode(value.data);
        pokemonModel = PokemonModel.fromJson(jsonData);
        emit(GetPokemonDataSuccessState());
      }).catchError((onError){

        debugPrint(onError.toString());
        emit(GetPokemonDataErrorState(onError.toString()));
    });



  }

}
