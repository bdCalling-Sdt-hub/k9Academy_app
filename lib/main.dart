import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:k9academy/core/app_routes/app_routes.dart';
import 'package:k9academy/core/dependency/dependency.dart';
import 'package:k9academy/global/theme/dark.dart';
import 'package:k9academy/services/socket.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependancyInjection di = DependancyInjection();
  // Stripe.publishableKey="pk_test_51OVds4FXV5mSrMWIG9iRJfAKrQz5njvvmmSZoveKWKs49x8FF8XMonesoct8hgNZJOxtwswNb2dSItdNAe7GfYLt00K4P9wt98";
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SocketApi.init();
  di.dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        theme: darkModeTheme,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 200),
        initialRoute: AppRoute.splashScreen,
        navigatorKey: Get.key,
        getPages: AppRoute.routes,
      ),
    );
  }
}
