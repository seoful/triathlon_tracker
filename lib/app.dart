import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:triathlon_tracker/core/app_theme.dart';
import 'package:triathlon_tracker/core/s.dart';
import 'package:triathlon_tracker/core/style.dart';
import 'package:triathlon_tracker/presentation/onboarding/onboarding_main_screen.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StaticS.init(context);

    // final themeColor = ref.watch(styleProvider).themeColor;
    // final colors = ref.watch(styleProvider).colors;
    // final locale = ref.watch(localeProvider);

    return MaterialApp(
      // theme: AppTheme.theme(themeColor, colors),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.supportedLocales,
      // locale: locale,
      home: const OnBoardingMainScreen(),
    );
  }
}
