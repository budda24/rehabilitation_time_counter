import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../const/const.dart';
import '../../../widgets/IconPlusButton.dart';

import '../../../widgets/transaction_list.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxLinearGradient,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(decoration: kBoxLinearGradient),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 0.0342.sw),
              child: IconPlusButton(
                callBack: () {
                  controller.showBottomSheetNewhouers();
                },
                iconSize: 0.0256.sh,
              ),
            )
          ],
          title: Center(
            child: Text(
              'Rehabilitation Counter',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 6,
                margin: kMainMargin,
                color: kPurpulColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GetBuilder<HomeController>(
                    builder: (builderController) {
                      return Text(
                        'hours left : ${builderController.houerToUse.toString()}',
                        style: TextStyle(color: kMainColor),
                      );
                    },
                  ),
                ),
              ),
              GetBuilder<HomeController>(builder: (builderController) {
                builderController.sortRehabilitation();
                return TransactionList(
                  deleteTransaction: builderController.deleteRehabilitation,
                  listTransactions: builderController.listofRehabilitation,
                );
              }),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 0.0256.sh),
          child: IconPlusButton(
            callBack: () => {controller.showBottomSheetNewTransaction()},
            iconSize: 0.0384.sh,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
