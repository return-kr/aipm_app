import 'package:aipm_app/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: 'AIPM App',
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      getPages: AppPages.routes,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 599, name: MOBILE),
          const Breakpoint(start: 600, end: 899, name: TABLET),
          const Breakpoint(start: 900, end: double.infinity, name: DESKTOP),
        ],
      ),
    ),
  );
}
