import 'package:aipm_app/app/data/app_images.dart';

class CityModel {
  final String name;
  final String image;

  const CityModel({required this.name, required this.image});
}

final List<CityModel> cities = [
  CityModel(name: "Kolkata", image: AppImages.kolkata),
  CityModel(name: "Siliguri", image: AppImages.siliguri),
  CityModel(name: "Darjeeling", image: AppImages.darjeeling),
  CityModel(name: "Jalpaiguri", image: AppImages.jalpaiguri),
  CityModel(name: "Malda", image: AppImages.malda),
  CityModel(name: "Asansol", image: AppImages.asansol),
  CityModel(name: "Durgapur", image: AppImages.durgapur),
  CityModel(name: "Howrah", image: AppImages.howrah),
  CityModel(name: "Kharagpur", image: AppImages.kharagpur),
  CityModel(name: "Raiganj", image: AppImages.raigunj),
  CityModel(name: "Cooch Behar", image: AppImages.coochbehar),
];
