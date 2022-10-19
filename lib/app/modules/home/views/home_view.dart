import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../const/const.dart';
import '../../../widgets/IconPlusButton.dart';
import '../../../widgets/transaction_list.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    double height = mediaQuery.size.height;
    /*for rendering difrent dependent on orientation*/
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    return Container(
      decoration: kBoxLinearGradient,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(decoration: kBoxLinearGradient),
          title: Center(
            child: Text(
              'Expenses Counter',
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
              //chartOn?
              /* ? Chart(
                      listOfTransactionl: []/* list of transaction */,
                    )
                  : */
              TransactionList(
                lfDeleteTransaction: () {/*TODO delete transaction */},
                listTransactions: [],
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: height * 0.0256),
          child: IconPlusButton(
            callBack: () => {} /* startAddNewTransaction(context) */,
            iconSize: height * 0.0384,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
