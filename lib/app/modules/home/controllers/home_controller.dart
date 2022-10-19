import 'package:get/get.dart';

import '../../../data/transaction.dart';

class HomeController extends GetxController {
  bool isChartDisplayed = true;

  void startAddNewTransaction() {
    /* Get.showOverlay(
      context: ctx,
      isScrollControlled: true,
      : (_) {
        print('function trigered');
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: NewTransaction(
            getTransactionList: () {/*TODO add new transaction */},
            mediaQuery: MediaQuery.of(ctx),
          ),
        );
      },
    ); */
  }

  static final List<Transaction> listTransactions = [
    Transaction(amount: 155.00, date: DateTime.now(), id: 't1', title: 'shoes'),
    Transaction(amount: 122, date: DateTime.now(), id: 't2', title: 'golf')
  ];

  void addNewTransaction(String txTitle, double txAmount, DateTime date) {
    var tmpTx = Transaction(
        amount: txAmount, title: txTitle, date: date, id: 'transaction: index');
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
