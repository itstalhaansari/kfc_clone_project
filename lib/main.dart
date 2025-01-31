import 'package:flutter/material.dart';
import 'package:kfc_project/pages/homepage.dart';
import 'package:kfc_project/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:kfc_project/providers/theme_providers.dart';
import 'theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => cartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
      ],
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'KFC Pakistan',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: Provider.of<ThemeProvider>(context).getThemeMode(),
          home: const Homepage(),
        ),
      ),
    );
  }
}
