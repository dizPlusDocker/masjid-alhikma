import 'package:com_alhikma_moschee/views/widgets/screens_animation_widget.dart';
import 'package:com_alhikma_moschee/views/constants/app_mode_translator.dart';
import 'package:com_alhikma_moschee/views/screens/quran_kareem_screen.dart';
import 'package:com_alhikma_moschee/views/screens/compass_screen.dart';
import 'package:com_alhikma_moschee/views/screens/salawat_screen.dart';
import 'package:com_alhikma_moschee/views/screens/setting_screen.dart';
import 'package:com_alhikma_moschee/views/screens/tasbeha_screen.dart';
import 'package:com_alhikma_moschee/views/widgets/build_get_page.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/screens/splash_screen.dart';
import 'package:com_alhikma_moschee/views/screens/sebha_screen.dart';
import 'package:com_alhikma_moschee/views/screens/azkar_screen.dart';
import 'package:com_alhikma_moschee/views/screens/home_screen.dart';
import 'package:com_alhikma_moschee/views/screens/sura_screen.dart';
import 'package:com_alhikma_moschee/views/screens/zkr_screen.dart';
import 'package:get/get.dart';

List<GetPage> generateGetPages() {
  return [
    createGetPage(
      name: AppConstants.splashRout,
      page: const SplashScreen(),
    ),
    createGetPage(
      name: AppConstants.homeRout,
      page: const HomeScreen(),
    ),
    createGetPage(
      name: AppConstants.quranKareemRout,
      page: const QuranKareemScreen(),
    ),
    createGetPage(
      name: AppConstants.suraRout,
      page: const SuraScreen(),
    ),
    createGetPage(
      name: AppConstants.salawatRout,
      page: const SalawatScreen(),
    ),
    createGetPage(
      name: AppConstants.azkarRout,
      page: const AzkarScreen(),
    ),
    createGetPage(
      name: AppConstants.zkrRout,
      page: const ZkrScreen(),
    ),
    createGetPage(
      name: AppConstants.sebhaRout,
      page: const SebhaScreen(),
    ),
    createGetPage(
      name: AppConstants.tasbihaRout,
      page: const TasbehaScreen(),
    ),
    createGetPage(
      name: AppConstants.compassRout,
      page: const CompassScreen(),
    ),
    createGetPage(
      name: AppConstants.settingRout,
      page: const SettingScreen(),
    ),
    createGetPage(
      name: AppConstants.animatedQuranKareemRout,
      page: ScreensAnimationWidget(
        title: AppConstants.quranKareemText,
        image: AppConstants.quranBlueIconImage.modeTranslator,
        nextScreen: const QuranKareemScreen(),
      ),
    ),
    createGetPage(
      name: AppConstants.animatedSalawatRout,
      page: ScreensAnimationWidget(
        title: AppConstants.salawatTimeText,
        image: AppConstants.salawatBlueIconImage.modeTranslator,
        nextScreen: const SalawatScreen(),
      ),
    ),
    createGetPage(
      name: AppConstants.animatedAzkarRout,
      page: ScreensAnimationWidget(
        title: AppConstants.azkarText,
        image: AppConstants.azkarBlueIconImage.modeTranslator,
        nextScreen: const AzkarScreen(),
      ),
    ),
    createGetPage(
      name: AppConstants.animatedCompassRout,
      page: ScreensAnimationWidget(
        title: AppConstants.qiblahText,
        image: AppConstants.compassBlueIconImage.modeTranslator,
        nextScreen: const CompassScreen(),
      ),
    ),
    createGetPage(
      name: AppConstants.animatedSettingRout,
      page: ScreensAnimationWidget(
        title: AppConstants.settingText,
        image: AppConstants.settingBlueIconImage.modeTranslator,
        nextScreen: const SettingScreen(),
      ),
    ),
  ];
}
