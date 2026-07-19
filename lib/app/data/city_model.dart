class CityModel {
  final String name;
  final String image;

  const CityModel({required this.name, required this.image});
}

final List<CityModel> cities = [
  CityModel(name: "Kolkata", image: "https://picsum.photos/400/220?random=11"),
  CityModel(name: "Siliguri", image: "https://picsum.photos/400/220?random=12"),
  CityModel(
    name: "Darjeeling",
    image: "https://picsum.photos/400/220?random=13",
  ),
  CityModel(
    name: "Jalpaiguri",
    image: "https://picsum.photos/400/220?random=14",
  ),
  CityModel(name: "Malda", image: "https://picsum.photos/400/220?random=15"),
  CityModel(name: "Asansol", image: "https://picsum.photos/400/220?random=16"),
  CityModel(name: "Durgapur", image: "https://picsum.photos/400/220?random=17"),
  CityModel(name: "Howrah", image: "https://picsum.photos/400/220?random=18"),
  CityModel(
    name: "Kharagpur",
    image: "https://picsum.photos/400/220?random=19",
  ),
  CityModel(name: "Raiganj", image: "https://picsum.photos/400/220?random=20"),
  CityModel(
    name: "Cooch Behar",
    image: "https://picsum.photos/400/220?random=21",
  ),
];
