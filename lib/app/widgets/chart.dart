import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import 'package:flutter_complete_guide/const/const.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: kMainMargin,
      color: kPurpulColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GetBuilder<HomeController>(
          builder: (builderController) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: builderController.getListOfCharts.sublist(0, 6),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: builderController.getListOfCharts.sublist(6, 12),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
