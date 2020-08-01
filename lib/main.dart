import 'package:flutter/material.dart';
import 'package:hello_flutter/movie.dart';
import 'package:hello_flutter/movie_card.dart';

import 'detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFF8F8F8),
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () => {},
          ),
        ),
        body: HomePage(
          movies: [
            Movie(
              1,
              'The Astronaut',
              "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/space-movie-poster-design-template-18133e937d93002c68b4649ea234d75f_screen.jpg",
              'John Doe',
              4.5,
              100,
            ),
            Movie(
              2,
              'Avengers | Endgame',
              "https://images-na.ssl-images-amazon.com/images/I/71niXI3lxlL._AC_SY679_.jpg",
              'Joe Russo',
              4.0,
              65.78,
              60,
            ),
            Movie(
              3,
              'Black Widow',
              "https://www.joblo.com/assets/images/joblo/posters/2020/03/2EF9FAE7-B888-4DBA-868D-B4E289BAE769.jpeg",
              'Cate Shortland',
              4.0,
              80,
              75,
            ),
            Movie(
              4,
              'A Star is Born',
              "https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/star-is-born-web.jpg",
              'Bradley Cooper',
              5.0,
              50,
            ),
            Movie(
              5,
              'Star Wars | The Last Jedi',
              "https://images-na.ssl-images-amazon.com/images/I/7105gTLLZlL._AC_SY679_.jpg",
              'Rian Johnson',
              4.7,
              24,
              20,
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Movie> movies;

  const HomePage({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Text(
            'Featured',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return InkWell(
                  child: MovieItem(
                    movie: movies[index],
                  ),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            movies[index],
                            relatedMovies: movies,
                          ),
                        ),
                      ));
            },
          ),
        )
      ],
    );
  }
}
