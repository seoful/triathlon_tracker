import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:triathlon_tracker/presentation/home_screen.dart';
import 'package:triathlon_tracker/presentation/onboarding/onboarding_main_screen.dart';
import 'package:triathlon_tracker/presentation/statistics_screen.dart';

void main(){
  group('Onbording', () {
    testWidgets("Onbording1 screen", (WidgetTester tester) async {
      final name = find.byType(TextField);

      await tester.pumpWidget(MaterialApp(home: OnBoardingMainScreen()));
      await tester.enterText(name, 'eldar');

      expect(find.byKey(ValueKey('onbordingbuttom1')), findsOneWidget);
      expect(find.byKey(ValueKey('onbordingbuttom2')), findsOneWidget);
      expect(find.text('eldar'), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
      expect(find.text("We are glad you joined us! Let's get acquainted"),
          findsOneWidget);
      expect(find.text("Your name is"), findsOneWidget);
    });


    testWidgets("checking Onboarding 2 and returning to onbording1", (
        WidgetTester tester) async {
      final name = find.byType(TextField);

      await tester.pumpWidget(MaterialApp(home: OnBoardingMainScreen()));
      await tester.enterText(name, 'eldar');
      await tester.tap(find.byKey(ValueKey('custombuttom')));
      await tester.pump();
      final bottomback = find.byKey(ValueKey('onbordingbuttom1'));

      await tester.tap(bottomback);

      expect(find.text('eldar'), findsOneWidget);
      expect(find.byKey(ValueKey('onbordingbuttom2')), findsOneWidget);
      expect(find.byKey(ValueKey('onbordingbuttom1')), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
    });
  });

  group('HomeScreen', () {
    testWidgets("Swimming", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SwimmingIndicator(total: 40)));

      expect(find.byKey(ValueKey('Swimming')), findsOneWidget);
      expect(find.byIcon(Icons.add_rounded), findsOneWidget);
      expect(find.text("Log"), findsOneWidget);
      expect(find.text('0/40'), findsOneWidget);
    });


    testWidgets("Cycling", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CyclingIndicator(total: 500)));

      expect(find.byKey(ValueKey('Cycling')), findsOneWidget);
      expect(find.byIcon(Icons.add_rounded), findsOneWidget);
      expect(find.text("Log"), findsOneWidget);
      expect(find.text('0/500'), findsOneWidget);
    });


    testWidgets("Running", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: RunningIndicator(total: 200)));

      expect(find.byKey(ValueKey('Running')), findsOneWidget);
      expect(find.byIcon(Icons.add_rounded), findsOneWidget);
      expect(find.text("Log"), findsOneWidget);
      expect(find.text('0/200'), findsOneWidget);
    });
  });

  testWidgets('StaticScreen', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: StatisticsScreen()));

    expect(find.byType(Container), findsOneWidget);
  });

}
