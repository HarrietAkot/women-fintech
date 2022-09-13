class ClothesModel {
  String image;
  String secondImage;
  String title;
  String subtitle;
  String clearanceText;
  bool favorite;

  ClothesModel(
      {required this.image,
      required this.secondImage,
      required this.title,
      required this.subtitle,
      required this.clearanceText,
      required this.favorite});
//lets create our clothes list

  static ClothesModel newclothes = ClothesModel(
      image: "assets/images/shirt.jpg",
      secondImage: "assets/images/clothes.jpg",
      title: "new",
      subtitle: "best",
      clearanceText: "1000UGS",
      favorite: true);

  static List<ClothesModel> clothes = [
    ClothesModel(
        image: "assets/images/women.jpg",
        secondImage: "assets/images/women.jpg",
        title: "new Stock",
        subtitle: "50UGS",
        clearanceText: "1000UGS",
        favorite: false),
    ClothesModel(
        image: "assets/images/phone.jpg",
        secondImage: "assets/images/phone.jpg",
        title: "Anti-Dark Spot Fade Cream",
        subtitle: "1000 UGS,",
        clearanceText: "1000UGS",
        favorite: false),
    ClothesModel(
        image: "assets/images/shirt.jpg",
        secondImage: "assets/images/image5.jpg",
        title: "LUIS VUTTON",
        subtitle: "500UGS,",
        clearanceText: "1000UGS",
        favorite: false),
    ClothesModel(
        image: "assets/images/shirt.jpg",
        secondImage: "assets/images/image8.jpg",
        title: "LUIS VUTTON",
        subtitle: "800UGS,",
        clearanceText: "1000UGS",
        favorite: false),
    ClothesModel(
        image: "assets/images/shirt.jpg",
        secondImage: "assets/images/clothes.jpg",
        title: "LUIS VUTTON",
        subtitle: "400UGS,",
        clearanceText: "1000UGS",
        favorite: false),
  ];
}
