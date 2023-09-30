import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_prefrence_session/screens/login_screen.dart';
import 'package:shared_prefrence_session/service/shared_prefrence_helper.dart';

import '../blocs/money_cubit.dart';
import '../components/text_field.dart';
import '../core/size_config.dart';

class Screen1 extends StatelessWidget {
  Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    double? total;
    var name = TextEditingController();
    var price = TextEditingController();
    return BlocConsumer<MoneyCubit, MoneyState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = MoneyCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Hi Jim",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff686a76),
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(flex: 1),
                        Icon(
                          Icons.settings,
                          color: Color(0xff686a76),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Color(0xff686a76),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        const Text(
                          "You've already spent",
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xff656576),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'YoungSerif'),
                        ),
                        IconButton(onPressed: () {
                          SharedPrefrenceHelper.removeData(key: "Email");
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ), (route) => false
                          );
                        }, icon: const Icon(Icons.logout))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 170,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/images/money.png", width: 40),
                              Text(
                                "\$$total",
                                style: const TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Text(
                          "and there's still 18 days left until payday",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    CustomTextField(name, price,(){
                      cubit.addToProducts(name.text, double.parse(price.text) );
                      print("ADDD");
                    }),
                    const Text(
                        "Recent Transactions", style: TextStyle(fontSize: 20)),
                    SizedBox(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight! * 0.3,
                      child: ListView.builder(
                        itemCount: cubit.products.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                    " ${cubit.products[index]['name']}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Text(" ${cubit.products[index]['price']}",
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
