import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/transaction.dart';
import '../../../widgets/add_time_sheet.dart';
import '../../../widgets/chart_bar.dart';
import '../../../widgets/add_rehabilitation_sheet.dart';

class HomeController extends GetxController {
  final TextEditingController textControllerAmount = TextEditingController();
  final TextEditingController textControllertitle = TextEditingController();
  final TextEditingController textControllerhouersToUse =
      TextEditingController();

  double houerToUse = 10.0;
  void changeHoursToUse() {
    houerToUse = double.parse(textControllerhouersToUse.text);
  }

  final List<Transaction> listofRehabilitation = [
    Transaction(amount: 2, date: DateTime.now(), id: 't1', title: 'shoes'),
    Transaction(amount: 2, date: DateTime.parse('1969-08-20 20:18:04Z'), id: 't2', title: 'golf')
  ];

  var monthSelected = 'Jan';
  final List<String> mounthList = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  Future showBottomSheetNewTransaction() {
    return Get.bottomSheet(NewTransaction());
  }

  Future showBottomSheetNewhouers() {
    return Get.bottomSheet(NewAvailableTimeSheet());
  }

  List<Map<String, dynamic>> getChartBarValues() {
    List<Map<String, dynamic>> chartBarValues = [];
    for (var i = 0; i < mounthList.length; i++) {
      double hoursSpent = 0;
      listofRehabilitation.forEach((element) {
        if (element.date.month + 1 == i) {
          hoursSpent += element.amount;
        }
      });
      chartBarValues.add({'mounth': mounthList[i], 'houers_spent': hoursSpent});
    }
    return chartBarValues;
  }

  /*creating the list of widgets chart*/
  List<Widget> get getListOfCharts {
    List<Widget> barList = [];
    var rehabilitationSpentHouerList = getChartBarValues();

    int lenght = rehabilitationSpentHouerList.length;
    for (int i = 0; i < lenght; i++) {
      print('$i : ${rehabilitationSpentHouerList[i]['houers_spent']}');

      barList.add(Flexible(
        fit: FlexFit.tight,
        child: ChartBar(
            lable: rehabilitationSpentHouerList[i]['mounth'].toString(),
            spendedamount: rehabilitationSpentHouerList[i]['houers_spent'],
            totalSpendedamount: houerToUse //TODO total spending,
            ),
      ));
    }

    return barList;
  }

  void addNewTransaction() {
    var hourSpent = double.parse(textControllerAmount.text);
    listofRehabilitation.add(
      Transaction(
          amount: hourSpent,
          title: textControllertitle.text,
          date: DateTime.now(),
          id: 'index${listofRehabilitation.length}'),
    );
    houerToUse -= hourSpent;
    update();
    Get.back();
  }
}
