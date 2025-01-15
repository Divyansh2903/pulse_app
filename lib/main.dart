import 'package:attento_assignment/view/screens/home_screen.dart';
import 'package:attento_assignment/view_model/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 812),
        child: MaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'Pulse',
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
