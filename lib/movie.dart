class Movie {
  Movie(int id, String title, String thumbnail, String director,
      [double rating = 0, double price = 0, double discountPrice = 0]) {
    this.id = id;
    this.title = title;
    this.thumbnail = thumbnail;
    this.director = director;
    this.rating = rating;
    this.price = price;
    this.discountPrice = discountPrice;
  }

  int id;
  String thumbnail;
  String title;
  String director;
  double rating;
  double price;
  double discountPrice;
}
