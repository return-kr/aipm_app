import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ujfghlyvqydpdolhjjxa.supabase.co',
    publishableKey: 'sb_publishable_8CWEHoOkOsih_k74hDjJYQ_uZiLC8Yv',
  );
  runApp(
    GetMaterialApp(
      title: "All India Packers and Movers",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
