import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_eraa_soft/blocs/pokemon_cubit/pokemon_cubit.dart';
import 'package:pokemon_eraa_soft/blocs/pokemon_cubit/pokemon_cubit.dart';
import 'package:pokemon_eraa_soft/core/utils/size_config.dart';
import 'package:pokemon_eraa_soft/screens/details_pokemon_screen/details_pokemon_screen.dart';

import 'components/pokemon_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Center(
            child: Text("Poke App", style: TextStyle(color: Colors.white),)),
      ),
      body: BlocConsumer<PokemonCubit, PokemonState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is GetPokemonDataLoadingState){
              return const Center(child: CircularProgressIndicator());
          }
          else if( state is GetPokemonDataSuccessState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),

                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                          DetailsPokemonScreen(
                              pokemon: context.read<PokemonCubit>().pokemonModel!.pokemons![index])));
                    },
                    child: PokemonCardWidget(
                      image: context.read<PokemonCubit>().pokemonModel!.pokemons![index].img!,
                      text: context.read<PokemonCubit>().pokemonModel!.pokemons![index].name!,),
                  );
                },
                itemCount: context.read<PokemonCubit>().pokemonModel!.pokemons!.length,

              ),
            );
          }
          else if (state is GetPokemonDataErrorState){
            return Center(child: Text(state.error),);
          }
          return const SizedBox.shrink();

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Helo");
          context.read<PokemonCubit>().getAllPokemonsData();
        },

      ),
    );
  }
}
