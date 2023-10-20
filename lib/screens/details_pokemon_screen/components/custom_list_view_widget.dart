import 'package:flutter/material.dart';

import '../../../core/utils/size_config.dart';
import 'h_or_w_text.dart';

class CustomListViewWidget extends StatelessWidget {
  const CustomListViewWidget({Key? key, required this.color, required this.list}) : super(key: key);
  final Color color;
  final List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth! * 0.75,
      height: 30,
      child: Center(
        child: ListView.separated(
          itemCount: list.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: color,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: CustomTextWidget(
                      text: list[index] is String? list[index] : list[index].name,
                      color: color != Colors.yellow ?Colors.white : Colors.black,
                      size: 10,
                      isBold: false,
                    ),
                  ),
                ),

              );
            }, separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 8,);
        },
        ),
      ),
    );
  }
}
