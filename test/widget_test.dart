import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:com_alhikma_moschee/main.dart';

void main() {
  testWidgets(
    AppConstants.appName,
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
    },
  );
}
