import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

@immutable
class ScreensAnimationWidget extends StatelessWidget {
  final String image;
  final String title;
  final Widget nextScreen;

  const ScreensAnimationWidget({
    super.key,
    required this.image,
    required this.title,
    required this.nextScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 2.sp,
          ),
          decoration: BoxDecoration(
            color: AppColors.light,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15.sp),
            ),
          ),
          child: AnimatedSplashScreen(
            splashIconSize: double.infinity,
            backgroundColor: AppColors.transparent,
            duration: 0,
            splashTransition: SplashTransition.fadeTransition,
            animationDuration: const Duration(seconds: 1),
            pageTransitionType: PageTransitionType.fade,
            splash: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 150.sp,
                      width: 150.sp,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.dark,
                        fontSize: 40.sp,
                        fontFamily: AppConstants.arabicFont,
                      ),
                    )
                  ],
                ),
              ),
            ),
            nextScreen: nextScreen,
          ),
        ),
      ),
    );
  }
}
