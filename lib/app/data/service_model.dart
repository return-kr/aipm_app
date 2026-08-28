import 'package:aipm_app/app/data/app_images.dart';

class ServiceModel {
  final String title;
  final String description;
  final String image;
  final List<String> features;

  const ServiceModel({
    required this.title,
    required this.description,
    required this.image,
    required this.features,
  });
}

final List<ServiceModel> services = [
  ServiceModel(
    title: "Household\nShifting Services",
    description:
        "We provide complete household relocation services, including packing, loading, transportation, unloading, and unpacking.",
    image: AppImages.household,
    features: [
      "Furniture Packing",
      "Kitchen Item Packing",
      "Electronics Handling",
      "Fragile Item Protection",
      "Door-to-Door Delivery",
    ],
  ),

  ServiceModel(
    title: "Office Relocation\nServices",
    description:
        "Efficient office shifting solutions designed to minimize business downtime while ensuring safety.",
    image: AppImages.office,
    features: [
      "Office Furniture Moving",
      "Computer & IT Equipment",
      "Document Transportation",
      "Corporate Relocation Support",
    ],
  ),

  ServiceModel(
    title: "Packing &\nUnpacking Services",
    description:
        "Professional packing using premium quality materials to keep every item secure throughout the move.",
    image: AppImages.packing,
    features: [
      "Safe Packing",
      "Labeling",
      "Unpacking Assistance",
      "Arrangement Support",
    ],
  ),

  ServiceModel(
    title: "Loading & Unloading\nServices",
    description:
        "Our experienced workforce ensures careful loading and unloading with proper handling procedures.",
    image: AppImages.loading,
    features: [
      "Skilled Labor",
      "Equipment Handling",
      "Safe Loading Procedures",
    ],
  ),

  ServiceModel(
    title: "Vehicle Transportation\nServices",
    description:
        "Secure transportation solutions for cars and bikes across India with complete safety measures.",
    image: AppImages.vehicle,
    features: [
      "Car Carrier Services",
      "Bike Transportation",
      "Door Pickup & Delivery",
      "Transit Safety Measures",
    ],
  ),

  ServiceModel(
    title: "Warehouse & Storage\nServices",
    description:
        "Flexible short-term and long-term storage solutions for household and commercial goods.",
    image: AppImages.warehouse,
    features: [
      "Household Storage",
      "Office Storage",
      "Inventory Management",
      "Security Monitoring",
    ],
  ),
];
