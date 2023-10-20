part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class GetPokemonDataLoadingState extends PokemonState {}
class GetPokemonDataSuccessState extends PokemonState {}
class GetPokemonDataErrorState extends PokemonState {
  final String error;

  GetPokemonDataErrorState(this.error);
}