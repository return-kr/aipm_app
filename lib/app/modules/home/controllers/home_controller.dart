import 'package:aipm_app/app/data/models/city_model.dart';
import 'package:aipm_app/app/data/models/nav_item_model.dart';
import 'package:aipm_app/app/data/models/quote_model.dart';
import 'package:aipm_app/app/data/models/service_model.dart';
import 'package:aipm_app/app/data/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ===============================================================
/// HOME CONTROLLER
/// ---------------------------------------------------------------
/// Controller for the Home page.
/// ===============================================================

class HomeController extends GetxController {
  HomeController({required this._repository});

  final HomeRepository _repository;

  // ---------------------------------------------------------------------------
  // Loading
  // ---------------------------------------------------------------------------

  final RxBool isLoading = false.obs;

  // ---------------------------------------------------------------------------
  // Data
  // ---------------------------------------------------------------------------

  final RxList<ServiceModel> services = <ServiceModel>[].obs;
  final RxList<CityModel> cities = <CityModel>[].obs;

  // ---------------------------------------------------------------------------
  // Form
  // ---------------------------------------------------------------------------

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final messageController = TextEditingController();
  final dateController = TextEditingController();

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  // ---------------------------------------------------------------------------
  // Section Keys
  // ---------------------------------------------------------------------------

  final heroKey = GlobalKey();
  final homeSectionKey = GlobalKey();
  final aboutSectionKey = GlobalKey();
  final servicesSectionKey = GlobalKey();
  final citiesSectionKey = GlobalKey();
  final testimonialsSectionKey = GlobalKey();
  final faqSectionKey = GlobalKey();
  final contactSectionKey = GlobalKey();
  final quoteSectionKey = GlobalKey();
  final whyChooseSectionKey = GlobalKey();

  // ---------------------------------------------------------------------------
  // Scroll Helper
  // ---------------------------------------------------------------------------

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  // ---------------------------------------------------------------------------
  // Public Scroll Methods
  // ---------------------------------------------------------------------------

  void scrollToHomeSection() => _scrollTo(homeSectionKey);

  void scrollToAboutSection() => _scrollTo(aboutSectionKey);

  void scrollToServicesSection() => _scrollTo(servicesSectionKey);

  void scrollToCitiesSection() => _scrollTo(citiesSectionKey);

  void scrollToTestimonialsSection() => _scrollTo(testimonialsSectionKey);

  void scrollToFaqSection() => _scrollTo(faqSectionKey);

  void scrollToContactSection() => _scrollTo(contactSectionKey);

  void scrollToQuoteSection() => _scrollTo(quoteSectionKey);

  void scrollToWhyChooseSection() => _scrollTo(whyChooseSectionKey);

  void scrollToHeroSection() => _scrollTo(heroKey);

  // ---------------------------------------------------------------------------
  // Navigation
  // ---------------------------------------------------------------------------

  final List<NavItemModel> navItems = [
    NavItemModel(title: 'Home', sectionId: 'home', sectionKey: GlobalKey()),
    NavItemModel(title: 'About', sectionId: 'about', sectionKey: GlobalKey()),
    NavItemModel(
      title: 'Services',
      sectionId: 'services',
      sectionKey: GlobalKey(),
    ),
    NavItemModel(title: 'Cities', sectionId: 'cities', sectionKey: GlobalKey()),
    NavItemModel(
      title: 'Testimonials',
      sectionId: 'testimonials',
      sectionKey: GlobalKey(),
    ),
    NavItemModel(title: 'FAQ', sectionId: 'faq', sectionKey: GlobalKey()),
    NavItemModel(
      title: 'Contact',
      sectionId: 'contact',
      sectionKey: GlobalKey(),
    ),
  ];

  // ---------------------------------------------------------------------------
  // Submission State
  // ---------------------------------------------------------------------------

  final RxBool isSubmitting = false.obs;

  // ---------------------------------------------------------------------------
  // Moving Date
  // ---------------------------------------------------------------------------

  final Rxn<DateTime> movingDate = Rxn<DateTime>();

  Future<void> pickMovingDate(BuildContext context) async {
    final DateTime now = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: movingDate.value ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );

    if (picked != null) {
      movingDate.value = picked;
    }
  }

  String get movingDateText {
    final date = movingDate.value;

    if (date == null) {
      return 'Select Moving Date';
    }

    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    fromController.dispose();
    toController.dispose();
    messageController.dispose();
    super.onClose();
  }

  // ---------------------------------------------------------------------------
  // Data Loading
  // ---------------------------------------------------------------------------

  Future<void> loadData() async {
    isLoading.value = true;

    services.assignAll(_repository.getServices());
    cities.assignAll(_repository.getCities());

    isLoading.value = false;
  }

  // ---------------------------------------------------------------------------
  // Quote
  // ---------------------------------------------------------------------------

  QuoteModel buildQuote() {
    return QuoteModel(
      name: '',
      phoneNumber: '',
      pickupLocation: '',
      destinationLocation: '',
      movingDate: '',
    );
  }

  Future<void> submitQuote() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    isSubmitting.value = true;

    try {
      final quote = buildQuote();

      debugPrint('Quote Submitted: $quote');

      await Future.delayed(const Duration(seconds: 1));

      Get.snackbar(
        'Success',
        'Your quote request has been submitted successfully.',
        snackPosition: SnackPosition.BOTTOM,
      );

      clearForm();
    } finally {
      isSubmitting.value = false;
    }
  }

  void clearForm() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    fromController.clear();
    toController.clear();
    messageController.clear();
    movingDate.value = null;
  }
}
