import 'package:flutter/material.dart';
import '../../../components/custom_circle_avatar.dart';
import '../../../components/custom_container.dart';
import '../../../components/custom_elevated_button.dart';
import '../../../components/custom_list_tile_for_my_account_and_patient_account.dart';
import '../../../components/custom_text.dart';

import '../../../core/size_config.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Column(
        children: [
          CustomContainer(text: "My Account", icon: Icons.menu),
          const SizedBox(height: 25),
          CustomCircleAvatar(imagePath: "assets/images/woman.png"),
          const SizedBox(height: 20),
          CustomText(
            textContent: "Maria loana Leonte",
            isBold: true,
            fontSize: 18,
            fontColor: Colors.grey,
          ),
          CustomText(
              textContent: "HCP Name",
              fontSize: 18,
              fontColor: Colors.grey,
              isBold: false),
          const SizedBox(height: 25),
          CustomListTileMyAccountAndPatientAccount(
            icon: Icons.phone_iphone,
            title: "07434697256",
            titleColor: Colors.grey,
          ),
          CustomListTileMyAccountAndPatientAccount(
              icon: Icons.alternate_email,
              title: "maria.leonte@gmail.com",
              titleColor: Colors.grey),
          CustomListTileMyAccountAndPatientAccount(
              icon: Icons.work_outlined,
              title: "49 Nerva Traian Streat, Bucharest",
              titleColor: Colors.grey),
          const SizedBox(height: 100),
          CustomElevatedButton(
              elevatedButtonName: "BACK",
              elevatedButtonColor: const Color(0xff3abdd7))
        ],
      ),
    );
  }
}
