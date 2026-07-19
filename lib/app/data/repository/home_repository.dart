import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_icons.dart';
import '../models/city_model.dart';
import '../models/service_model.dart';

/// ===============================================================
/// HOME REPOSITORY
/// ---------------------------------------------------------------
/// Provides static data for the Home module.
/// ===============================================================

class HomeRepository {
  const HomeRepository();

  //==========================================================================
  // Services
  //==========================================================================

  List<ServiceModel> getServices() {
    return [
      ServiceModel(
        id: 1,
        title: AppStrings.householdService,
        description: AppStrings.householdDescription,
        image: AppAssets.household,
        icon: IconData(
          AppIcons.house.codePoint,
          fontFamily: AppIcons.house.fontFamily,
          fontPackage: AppIcons.house.fontPackage,
        ),
        features: [
          AppStrings.furniturePacking,
          AppStrings.kitchenPacking,
          AppStrings.electronicsHandling,
          AppStrings.fragileProtection,
        ],
      ),
      ServiceModel(
        id: 2,
        title: AppStrings.officeService,
        description: AppStrings.officeDescription,
        image: AppAssets.office,
        icon: IconData(
          AppIcons.office.codePoint,
          fontFamily: AppIcons.office.fontFamily,
          fontPackage: AppIcons.office.fontPackage,
        ),
        features: [
          AppStrings.officeFurniture,
          AppStrings.computerHandling,
          AppStrings.documentTransportation,
          AppStrings.corporateSupport,
        ],
      ),
      ServiceModel(
        id: 3,
        title: AppStrings.packingService,
        description: AppStrings.packingDescription,
        image: AppAssets.packing,
        icon: IconData(
          AppIcons.box.codePoint,
          fontFamily: AppIcons.box.fontFamily,
          fontPackage: AppIcons.box.fontPackage,
        ),
        features: [
          AppStrings.safePacking,
          AppStrings.labeling,
          AppStrings.unpacking,
          AppStrings.arrangement,
        ],
      ),
      ServiceModel(
        id: 4,
        title: AppStrings.loadingService,
        description: AppStrings.loadingDescription,
        image: AppAssets.loading,
        icon: IconData(
          AppIcons.localShipping.codePoint,
          fontFamily: AppIcons.localShipping.fontFamily,
          fontPackage: AppIcons.localShipping.fontPackage,
        ),
        features: [
          AppStrings.skilledLabour,
          AppStrings.equipmentHandling,
          AppStrings.safeLoading,
        ],
      ),
      ServiceModel(
        id: 5,
        title: AppStrings.vehicleService,
        description: AppStrings.vehicleDescription,
        image: AppAssets.vehicle,
        icon: IconData(
          AppIcons.car.codePoint,
          fontFamily: AppIcons.car.fontFamily,
          fontPackage: AppIcons.car.fontPackage,
        ),
        features: [
          AppStrings.carCarrier,
          AppStrings.bikeTransportation,
          AppStrings.doorPickup,
          AppStrings.transitSafety,
        ],
      ),
      ServiceModel(
        id: 6,
        title: AppStrings.warehouseService,
        description: AppStrings.warehouseDescription,
        image: AppAssets.warehouse,
        icon: IconData(
          AppIcons.warehouse.codePoint,
          fontFamily: AppIcons.warehouse.fontFamily,
          fontPackage: AppIcons.warehouse.fontPackage,
        ),
        features: [
          AppStrings.householdStorage,
          AppStrings.officeStorage,
          AppStrings.inventoryManagement,
          AppStrings.securityMonitoring,
        ],
      ),
    ];
  }

  //==========================================================================
  // Service Areas
  //==========================================================================

  List<CityModel> getCities() {
    return const [
      CityModel(
        id: 1,
        name: AppStrings.kolkata,
        image: AppAssets.kolkata,
        description:
            'Professional household and office relocation services in Kolkata.',
      ),
      CityModel(
        id: 2,
        name: AppStrings.siliguri,
        image: AppAssets.siliguri,
        description: 'Reliable packing and moving services in Siliguri.',
      ),
      CityModel(
        id: 3,
        name: AppStrings.darjeeling,
        image: AppAssets.darjeeling,
        description: 'Safe relocation services across Darjeeling.',
      ),
      CityModel(
        id: 4,
        name: AppStrings.jalpaiguri,
        image: AppAssets.jalpaiguri,
        description: 'Complete shifting solutions in Jalpaiguri.',
      ),
      CityModel(
        id: 5,
        name: AppStrings.malda,
        image: AppAssets.malda,
        description: 'Trusted movers and packers in Malda.',
      ),
      CityModel(
        id: 6,
        name: AppStrings.asansol,
        image: AppAssets.asansol,
        description: 'Affordable relocation services in Asansol.',
      ),
      CityModel(
        id: 7,
        name: AppStrings.durgapur,
        image: AppAssets.durgapur,
        description: 'Home and office shifting services in Durgapur.',
      ),
      CityModel(
        id: 8,
        name: AppStrings.howrah,
        image: AppAssets.howrah,
        description: 'Professional movers serving Howrah.',
      ),
      CityModel(
        id: 9,
        name: AppStrings.kharagpur,
        image: AppAssets.kharagpur,
        description: 'Safe and secure relocation in Kharagpur.',
      ),
      CityModel(
        id: 10,
        name: AppStrings.raiganj,
        image: AppAssets.raiganj,
        description: 'Quality packing and transportation in Raiganj.',
      ),
      CityModel(
        id: 11,
        name: AppStrings.coochBehar,
        image: AppAssets.coochBehar,
        description: 'Reliable moving solutions in Cooch Behar.',
      ),
    ];
  }
}
