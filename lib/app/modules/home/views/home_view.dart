import 'package:aipm_app/app/data/city_model.dart';
import 'package:aipm_app/app/data/service_model.dart';
import 'package:aipm_app/app/modules/home/views/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: const SingleChildScrollView(
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
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    const Color(0xff07224D).withOpacity(.92),
                    const Color(0xff07224D).withOpacity(.75),
                    Colors.black.withOpacity(.45),
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
                padding: const EdgeInsets.symmetric(horizontal: 30),
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
                            child: const Text(
                              "ALL INDIA PACKERS & MOVERS",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                          ),

                          const SizedBox(height: 28),

                          const Text(
                            "Trusted Packers &\nMovers Across India",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              height: 1.08,
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                          const SizedBox(height: 24),

                          SizedBox(
                            width: 650,
                            child: Text(
                              "Professional household shifting, office relocation, vehicle transportation, packing, unpacking, loading, and unloading services with safe handling and timely delivery.",
                              style: TextStyle(
                                color: Colors.white.withOpacity(.9),
                                fontSize: 20,
                                height: 1.6,
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
                            width: 380,
                            padding: const EdgeInsets.all(22),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffFDB913),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xff0A2A63).withOpacity(.55),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFDB913),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.call, size: 34),
                                ),

                                const SizedBox(width: 18),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Call Now:",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "+91 9883632477",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
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
                                color: Colors.black.withOpacity(.25),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Header
        Container(
          height: 95,
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
                  color: const Color(0xffFDB913).withOpacity(.15),
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
              const Expanded(
                child: Text(
                  "Get a Free Moving Quote",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
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
                    child: const Text(
                      "SUBMIT REQUEST",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
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
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 46,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
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
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 90),
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
                        const Text(
                          "ABOUT US",
                          style: TextStyle(
                            color: Color(0xff0B4AA2),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                            fontSize: 14,
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

                    const Text(
                      "Your Trusted Moving Partner",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff161616),
                      ),
                    ),

                    const SizedBox(height: 28),

                    Text(
                      "ALL INDIA PACKERS & MOVERS is a professional relocation company providing reliable packing and moving services throughout India. We specialize in safe transportation of household goods, office equipment, furniture, electronics, and vehicles.",
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.8,
                        color: Colors.grey.shade800,
                      ),
                    ),

                    const SizedBox(height: 22),

                    Text(
                      "Our experienced team uses quality packing materials and modern handling techniques to ensure your belongings reach their destination safely and on time.",
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.8,
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
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "LEARN MORE ABOUT US",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
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
            color: Colors.grey.withOpacity(.12),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Why Choose Us?",
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.w800),
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
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333),
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
  final String title;

  const FeatureItem(this.title, {super.key});

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
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xffFAFBFD),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1320),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "OUR SERVICES",
                style: TextStyle(
                  color: Color(0xff0B4AA2),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Complete Moving Solutions",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff141414),
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
  final ServiceModel service;

  const ServiceCard({super.key, required this.service});

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
            color: Colors.black.withOpacity(.05),
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
                          child: Text(
                            service.title,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff141414),
                              height: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Text(
                      service.description,
                      style: TextStyle(
                        fontSize: 17,
                        height: 1.7,
                        color: Colors.grey.shade700,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Included:",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
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
                              child: Text(
                                feature,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade800,
                                  height: 1.4,
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

          const SizedBox(width: 18),

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
  const ServiceAreasSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1320),
          child: Column(
            children: [
              const Text(
                "SERVICE AREAS",
                style: TextStyle(
                  color: Color(0xff0B4AA2),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Packers and Movers Services Available In",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff141414),
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
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "AND MANY MORE CITIES ACROSS INDIA",
                      style: TextStyle(
                        color: Color(0xff141414),
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        letterSpacing: .3,
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
  final CityModel city;

  const CityCard({super.key, required this.city});

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
              color: Colors.black.withOpacity(.05),
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
                    size: 18,
                  ),

                  const SizedBox(width: 4),

                  Flexible(
                    child: Text(
                      city.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff202020),
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
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff07275B),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 45),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1320),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _companyInfo()),

                    _divider(),

                    Expanded(flex: 2, child: _quickLinks()),

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

          Container(height: 1, color: Colors.white.withOpacity(.08)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1320),
                child: Row(
                  children: const [
                    Text(
                      "© 2024 ALL INDIA PACKERS & MOVERS. All Rights Reserved.",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                    Spacer(),
                    Text(
                      "Designed for Safe & Secure Moving",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
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

  Widget _divider() {
    return Container(
      width: 1,
      height: 260,
      margin: const EdgeInsets.symmetric(horizontal: 28),
      color: Colors.white.withOpacity(.08),
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ALL INDIA",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                Text(
                  "PACKERS & MOVERS",
                  style: TextStyle(
                    color: Color(0xffFDB913),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 28),

        const Text(
          "Your trusted partner for safe, fast\nand reliable moving services\nacross India.",
          style: TextStyle(color: Colors.white70, fontSize: 18, height: 1.8),
        ),

        const SizedBox(height: 30),

        Row(
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

  Widget _quickLinks() {
    return _footerList("Quick Links", [
      "Home",
      "About Us",
      "Services",
      "Service Areas",
      "Why Choose Us",
      "Contact Us",
    ]);
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
        const Text(
          "Contact Us",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),

        const SizedBox(height: 28),

        _contact(Icons.call, "+91 9883632477"),
        const SizedBox(height: 18),
        _contact(Icons.email_outlined, "info@example.com"),
        const SizedBox(height: 18),
        _contact(Icons.location_on_outlined, "Siliguri, West Bengal, India"),
      ],
    );
  }

  Widget _businessHours() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Business Hours",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),

        const SizedBox(height: 28),

        const Text(
          "Mon - Sun",
          style: TextStyle(color: Colors.white70, fontSize: 18),
        ),

        const SizedBox(height: 12),

        const Text(
          "8:00 AM - 8:00 PM",
          style: TextStyle(color: Colors.white70, fontSize: 18),
        ),

        const SizedBox(height: 28),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: const Color(0xffFDB913),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Row(
            children: [
              Icon(Icons.call, size: 28, color: Color(0xff07275B)),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Call Now",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xff07275B),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "+91 9883632477",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
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
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 28),

        ...items.map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Text(
              e,
              style: const TextStyle(color: Colors.white70, fontSize: 18),
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
        Icon(icon, color: const Color(0xffFDB913), size: 24),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 18,
              height: 1.5,
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
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }
}
