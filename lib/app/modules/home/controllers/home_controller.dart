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

  int houerToUse = 10;
  void changeHoursToUse() {
    houerToUse = int.parse(textControllerhouersToUse.text);
  }

  final List<Transaction> listTransactions = [
    Transaction(amount: 2, month: 'Jan', id: 't1', title: 'shoes'),
    Transaction(amount: 2, month: 'Mar', id: 't2', title: 'golf')
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

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future showBottomSheetNewTransaction() {
    return Get.bottomSheet(NewTransaction());
  }

  Future showBottomSheetNewhouers() {
    return Get.bottomSheet(NewAvailableTimeSheet());
  }

  void addTransaction(Transaction transaction) {
    listTransactions.add(transaction);
  }

  List<Map<String, dynamic>> get grupedTransactionValues {
    return mounthList.map((e) {
      double houersSpent = 0;
      listTransactions.forEach((element) {
        if (e == element.month) {
          houersSpent += element.amount;
        }
      });
      return {'mounth': e, 'houers_spent': houersSpent};
    }).toList();
  }

  /*creating the list of widgets chart*/
  List<Widget> get listOfCharts {
    List<Widget> barList = [];
    if (grupedTransactionValues.isNotEmpty) {
      int lenght = grupedTransactionValues.length;
      for (int i = 0; i < lenght; i++) {
        barList.add(Flexible(
          fit: FlexFit.tight,
          child: ChartBar(
              lable: grupedTransactionValues[i]['mounth'].toString(),
              spendedamount: double.parse(
                  grupedTransactionValues[i]['houers_spent'].toString()),
              totalSpendedamount: 4 //TODO total spending,
              ),
        ));
      }
    } else {
      listOfCharts.add(ChartBar(
          lable: 'there is no transaction',
          spendedamount: 0,
          totalSpendedamount: 0));
    }
    return barList;
  }

  void addNewTransaction() {
    listTransactions.add(
      Transaction(
          amount: double.parse(textControllerAmount.text),
          title: textControllertitle.text,
          month: monthSelected,
          id: 'index${listTransactions.length}'),
    );
    update();
    Get.back();
  }
}
