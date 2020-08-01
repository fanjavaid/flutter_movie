// Routes
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hello_flutter/capsule_small.dart';
import 'package:hello_flutter/capsule_small_bordered.dart';
import 'package:hello_flutter/movie.dart';
import 'package:hello_flutter/rating.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;
  final List<Movie> relatedMovies;

  const DetailScreen(this.movie, {this.relatedMovies});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              brightness: Brightness.light,
              leading: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: DetailHeader(movie),
              ),
              expandedHeight: 380,
              backgroundColor: Colors.transparent,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      DetailTrailer(),
                      Divider(
                        indent: 16,
                        endIndent: 16,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Related Movies',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 128,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: relatedMovies.length,
                          itemBuilder: (context, index) {
                            return MovieRelated(
                              ObjectKey(movie),
                              relatedMovies[index],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 300,
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailHeader extends StatelessWidget {
  final Movie movie;

  const DetailHeader(this.movie);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PosterOverlay(movie.thumbnail),
        MovieHeadline(movie),
      ],
    );
  }
}

class DetailTrailer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Trailers',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Row(
          children: <Widget>[
            MovieTrailer(),
          ],
        )
      ],
    );
  }
}

/*class DetailRelated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Related Movies',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return MovieRelated();
            },
          ),
        ),
      ],
    );
  }
}*/

// Details small widget
class PosterOverlay extends StatelessWidget {
  final String imageUrl;

  const PosterOverlay(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.1,
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: 400,
        fit: BoxFit.cover,
      ),
    );
  }
}

class MovieHeadline extends StatelessWidget {
  final Movie movie;

  const MovieHeadline(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0),
      width: double.infinity,
      height: 380,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 260,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image.network(
                      movie.thumbnail,
                      width: 150,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    color: Colors.orange[700],
                    elevation: 6,
                    splashColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Buy \$${movie.price}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    shape: StadiumBorder(),
                    onPressed: () {
                      print('ok');
                    },
                  ),
                ),
              ],
            ),
          ),
          Text(
            movie.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            'Fantasy/Action | 2019 | 2h',
            style: TextStyle(fontSize: 10, color: Colors.black54),
          ),
          Container(
            width: 80,
            child: Rating(movie.rating.toInt()),
          ),
          Container(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CapsuleSmall('HDR'),
                CapsuleSmall('4K'),
                CapsuleSmallBordered('SDH'),
                CapsuleSmallBordered('CC'),
                CapsuleSmallBordered('AD'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MovieTrailer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 16.0),
          width: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: Image.network(
                'https://thumb.viva.co.id/media/frontend/thumbs3/2018/12/10/5c0e1a41712b5-iron-man-sekarat-dalam-trailer-avengers-endgame_665_374.jpg'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'Trailer 01',
            style: TextStyle(fontSize: 10),
          ),
        ),
      ],
    );
  }
}

class MovieRelated extends StatelessWidget {
  final Movie movie;

  const MovieRelated(Key key, this.movie) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        child: Image.network(movie.thumbnail),
      ),
    );
  }
}
