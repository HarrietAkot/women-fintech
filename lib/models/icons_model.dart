
class IconModel {
  String icon;
  String title;

  IconModel({required this.icon, required this.title});

  static List<IconModel> icons = [
    IconModel(icon: "assets/icons/shirt.jpg", title: "Shirts"),
    IconModel(icon: "assets/icons/shoes.jpeg", title: "Shoes"),
    IconModel(icon: "assets/icons/image8.jpg", title: "Accessories"),
    IconModel(icon: "assets/icons/watch.png", title: "Watches"),
    IconModel(icon: "assets/icons/electronics.jpg", title: "Electronics"),
    IconModel(icon: "assets/icons/furniture.jpeg", title: "Furniture"),
    IconModel(icon: "assets/icons/furniture.png", title: "Custom"),
  ];
}
