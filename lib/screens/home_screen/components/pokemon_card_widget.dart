import 'package:flutter/material.dart';
import 'package:pokemon_eraa_soft/core/utils/size_config.dart';

class PokemonCardWidget extends StatelessWidget {
  PokemonCardWidget({Key? key, required this.image, required this.text}) : super(key: key);

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth!*.35,
      height: SizeConfig.screenHeight!* 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Color of the shadow
            spreadRadius: 4, // Spread radius
            blurRadius: 4, // Blur radius
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(image, height: 85, width: 85),
            Text(text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),)
          ],
        ),
      ),
    );
  }
}