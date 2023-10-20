import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session8/services/shared_prefrence_helper.dart';
import 'package:session8/views/Authentication%20Screen/view/authentication_screen.dart';
import '../../../blocs/doctor_appointment_app_cubit.dart';
import '../../../components/custom_container.dart';
import '../../../components/custom_text.dart';
import '../../../core/size_config.dart';

import '../components/custom_list_tile.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            SharedPreferenceHelper.removeData(key: "USER_TOKEN");
            SharedPreferenceHelper.removeData(key: "USER_NAME");
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (BuildContext context) => const AuthenticationScreen()),
                    (route) => false);
          }, icon: const Icon(Icons.logout)),
        ],
      ),
      body: BlocConsumer<DoctorAppointmentAppCubit, DoctorAppointmentAppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = DoctorAppointmentAppCubit.get(context);

          return Column(children: [
            CustomContainer(
              text: "Appointments",
              icon: Icons.menu,
            ),
            const SizedBox(height: 25),
            CustomText(
              textContent: "Wednesday, 22 May 2019",
              fontSize: 25,
              isBold: true,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cubit.appointments.length,
                itemBuilder: (context, index) {
                  return CustomListTile(
                    doctorName: cubit.appointments[index].doctorName,
                    time: cubit.appointments[index].time,
                    trailingIcon: cubit.appointments[index].trailingIcon,
                    trailingIconColor:
                        cubit.appointments[index].trailingIconColor,
                  );
                },
              ),
            ),
          ]);
        },
      ),
    );
  }
}
