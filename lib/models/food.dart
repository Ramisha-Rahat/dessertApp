class Food {
  String name;
  String price;
  String rating;
  String imagePath;


  Food({
    required this.name,
    required this.price,
    required this.rating,
    required this.imagePath,
  });

  String get _name => name;
  String get _price => price;
  String get _rating =>rating;
  String get _imagepath => imagePath;

}