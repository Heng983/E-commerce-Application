import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:ecommerce_app/provider/theme_provider.dart';
import 'package:ecommerce_app/screen/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
    );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    // LIGHT LUXE COLORS
    const Color lSeedColor = Color(0xFFDBD4C9); 
    const Color lPrimaryColor = lSeedColor;
    const Color lSecondaryColor = Color(0xFF2C3E50); 
    const Color lBackgroundColor = Color(0xFFDBD4C9); 
    const Color lSurfaceColor = Color(0xFFE8E4DF);
    const Color lForegroundColor = Color(0xFF1A1A1A); 
    const Color lTertiaryColor = Color(0xFF757575);
    const Color lForegroundColor2 = Color(0xFF63452A);


    //  DARK LUXE COLORS
    const Color dSeedColor = Color(0xFF2A2522);
    const Color dPrimaryColor = dSeedColor;
    const Color dSecondaryColor = Color(0xFF1F2833); 
    const Color dBackgroundColor = Color(0xFF2A2522); 
    const Color dSurfaceColor = Color(0xFF36302C);
    const Color dForegroundColor = Color(0xFFC5C6C7); 
    const Color dTertiaryColor = Color(0xFF757575);
    const Color dForegroundColor2 = Color(0xFFFFD230);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeIndex == 0
          ? ThemeMode.system
          : themeProvider.themeIndex == 1
              ? ThemeMode.light
              : ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: lSeedColor,
          primary: lPrimaryColor,
          onPrimary: Colors.black,
          secondary: lSecondaryColor,
          onSecondary: Colors.white,
          surface: lSurfaceColor,
          onSurface: lForegroundColor,
          background: lBackgroundColor,
          tertiary: lTertiaryColor,
          onTertiary: lForegroundColor2,
        ),
        scaffoldBackgroundColor: lBackgroundColor,

        // APP_BAR
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: dSeedColor,
          brightness: Brightness.dark,
          primary: dPrimaryColor,
          onPrimary: Colors.white,
          secondary: dSecondaryColor,
          onSecondary: Color(0xFF684B3D),
          surface: dSurfaceColor,
          onSurface: dForegroundColor,
          background: dBackgroundColor,
          tertiary: dTertiaryColor,
          onTertiary: dForegroundColor2,
        ),
        scaffoldBackgroundColor: dBackgroundColor,
      ),
      home: FlutterSplashScreen.fadeIn(
        backgroundColor: const Color(0xFFFFEDCE),
        
        childWidget: SizedBox(
          height: 125,
          width: 125,
          child: Image.asset("assets/images/logo.png",
          fit: BoxFit.contain,),
        ),

        animationDuration: const Duration(seconds: 2),
        nextScreen: Mainscreen(),

        onInit: () {
          debugPrint("Splash Screen Initialized");
        },
        onEnd: () {
          debugPrint("Splash Screen Ended");
        },
      ),
    );
  }
}
