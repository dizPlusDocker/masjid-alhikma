import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/controllers/main_controller.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:com_alhikma_moschee/views/constants/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return ScreenUtilInit(
      designSize: const Size(350, 700),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetBuilder<MainController>(
            init: MainController(),
            builder: (controller) {
              return FutureBuilder<bool>(
                future: controller.getTheme(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GetMaterialApp(
                      title: AppConstants.appName,
                      debugShowCheckedModeBanner: false,
                      theme: snapshot.data ?? true
                          ? ThemeData(
                              primarySwatch: AppColors().defaultDarkColor,
                              canvasColor: AppColors.dark,
                            )
                          : ThemeData(
                              primarySwatch: AppColors().defaultLightColor,
                              canvasColor: AppColors.dark,
                            ),
                      initialRoute: AppConstants.splashRout,
                      getPages: generateGetPages(),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              );
            });
      },
    );
  }
}
