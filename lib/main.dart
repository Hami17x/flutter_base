import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/easy_localization/localization_view.dart';
import 'package:flutter_base/pages/option_view.dart';
import 'package:flutter_base/theme/theme_provider.dart';
import 'package:flutter_base/theme/theme_view.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: MultiProvider(
            providers: [
              ChangeNotifierProvider<ThemeProvider>(
                  create: (context) => ThemeProvider())
            ],
            builder: (context, child) {
              return MyApp();
            })),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: context.watch<ThemeProvider>().themeMode,
      title: 'Material App',
      home: OptionView(),
    );
  }
}
