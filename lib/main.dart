import 'package:fashoo/constants/theme.dart';
import 'package:fashoo/providers/navigation/main_navigation_provider.dart';
import 'package:fashoo/screens/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainNavigationProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: Themes().lightTheme,
        themeMode: ThemeMode.light,
        home: MainNavigation(),
      ),
    );
  }
}
