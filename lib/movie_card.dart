import 'package:flutter/material.dart';
import 'package:hello_flutter/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Spacer(),
                MovieInformation(movie: movie),
              ],
            ),
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                movie.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
            width: 110,
          ),
        ],
      ),
    );
  }
}

class MovieInformation extends StatelessWidget {
  final Movie movie;

  MovieInformation({this.movie}) : super(key: ObjectKey(movie));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          const Radius.circular(8),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x90d5e0e8),
            offset: Offset(0, 10),
            blurRadius: 16,
          )
        ],
      ),
      padding: const EdgeInsets.only(left: 110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Text(
              movie.title,
              style: TextStyle(
                fontSize: 20,
                height: 1.3,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16),
            child: Text(
              movie.director,
              style: TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 16,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 16,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 16,
                ),
                Icon(
                  Icons.star,
                  color: Colors.black12,
                  size: 16,
                ),
                Icon(
                  Icons.star,
                  color: Colors.black12,
                  size: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    movie.rating.toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12, left: 16),
                child: Text(
                  '\$${movie.price}',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12, left: 4),
                child: Text(
                  '\$${movie.discountPrice}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
