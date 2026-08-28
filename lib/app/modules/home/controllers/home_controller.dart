import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();

  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey whyChooseKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey serviceAreasKey = GlobalKey();
  final GlobalKey footerKey = GlobalKey();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final dateController = TextEditingController();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      alignment: 0.0,
    );
  }

  Future<bool> sendQuoteEmail() async {
    try {
      final response =
          await Supabase.instance.client.functions.invoke(
        'send-quote-email',
        body: {
          'name': nameController.text.trim(),
          'phone': phoneController.text.trim(),
          'email': emailController.text.trim(),
          'fromLoc': fromController.text.trim(),
          'toLoc': toController.text.trim(),
          'date': dateController.text.trim(),
        },
      );

      debugPrint(
        'Quote email response: ${response.data}',
      );

      return true;
    } catch (e) {
      debugPrint(
        'Quote email error: $e',
      );

      return false;
    }
  }
}

