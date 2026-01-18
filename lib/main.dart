import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:media/splash_screen.dart';
import 'package:media/webview_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
         statusBarColor: Colors.white, 
      statusBarIconBrightness: Brightness.dark, 
      statusBarBrightness: Brightness.light, 
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const WebViewScreen(),
        title: 'Natural Calm',
      ),
    );
  }
}




