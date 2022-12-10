import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:triathlon_tracker/presentation/onboarding/onboarding_main_screen.dart';
import 'package:triathlon_tracker/presentation/statistics_screen.dart';

void main(){
  group('Onbording', () {
    testWidgets("Onbording1 screen", (WidgetTester tester) async {
      final name = find.byType(TextField);

      await tester.pumpWidget(const MaterialApp(home: OnBoardingMainScreen()));
      await tester.enterText(name, 'eldar');

      expect(find.byKey(const ValueKey('onbordingbuttom1')), findsOneWidget);
      expect(find.byKey(const ValueKey('onbordingbuttom2')), findsOneWidget);
      expect(find.text('eldar'), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
      expect(find.text("We are glad you joined us! Let's get acquainted"),
          findsOneWidget,);
      expect(find.text("Your name is"), findsOneWidget);
    });


    testWidgets("checking Onboarding 2 and returning to onbording1", (
        WidgetTester tester,) async {
      final name = find.byType(TextField);

      await tester.pumpWidget(const MaterialApp(home: OnBoardingMainScreen()));
      await tester.enterText(name, 'eldar');
      await tester.tap(find.byKey(const ValueKey('custombuttom')));
      await tester.pump();
      final bottomback = find.byKey(const ValueKey('onbordingbuttom1'));

      await tester.tap(bottomback);

      expect(find.text('eldar'), findsOneWidget);
      expect(find.byKey(const ValueKey('onbordingbuttom2')), findsOneWidget);
      expect(find.byKey(const ValueKey('onbordingbuttom1')), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
    });
  });

  testWidgets('StaticScreen', (WidgetTester tester) async{
    await tester.pumpWidget(const MaterialApp(home: StatisticsScreen()));

    expect(find.byType(Container), findsOneWidget);
  });

}
