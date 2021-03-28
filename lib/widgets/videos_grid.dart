import 'package:flutter/material.dart';
import 'package:orange_valley_caa/models/video.dart';
import 'package:orange_valley_caa/pages/details_page.dart';

//-----------------------------------------------------
//------------Widget affichant une GridView------------
//-----------------------------------------------------
class VideosGrid extends StatelessWidget {
  final List<Video> videos;

  VideosGrid({this.videos});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, //Nombre de video par ligne
      children: [
        for (var video in videos)
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  video: video,
                ),
              ),
            ),
            child: _VideoTile(
              imageUrl: video.thumbnail,
              title: video.name,
            ),
          )
      ],
    );
  }
}

//---------------------------------------------------------------------
//------------Widget représentant un élément de la GridView------------
//---------------------------------------------------------------------
class _VideoTile extends StatelessWidget {
  _VideoTile({this.imageUrl, this.title});
  final String imageUrl, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // mettre de l'espace autour de chaque élément de la GridView
      padding: EdgeInsets.all(10.0),
      child: Stack(children: [
        //----------Image----------
        Hero( //Hero permet de jouet une animation pendant le changeemnt de page
          tag: imageUrl,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: ClipRRect(
              // Pour avoir des rebords arrondis dans le container
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
        ),
        //----------Titre----------
        Align(
          // pour positionner, en bas au centre, dans la Stack
          alignment: Alignment.bottomCenter,
          child: Container(
            // on baisse l'opacité pour avoir un effet semi-transparent
            color: Colors.black.withOpacity(0.6),
            height: 35,
            child: Center(
              child: Text(
                title, // passé en paramètre du constructeur
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
