import 'package:add_to_cart/view/add_to_cart_screen.dart';
import 'package:add_to_cart/viewModel/food_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.white),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize: const Size(360, 746),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (context) => FoodViewModel(),
          child: StreamProvider<InternetConnectionStatus>(
            initialData: InternetConnectionStatus.connected,
            create: (_){
              return InternetConnectionChecker().onStatusChange;
            },
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Add To Cart Design',
              theme: ThemeData(
                primarySwatch: Colors.grey,
                textTheme: GoogleFonts.interTextTheme(),
              ),
              home: const AddToCartScreen(),
            ),
          ),
        );
      },
    );
  }
}
