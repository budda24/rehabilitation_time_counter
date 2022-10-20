import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO run to implement walthrough
    return LayoutBuilder(
      builder: (context, constraints) => MediaQuery(
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          builder: (context, child) => GetMaterialApp(
            title: 'Application',
            getPages: AppPages.routes,
            initialRoute: Routes.HOME,
            defaultTransition: Transition.fadeIn,
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
