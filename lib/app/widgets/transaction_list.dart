import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/const/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList(
      {required this.listTransactions, required this.deleteTransaction});

  final List<Transaction> listTransactions;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      /*ListView.builder needs parent with constrain height*/
      height: 0.5.sh,
      child: listTransactions.isEmpty
          ? Center(
              child: Column(
                children: [
                  Card(
                    color: kPurpulColor,
                    child: Text(
                      'You Rehabilitation Yet :)',
                      style: kTextTitle,
                    ),
                  ),
                  SizedBox(
                    height: 0.0307.sh,
                  ),
                  Container(
                    height: 0.2.sh,
                    child: Image.asset('assets/images/waiting.png'),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: listTransactions.length,
              itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 0.0409.sh, vertical: 0.0128.sw),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(width: 3, color: kPurpulColor)),
                    leading: CircleAvatar(
                      radius: 50,
                      backgroundColor: kPurpulColor,
                      child: FittedBox(
                        child: Text(
                          '\h: ${listTransactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: kMainColor,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      listTransactions[index].title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kPurpulColor),
                    ),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listTransactions[index].date.toString(),
                            style: TextStyle(
                              color: kPurpulColor,
                            ),
                          ),
                        ]),
                    trailing: IconButton(
                        onPressed: () =>
                            deleteTransaction(listTransactions[index].id),
                        icon: Icon(
                          Icons.auto_delete,
                          color: kPurpulColor,
                        )),
                  ),
                );
              },
            ),
    );
  }
}
