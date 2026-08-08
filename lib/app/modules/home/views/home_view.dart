import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/data/city_model.dart';
import 'package:aipm_app/app/data/service_model.dart';
import 'package:aipm_app/app/modules/home/views/custom_appbar.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
import 'package:aipm_app/app/widgets/dynamic_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Scrollbar(
        controller: controller.scrollController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            children: [
              HeroSection(),
              AboutSection(),
              ServicesSection(),
              ServiceAreasSection(),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  HeroSection({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: controller.heroKey,
      height: 760,
      width: double.infinity,
      child: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.network(
              "https://picsum.photos/1920/1080",
              fit: BoxFit.cover,
            ),
          ),

          /// Dark Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xff07224D).withValues(alpha: .92),
                    const Color(0xff07224D).withValues(alpha: .75),
                    Colors.black.withValues(alpha: .45),
                    Colors.transparent,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),

          /// Content
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1320),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// LEFT SIDE
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffFDB913),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: DynamicText(
                              "ALL INDIA PACKERS & MOVERS",
                              style: AppTextStyles.barlow700(
                                fontSize: AppFontSize.fs18,
                              ),
                            ),
                          ),

                          const SizedBox(height: 28),

                          DynamicText(
                            "Trusted Packers &\nMovers Across India",
                            style: AppTextStyles.oswald800(
                              fontSize: AppFontSize.fs44,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 24),

                          SizedBox(
                            width: 650,
                            child: DynamicText(
                              "Professional household shifting, office relocation, vehicle transportation, packing, unpacking, loading, and unloading services with safe handling and timely delivery.",
                              style: AppTextStyles.barlow300(
                                fontSize: AppFontSize.fs24,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          const SizedBox(height: 40),

                          Wrap(
                            spacing: 30,
                            runSpacing: 22,
                            children: const [
                              FeatureItem("Household Shifting"),
                              FeatureItem("Office Relocation"),
                              FeatureItem("Vehicle Transportation"),
                              FeatureItem("Packing & Unpacking"),
                              FeatureItem("Door-to-Door Service"),
                              FeatureItem("Affordable Pricing"),
                            ],
                          ),

                          const SizedBox(height: 55),

                          Container(
                            width: 360,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffFDB913),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(
                                0xff0A2A63,
                              ).withValues(alpha: .55),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFDB913),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.call, size: 30),
                                ),

                                const SizedBox(width: 18),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DynamicText(
                                      "Call Now:",
                                      style: AppTextStyles.barlow400(
                                        fontSize: AppFontSize.fs20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    DynamicText(
                                      "+91 988 363 2477",
                                      style: AppTextStyles.barlow600(
                                        fontSize: AppFontSize.fs26,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 70),

                    /// RIGHT SIDE
                    Expanded(
                      flex: 4,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 620,
                          width: 470,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .25),
                                blurRadius: 25,
                                offset: const Offset(0, 15),
                              ),
                            ],
                          ),

                          /// Replace this with QuoteForm()
                          child: QuoteForm(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuoteForm extends StatelessWidget {
  const QuoteForm({super.key});

  Widget _input({
    required IconData icon,
    required String label,
    required String hint,
    IconData? suffix,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: const Color(0xffF5F7FB),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xff5D6B82), size: 22),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DynamicText(
                label,
                style: AppTextStyles.barlow700(
                  fontSize: AppFontSize.fs16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 46,
                child: TextField(
                  style: AppTextStyles.barlow600(
                    fontSize: AppFontSize.fs18,
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: AppTextStyles.barlow500(
                      fontSize: AppFontSize.fs16,
                      color: Colors.grey.shade500,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: suffix != null
                        ? Icon(suffix, size: 18, color: Colors.grey)
                        : null,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: Color(0xff083A86),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Header
        Container(
          height: 85,
          padding: const EdgeInsets.symmetric(horizontal: 28),
          decoration: const BoxDecoration(
            color: Color(0xff083A86),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          child: Row(
            children: [
              Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: const Color(0xffFDB913).withValues(alpha: .15),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xffFDB913), width: 2),
                ),
                child: const Icon(
                  Icons.local_shipping,
                  color: Color(0xffFDB913),
                  size: 28,
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: DynamicText(
                  "Get a Free Moving Quote",
                  style: AppTextStyles.oswald500(
                    fontSize: AppFontSize.fs30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),

        /// Scrollable Body
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _input(
                  icon: Icons.person_outline,
                  label: "Name",
                  hint: "Your Name",
                ),

                const SizedBox(height: 18),

                _input(
                  icon: Icons.call_outlined,
                  label: "Phone Number",
                  hint: "Your Phone Number",
                ),

                const SizedBox(height: 18),

                _input(
                  icon: Icons.location_on_outlined,
                  label: "Pickup Location",
                  hint: "From (City/Address)",
                ),

                const SizedBox(height: 18),

                _input(
                  icon: Icons.location_on_outlined,
                  label: "Destination Location",
                  hint: "To (City/Address)",
                ),

                const SizedBox(height: 18),

                _input(
                  icon: Icons.calendar_month_outlined,
                  label: "Moving Date",
                  hint: "Select Moving Date",
                  suffix: Icons.calendar_today_outlined,
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xffFDB913),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: DynamicText(
                      "SUBMIT REQUEST",
                      style: AppTextStyles.barlow700(
                        fontSize: AppFontSize.fs18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AboutSection extends StatelessWidget {
  AboutSection({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.aboutKey,
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 20),
      child: Center(
        child: SizedBox(
          width: 1320,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// LEFT CONTENT
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        DynamicText(
                          "ABOUT US",
                          style: AppTextStyles.barlow700(
                            fontSize: AppFontSize.fs16,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 45,
                          height: 2,
                          color: const Color(0xffFDB913),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    DynamicText(
                      "Your Trusted Moving Partner",
                      style: AppTextStyles.oswald800(
                        fontSize: AppFontSize.fs38,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 28),

                    DynamicText(
                      "ALL INDIA PACKERS & MOVERS is a professional relocation company providing reliable packing and moving services throughout India. We specialize in safe transportation of household goods, office equipment, furniture, electronics, and vehicles.",
                      style: AppTextStyles.barlow500(
                        fontSize: AppFontSize.fs18,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 22),

                    DynamicText(
                      "Our experienced team uses quality packing materials and modern handling techniques to ensure your belongings reach their destination safely and on time.",
                      style: AppTextStyles.barlow500(
                        fontSize: AppFontSize.fs18,
                        color: Colors.grey.shade800,
                      ),
                    ),

                    const SizedBox(height: 40),

                    SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xff062D6D),
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DynamicText(
                              "LEARN MORE ABOUT US",
                              style: AppTextStyles.barlow500(
                                fontSize: AppFontSize.fs16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 12),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 55),

              /// CENTER IMAGE
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    "https://picsum.photos/500/700",
                    height: 620,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 55),

              /// WHY CHOOSE US
              const Expanded(flex: 3, child: WhyChooseUsCard()),
            ],
          ),
        ),
      ),
    );
  }
}

class WhyChooseUsCard extends StatelessWidget {
  const WhyChooseUsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      "Experienced Moving Professionals",
      "Secure Packing Materials",
      "Affordable and Transparent Pricing",
      "Timely Pickup and Delivery",
      "Door-to-Door Service",
      "Customer-Focused Support",
      "Local and Long-Distance Relocation",
    ];

    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .12),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DynamicText(
            "Why Choose Us?",
            style: AppTextStyles.oswald800(
              fontSize: AppFontSize.fs38,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 30),

          ...items.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: Color(0xff0A377A),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.workspace_premium,
                      size: 20,
                      color: Color(0xffFDB913),
                    ),
                  ),

                  const SizedBox(width: 18),

                  Expanded(
                    child: DynamicText(
                      e,
                      style: AppTextStyles.barlow500(
                        fontSize: AppFontSize.fs18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  const FeatureItem(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 34,
          width: 34,
          decoration: const BoxDecoration(
            color: Color(0xffFDB913),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.black, size: 20),
        ),
        const SizedBox(width: 12),
        DynamicText(
          title,
          style: AppTextStyles.barlow600(
            fontSize: AppFontSize.fs18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class ServicesSection extends StatelessWidget {
  ServicesSection({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.servicesKey,
      width: double.infinity,
      color: const Color(0xffFAFBFD),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1320),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DynamicText(
                "OUR SERVICES",
                style: AppTextStyles.barlow700(
                  fontSize: AppFontSize.fs16,
                  color: Colors.blue.shade800,
                ),
              ),

              const SizedBox(height: 10),

              DynamicText(
                "Complete Moving Solutions",
                textAlign: TextAlign.center,
                style: AppTextStyles.oswald800(
                  fontSize: AppFontSize.fs38,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 55),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: services.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 22,
                  mainAxisSpacing: 22,
                  childAspectRatio: 1.18,
                ),
                itemBuilder: (context, index) {
                  return ServiceCard(service: services[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.service});

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xffECECEC)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          /// LEFT CONTENT
          Expanded(
            flex: 5,
            child: Scrollbar(
              thumbVisibility: false,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Color(0xffFDB913),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.local_shipping_outlined,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: DynamicText(
                            service.title,
                            style: AppTextStyles.oswald600(
                              fontSize: AppFontSize.fs22,
                              color: Colors.black87,
                            ).copyWith(letterSpacing: .5),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    DynamicText(
                      service.description,
                      style: AppTextStyles.barlow500(
                        fontSize: AppFontSize.fs16,
                        color: Colors.grey.shade800,
                      ),
                    ),

                    const SizedBox(height: 20),

                    DynamicText(
                      "Included:",
                      style: AppTextStyles.barlow800(
                        fontSize: AppFontSize.fs18,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 14),

                    ...service.features.map(
                      (feature) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 2),
                              child: Icon(
                                Icons.check,
                                color: Color(0xff2E63F3),
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: DynamicText(
                                feature,
                                style: AppTextStyles.barlow500(
                                  fontSize: AppFontSize.fs16,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 5),

          /// RIGHT IMAGE
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: SizedBox.expand(
                child: Image.network(service.image, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceAreasSection extends StatelessWidget {
  ServiceAreasSection({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.serviceAreasKey,
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1320),
          child: Column(
            children: [
              DynamicText(
                "SERVICE AREAS",
                style: AppTextStyles.barlow700(
                  fontSize: AppFontSize.fs16,
                  color: Colors.blue.shade800,
                ),
              ),

              const SizedBox(height: 10),

              DynamicText(
                "Packers and Movers Services Available In",
                textAlign: TextAlign.center,
                style: AppTextStyles.oswald800(
                  fontSize: AppFontSize.fs38,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 45),

              Wrap(
                spacing: 18,
                runSpacing: 22,
                alignment: WrapAlignment.center,
                children: cities
                    .map(
                      (city) =>
                          SizedBox(width: 190, child: CityCard(city: city)),
                    )
                    .toList(),
              ),

              const SizedBox(height: 40),

              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 18,
                  ),
                  side: const BorderSide(color: Color(0xff0B4AA2), width: 1.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DynamicText(
                      "AND MANY MORE CITIES ACROSS INDIA",
                      style: AppTextStyles.barlow700(
                        fontSize: AppFontSize.fs16,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: Color(0xff141414),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CityCard extends StatelessWidget {
  const CityCard({super.key, required this.city});

  final CityModel city;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xffE7EAF0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
              child: AspectRatio(
                aspectRatio: 2.3,
                child: Image.network(city.image, fit: BoxFit.cover),
              ),
            ),

            /// City Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Color(0xff0B3F91),
                    size: 20,
                  ),

                  const SizedBox(width: 4),

                  Flexible(
                    child: DynamicText(
                      city.name,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.barlow700(
                        fontSize: AppFontSize.fs18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  FooterSection({super.key});

  final controller = Get.find<HomeController>();

  Widget _divider() {
    return Container(
      width: 1,
      height: 260,
      margin: const EdgeInsets.symmetric(horizontal: 18),
      color: Colors.white.withValues(alpha: .08),
    );
  }

  Widget _companyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.network("https://picsum.photos/60", width: 55, height: 55),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DynamicText(
                  "ALL INDIA",
                  style: AppTextStyles.oswald800(
                    fontSize: AppFontSize.fs20,
                    color: Colors.white,
                  ),
                ),
                DynamicText(
                  "PACKERS & MOVERS",
                  style: AppTextStyles.barlow600(
                    fontSize: AppFontSize.fs16,
                    color: Color(0xffFDB913),
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 28),

        DynamicText(
          "Your trusted partner for safe, fast\nand reliable moving services\nacross India.",
          style: AppTextStyles.barlow300(
            fontSize: AppFontSize.fs15,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 30),

        Wrap(
          runSpacing: 5,
          // spacing: 5,
          children: [
            _social(Icons.facebook, Colors.blue),
            _social(Icons.camera_alt, Colors.purple),
            _social(Icons.chat, Colors.grey),
            _social(Icons.call, Colors.green),
            _social(Icons.play_arrow, Colors.red),
          ],
        ),
      ],
    );
  }

  Widget _services() {
    return _footerList("Our Services", [
      "Household Shifting",
      "Office Relocation",
      "Vehicle Transportation",
      "Packing & Unpacking",
      "Loading & Unloading",
      "Warehouse & Storage",
    ]);
  }

  Widget _contactUs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DynamicText(
          "Contact Us",
          style: AppTextStyles.oswald700(
            fontSize: AppFontSize.fs19,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 12),

        _contact(Icons.call, "+91 988 363 2477"),
        const SizedBox(height: 5),
        _contact(Icons.email_outlined, "info@example.com"),
        const SizedBox(height: 5),
        _contact(Icons.location_on_outlined, "Siliguri, West Bengal, India"),
      ],
    );
  }

  Widget _businessHours() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DynamicText(
          "Business Hours",
          style: AppTextStyles.oswald700(
            fontSize: AppFontSize.fs19,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 5),

        DynamicText(
          "Mon - Sun",
          style: AppTextStyles.barlow300(
            fontSize: AppFontSize.fs15,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 5),

        DynamicText(
          "8:00 AM - 8:00 PM",
          style: AppTextStyles.barlow300(
            fontSize: AppFontSize.fs15,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 28),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xffFDB913),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Icon(Icons.call, size: 28, color: Color(0xff07275B)),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DynamicText(
                    "Call Now",
                    style: AppTextStyles.barlow600(
                      fontSize: AppFontSize.fs16,
                      color: Color(0xff07275B),
                    ),
                  ),
                  SizedBox(height: 4),
                  DynamicText(
                    "+91 988 363 2477",
                    style: AppTextStyles.barlow700(
                      fontSize: AppFontSize.fs20,
                      color: Color(0xff07275B),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _footerList(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DynamicText(
          title,
          style: AppTextStyles.oswald700(
            fontSize: AppFontSize.fs19,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 12),

        ...items.map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: DynamicText(
              e,
              style: AppTextStyles.barlow300(
                fontSize: AppFontSize.fs15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _contact(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.circle, size: 0),
        Icon(icon, color: const Color(0xffFDB913), size: 18),
        const SizedBox(width: 14),
        Expanded(
          child: DynamicText(
            text,
            style: AppTextStyles.barlow300(
              fontSize: AppFontSize.fs15,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _social(IconData icon, Color color) {
    return Container(
      width: 42,
      height: 42,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.footerKey,
      color: const Color(0xff07275B),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1320),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _companyInfo()),

                    _divider(),

                    Expanded(flex: 2, child: _services()),

                    _divider(),

                    Expanded(flex: 3, child: _contactUs()),

                    _divider(),

                    Expanded(flex: 3, child: _businessHours()),
                  ],
                ),
              ),
            ),
          ),

          Container(height: 1, color: Colors.white.withValues(alpha: .08)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1320),
                child: Row(
                  children: [
                    DynamicText(
                      "© 2024 ALL INDIA PACKERS & MOVERS. All Rights Reserved.",
                      style: AppTextStyles.barlow300(
                        fontSize: AppFontSize.fs12,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    DynamicText(
                      "Designed for Safe & Secure Moving",
                      style: AppTextStyles.barlow300(
                        fontSize: AppFontSize.fs12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
