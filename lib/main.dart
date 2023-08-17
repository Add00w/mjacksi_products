import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle, SystemChrome;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/core.dart';
import 'features/products/products.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: MjacksiColors.lightBackground),
  );
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      home: ProviderScope(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            // unfocus any input field on tap outside
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: const ProductsView(),
        ),
      ),
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
