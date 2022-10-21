import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

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
  var uuid = Uuid();

  List<Rehabilitation> listofRehabilitation = [];

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
  void changeHoursToUse() async {
    var newHours = double.parse(textControllerhouersToUse.text);
    houerToUse = newHours;
    await dataBase.updateHourSpent(newHours);
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
        id: uuid.v4());
    listofRehabilitation.insert(
      0,
      rehabilitation,
    );
    houerToUse -= hourSpent;
    await dataBase.saveRehabilitation(rehabilitation);
    update();

    Get.back();
  }

  deleteRehabilitation(Rehabilitation rehabilitation) async {
    listofRehabilitation
        .removeWhere((element) => element.id == rehabilitation.id);
    houerToUse += rehabilitation.hourSpent;

    await dataBase.deleteRehabilitation(rehabilitation);

    update();
  }

/*   var storage = GetStorage();
  saveRehabilitationToStorage() {
    var rebilitationMap = listofRehabilitation.map((e) => e.toJson()).toList();
    print(rebilitationMap);
    storage.write('rehabilitation', rebilitationMap);
  } */

  @override
  void onInit() async {
    houerToUse = await dataBase.getHourSpent();
    listofRehabilitation = await dataBase.getRehabilitation();

    update();
    /* listofRehabilitation =
        rehabilitationStorage.map((e) => Rehabilitation.fromJson(e)).toList(); */

    super.onInit();
  }
}
