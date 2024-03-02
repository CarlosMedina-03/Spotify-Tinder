import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/tinderPage.dart';
import 'package:flutter_application_1/src/homePage.dart';
import 'package:flutter_application_1/src/main.dart';
import 'package:flutter_application_1/src/GenreContainer.dart';
import 'package:flutter_application_1/src/PlaylistPage.dart';

class GenreSelectionPage extends StatelessWidget {
  List<String> genres = [
      "Pop", "Rock", "Jazz", "Hip Hop", "Classical",
      "Electronic", "Country", "R&B", "Reggae", "Blues",
      "Folk", "Metal", "Punk", "Alternative", "Indie",
      "Latin", "Gospel", "Funk", "Soul", "Disco"];

  List <String> selectedGenres = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Text("Select 1-3 genres:"),
        backgroundColor: Color.fromARGB(255, 20, 5, 70),
        foregroundColor: Color.fromARGB(255, 185, 165, 235),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate((genres.length / 2).ceil(), (index) {
              final int firstGenreIndex = index * 2;
              final int secondGenreIndex = firstGenreIndex + 1;
              return Row(
                children: [
                  Expanded(
                    child: GenreContainer(
                      genre: genres[firstGenreIndex],
                      onTap: () {
                        if (selectedGenres.contains(genres[firstGenreIndex])) {
                          selectedGenres.remove(genres[firstGenreIndex]);
                        }
                        else if (selectedGenres.length < 3) {
                          selectedGenres.add(genres[firstGenreIndex]);
                        }
                        // navigateToGenrePage(context, genres[firstGenreIndex]);
                        print(selectedGenres);
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: secondGenreIndex < genres.length
                      ? GenreContainer(
                          genre: genres[secondGenreIndex],
                          onTap: () {
                            if (selectedGenres.contains(genres[secondGenreIndex])) {
                              selectedGenres.remove(genres[secondGenreIndex]);
                            }
                            else if (selectedGenres.length < 3) {
                              selectedGenres.add(genres[secondGenreIndex]);
                            }
                            print(selectedGenres);
                            // navigateToGenrePage(context, genres[secondGenreIndex]);
                          },
                        )
                    : SizedBox(),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
        persistentFooterButtons: [
          TextButton(
            child: Text("Next"), 
            onPressed: () { 
              if (selectedGenres.isNotEmpty && selectedGenres.length <= 3) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => tinderPage(playlistSongs: [],)),
                );
              }
              print(selectedGenres);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 20, 5, 70)),
              foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 185, 165, 235)),
            ),
          )
        ],
      );
    }

  // void navigateToGenrePage(BuildContext context, String genre) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (context) => tinderPage()),
  //   );
  // }
}