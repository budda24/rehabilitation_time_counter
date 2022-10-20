import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../const/const.dart';

class NewAvailableTimeSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var homeController = Get.find<HomeController>();
    return LayoutBuilder(builder: (context, constrains) {
      return Card(
        elevation: 5,
        child: Container(
          margin: kMainMargin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: homeController.textControllerhouersToUse,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: kPurpulColor,
                  icon: Icon(
                    Icons.account_balance_wallet_outlined,
                    color: kPurpulColor,
                  ),
                  label: Text(
                    'Time',
                    style: TextStyle(color: kMainColor),
                  ),
                ),
              ),
              SizedBox(
                height: 0.0204.sh,
              ),
              TextButton(
                onPressed: () {
                  
                },
                child: Text(
                  'Add Time',
                  style: kTextTitle.copyWith(color: kMainColor),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  elevation: MaterialStateProperty.all(8),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
                  backgroundColor: MaterialStateProperty.all(kPurpulColor),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
