class PhonesModel {
  String image;
  String secondImage;
  String title;
  String subtitle;
  bool favorite;

  PhonesModel(
      {required this.image,
      required this.secondImage,
      required this.title,
      required this.subtitle,
      required this.favorite});
//lets create our clothes list

  static PhonesModel newclothes = PhonesModel(
      image: "assets/images/phone.jpg",
      secondImage: "phone/clothes.jpg",
      title: "new",
      subtitle: "best",
      favorite: true);

  static List<PhonesModel> phones = [
    PhonesModel(
        image: "assets/images/phone2.jpg",
        secondImage: "assets/images/phone2.jpg",
        title: "new Stock",
        subtitle: "50UGS",
        favorite: false),
    PhonesModel(
        image: "assets/images/phone3.jpg",
        secondImage: "assets/images/phone3.jpg",
        title: "Anti-Dark Spot Fade Cream",
        subtitle: "1000 UGS,",
        favorite: false),
    PhonesModel(
        image: "assets/images/phone4.jpg",
        secondImage: "assets/images/phone4.jpg",
        title: "LUIS VUTTON",
        subtitle: "500UGS,",
        favorite: false),
    PhonesModel(
        image: "assets/images/phone5.jpg",
        secondImage: "assets/images/phone5.jpg",
        title: "LUIS VUTTON",
        subtitle: "800UGS,",
        favorite: false),
    PhonesModel(
        image: "assets/images/shirt.jpg",
        secondImage: "assets/images/clothes.jpg",
        title: "LUIS VUTTON",
        subtitle: "400UGS,",
        favorite: false),
  ];
}
