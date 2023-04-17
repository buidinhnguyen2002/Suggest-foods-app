class Food {
  String? id;
  String? name;
  String? description;
  double? rate;
  String? category;
  String? urlImage;
  bool? favourite;
  Food(
      {this.id,
      this.name,
      this.description,
      this.rate,
      this.category,
      this.urlImage,
      this.favourite = false});
}
