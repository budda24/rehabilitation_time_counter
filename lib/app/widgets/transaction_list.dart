import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/const/const.dart';

import '../data/transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList(
      {required this.listTransactions, required this.lfDeleteTransaction});

  final List<Transaction> listTransactions;
  final Function lfDeleteTransaction;

  final randomColors = [
    Colors.black,
    Colors.white,
    Colors.grey,
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Container(
      /*ListView.builder needs parent with constrain height*/
      height: height * 0.5,
      child: listTransactions.isEmpty
          ? Center(
              child: Column(
                children: [
                  Card(
                    color: kPurpulColor,
                    child: Text(
                      'You don\'t have expenses yet :)',
                      style: kTextTitle,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.0307,
                  ),
                  Container(
                    height: height * 0.2,
                    child: Image.asset('assets/images/waiting.png'),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: listTransactions.length,
              /*ctx = context*/
              itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: height * 0.0409, vertical: width * 0.0128),
                  /*padding: const EdgeInsets.only(top: 8.0),*/
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(width: 3, color: kPurpulColor)),
                    leading: CircleAvatar(
                      radius: 50,
                      backgroundColor: randomColors[index],
                      child: FittedBox(
                        child: Text(
                          '\$${listTransactions[index].amount.toStringAsFixed(2)}',
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
                            listTransactions[index].month,
                            style: TextStyle(
                              color: kPurpulColor,
                            ),
                          ),
                        ]),
                    trailing: IconButton(
                        onPressed: () =>
                            lfDeleteTransaction(listTransactions[index].id),
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
