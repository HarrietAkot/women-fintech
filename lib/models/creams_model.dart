class CreamsModel {
  String image;
  String secondImage;
  String title;
  String subtitle;
  bool favorite;

  CreamsModel(
      {required this.image,
      required this.secondImage,
      required this.title,
      required this.subtitle,
      required this.favorite});
//lets create our clothes list

  static CreamsModel newcreams = CreamsModel(
      image: "assets/images/phone.jpg",
      secondImage: "phone/clothes.jpg",
      title: "new",
      subtitle: "best",
      favorite: true);

  static List<CreamsModel> creams = [
    CreamsModel(
        image: "assets/images/image8.jpg",
        secondImage: "assets/images/image8.jpg",
        title: "new Stock",
        subtitle: "50UGS",
        favorite: false),
    CreamsModel(
        image: "assets/images/image5.jpg",
        secondImage: "assets/images/image5.jpg",
        title: "Anti-Dark Spot Fade Cream",
        subtitle: "1000 UGS,",
        favorite: false),
    CreamsModel(
        image: "assets/images/shirt.jpg",
        secondImage: "assets/images/image5.jpg",
        title: "LUIS VUTTON",
        subtitle: "500UGS,",
        favorite: false),
    CreamsModel(
        image: "assets/images/shirt.jpg",
        secondImage: "assets/images/image8.jpg",
        title: "LUIS VUTTON",
        subtitle: "800UGS,",
        favorite: false),
    CreamsModel(
        image: "assets/images/shirt.jpg",
        secondImage: "assets/images/clothes.jpg",
        title: "LUIS VUTTON",
        subtitle: "400UGS,",
        favorite: false),
  ];
}
