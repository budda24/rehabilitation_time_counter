import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../const/const.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(
      {Key? key, required this.getTransactionList, required this.mediaQuery})
      : super(key: key);
  final Function getTransactionList;
  final MediaQueryData mediaQuery;

  static final TextEditingController titleControler = TextEditingController();
  static final TextEditingController amountControler = TextEditingController();

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  /*data picker*/
  DateTime? chosenDate;

  Future<void> selectDate(BuildContext context) async {
    /*for the purpous to use it in condition if null on widget tree*/
    chosenDate = DateTime.now();
    /*function to open and use datetime sheet*/
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 7)),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != chosenDate) {
      setState(() {
        chosenDate = pickedDate;
      });
    }
  }

  void submitData() {
    final transactionTitle = NewTransaction.titleControler.text;
    final transactionAmount = double.parse(NewTransaction.amountControler.text);
    /*not allowing to submit without required teext fields*/
    if (transactionTitle.isEmpty || transactionAmount <= 0) {
      return;
    }
    widget.getTransactionList(
      transactionTitle,
      transactionAmount,
      chosenDate,
    );
    NewTransaction.titleControler.clear();
    NewTransaction.amountControler.clear();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      double width = constrains.maxWidth;
      double height = constrains.maxHeight;
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
                controller: NewTransaction.amountControler,
                onSubmitted: (_) => submitData(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: kGreColor,
                  icon: Icon(
                    Icons.account_balance_wallet_outlined,
                    color: kGreColor,
                  ),
                  label: Text(
                    'Amount spent',
                    style: TextStyle(color: kMainColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: NewTransaction.titleControler,
                onSubmitted: (_) => submitData(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: kGreColor,
                  icon: Icon(
                    Icons.all_inclusive_outlined,
                    color: kGreColor,
                  ),
                  label: Text(
                    'Title',
                    style: TextStyle(color: kMainColor),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  chosenDate == null
                      ? Flexible(
                          child: Text(
                            'Date not chosen',
                          ),
                        )
                      : Flexible(
                          child: FittedBox(
                            child: Text(
                              'Your chosen date ${DateFormat.yMd().format(chosenDate ??= DateTime.now())}',
                            ),
                          ),
                        ),
                  IconButton(
                      /*alignment: Alignment.centerRight,*/
                      onPressed: () => selectDate(context),
                      icon: Icon(Icons.calendar_today)),
                ],
              ),
              SizedBox(
                height: height * 0.0204,
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: widget.mediaQuery.viewInsets.bottom),
                child: TextButton(
                  onPressed: () => submitData(),
                  child: Text(
                    'Add Expenses',
                    style: kTextTitle.copyWith(color: kMainColor),
                  ),
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    elevation: MaterialStateProperty.all(8),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                    backgroundColor: MaterialStateProperty.all(kGreColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
