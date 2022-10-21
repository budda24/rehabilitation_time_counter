import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/rehabilitation.dart';
import '../../../services/db_services.dart';
import '../../../widgets/add_time_sheet.dart';
import '../../../widgets/add_rehabilitation_sheet.dart';

class HomeController extends GetxController {
  final TextEditingController textControllerAmount = TextEditingController();
  final TextEditingController textControllertitle = TextEditingController();
  final TextEditingController textControllerhouersToUse =
      TextEditingController();

  var dataBase = FirebaseDB();

  List<Rehabilitation> listofRehabilitation = [
    Rehabilitation(
        hourSpent: 2, date: DateTime.now(), id: 't1', title: 'shoes'),
    Rehabilitation(
        hourSpent: 2,
        date: DateTime.parse('1969-08-20 20:18:04Z'),
        id: 't2',
        title: 'golf')
  ];

  sortRehabilitation() {
    listofRehabilitation.sort((a, b) {
      return b.date.compareTo(a.date);
    });
  }

  Future showBottomSheetNewTransaction() {
    return Get.bottomSheet(NewTransaction());
  }

  Future showBottomSheetNewhouers() {
    return Get.bottomSheet(NewAvailableTimeSheet());
  }

  double houerToUse = 10.0;
  void changeHoursToUse() {
    houerToUse = double.parse(textControllerhouersToUse.text);
    update();
    /* saveHoursToUseToStorage(); */
    Get.back();
  }

  /* saveHoursToUseToStorage() {
    storage.write('hours_left', houerToUse);
  } */

  DateTime? chosenDate;
  Future<void> selectDate(BuildContext context) async {
    chosenDate = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );
    if (pickedDate != null && pickedDate != chosenDate) {
      chosenDate = pickedDate;
      update();
    }
  }

  void addNewRehabilitation() async {
    if (chosenDate == null || textControllerAmount.text.isEmpty) {
      var snackBar = Get.showSnackbar(GetSnackBar(
        message: 'value not chosen',
      ));
      await Future.delayed(Duration(seconds: 2));
      snackBar.close();

      return;
    }
    var hourSpent = double.parse(textControllerAmount.text);
    var rehabilitation = Rehabilitation(
        hourSpent: hourSpent,
        title: textControllertitle.text,
        date: chosenDate!,
        id: 'index${listofRehabilitation.length}');
    listofRehabilitation.insert(
      0,
      rehabilitation,
    );
    houerToUse -= hourSpent;
    await dataBase.saveRehabilitation(rehabilitation);
    update();

    Get.back();
  }

  deleteRehabilitation(Rehabilitation rehabilitation) {
    listofRehabilitation
        .removeWhere((element) => element.id == rehabilitation.id);
    houerToUse += rehabilitation.hourSpent;

    update();
  }

/*   var storage = GetStorage();
  saveRehabilitationToStorage() {
    var rebilitationMap = listofRehabilitation.map((e) => e.toJson()).toList();
    print(rebilitationMap);
    storage.write('rehabilitation', rebilitationMap);
  } */

  @override
  void onInit() {
    /* var rehabilitationStorage = (storage.read('rehabilitation')) as List; */
    /* listofRehabilitation =
        rehabilitationStorage.map((e) => Rehabilitation.fromJson(e)).toList(); */

    super.onInit();
  }
}
