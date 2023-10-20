import 'package:flutter/material.dart';
import 'package:pokemon_eraa_soft/core/utils/size_config.dart';
import 'package:pokemon_eraa_soft/models/pokemon_model.dart';

import 'components/custom_list_view_widget.dart';
import 'components/h_or_w_text.dart';

class DetailsPokemonScreen extends StatelessWidget {
  const DetailsPokemonScreen({Key? key ,required this.pokemon}) : super(key: key);
  final Pokemon pokemon;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Row(children: [
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                    icon: const Icon(Icons.arrow_back_ios_new , color: Colors.white,)),
                CustomTextWidget(text: pokemon.name! , color: Colors.white, isBold: false, size: 15),

              ],),
            ),

           // SizedBox(height: SizeConfig.screenHeight! * 0.1),
            Positioned(
              left: SizeConfig.screenWidth!*0.1,
              top: SizeConfig.screenHeight!* 0.15,
              child: Container(
                width: SizeConfig.screenWidth! *0.8,
                height: SizeConfig.screenHeight! *0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),


                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 10),
                      CustomTextWidget(
                          text: pokemon.name?? "aaa",
                          color: Colors.black,
                          isBold: true,
                          size: 20),
                      CustomTextWidget(
                          text: "Height: ${pokemon.height!} m",
                          color: Colors.grey,
                          isBold: false,
                          size: 15),
                      CustomTextWidget(
                          text: "Weight: ${pokemon.weight!} kg",
                          color: Colors.grey,
                          isBold: false,
                          size: 15),

                      const CustomTextWidget(
                          text: "Types",
                          color: Colors.black,
                          isBold: true,
                          size: 10),
                      CustomListViewWidget(
                        color: Colors.yellow,
                        list: pokemon.type ?? [],
                      ),

                      const CustomTextWidget(
                          text: "Weakness",
                          color: Colors.black,
                          isBold: true,
                          size: 10),
                      CustomListViewWidget(
                        color: Colors.red,
                        list: pokemon.weaknesses ?? [],
                      ),
                      if(pokemon.nextEvolution!= null && pokemon.nextEvolution!.isNotEmpty)
                      const CustomTextWidget(
                              text: "Next Evaluation",
                              color: Colors.black,
                              isBold: true,
                              size: 10),
                      if(pokemon.nextEvolution!= null && pokemon.nextEvolution!.isNotEmpty)
                        CustomListViewWidget(
                            color: Colors.green,
                            list: pokemon.nextEvolution ?? [],
                      ),
                      if(pokemon.prevEvolution!= null && pokemon.prevEvolution!.isNotEmpty)
                      const CustomTextWidget(
                              text: "Prev Evaluation",
                              color: Colors.black,
                              isBold: true,
                              size: 10),
                      if(pokemon.prevEvolution!= null && pokemon.prevEvolution!.isNotEmpty)
                        CustomListViewWidget(
                            color: Colors.blue,
                            list: pokemon.prevEvolution ?? [],
                      ),

                    ],
                  ),
                ),


              ),
            ),
            Positioned(
                top: SizeConfig.screenHeight! * 0.08, left: SizeConfig.screenWidth!*0.36,
                child: Image.network(pokemon.img!, height: 100, width: 100)),




          ],

        ),
      ),
    );
  }
}
