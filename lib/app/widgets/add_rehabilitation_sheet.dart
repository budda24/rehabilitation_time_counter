import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../const/const.dart';

class NewTransaction extends StatelessWidget {
  /*data picker*/
  DateTime? chosenDate;

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
                controller: homeController.textControllerAmount,
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
                height: 10,
              ),
              TextField(
                controller: homeController.textControllertitle,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: kPurpulColor,
                  icon: Icon(
                    Icons.all_inclusive_outlined,
                    color: kPurpulColor,
                  ),
                  label: Text(
                    'Title',
                    style: TextStyle(color: kMainColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              /* GetBuilder<HomeController>(
                builder: (controller) => DropdownButton(
                  hint: Text(
                    'Mounth',
                  ),
                  onChanged: (newValue) {
                    controller.monthSelected = newValue.toString();
                    controller.update();
                  },
                  value: controller.monthSelected,
                  items: controller.mounthList.map((selectedType) {
                    return DropdownMenuItem(
                      child: Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 120),
                        color: kPurpulColor,
                        child: Text(
                          selectedType,
                          style: TextStyle(color: kMainColor),
                        ),
                      ),
                      value: selectedType,
                    );
                  }).toList(),
                ),
              ), */
              IconButton(
                  /*alignment: Alignment.centerRight,*/
                  onPressed: () => homeController.selectDate(context),
                  icon: Icon(Icons.calendar_today)),
              SizedBox(
                height: 0.0204.sh,
              ),
              TextButton(
                onPressed: () {
                  print('add transaction');
                  homeController.addNewRehabilitation();
                },
                child: Text(
                  'Add Rehabilitation',
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
