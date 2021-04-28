import 'dart:async';

import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:talarugbyclub/models/tweet.model.dart';
import 'package:talarugbyclub/services/services.dart';

class TwitterView extends State<NewsList> {
  List<NewsArticle> _newsArticles = List<NewsArticle>();
  List<FijkPlayer> playerList = List<FijkPlayer>();

  @override
  void initState() {
    super.initState();
  }

  Future<String> _populateNewsArticles() async {
    FijkPlayer player1;
    await Webservice().loadTwitter(NewsArticle.all).then((newsArticles) => {
          for (var i = 0; i < newsArticles.length; i++)
            {
              player1 = FijkPlayer(),
              if (newsArticles[i] != null)
                {
                  player1.setDataSource(newsArticles[i].urlPostVideo,
                      autoPlay: false),
                  playerList.add(player1),
                }
            },
          _newsArticles = newsArticles,
        });
  }

  Widget getList() {
    return new FutureBuilder<String>(
      future: this._populateNewsArticles(), // a Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return new Text('Press button to start');
          case ConnectionState.waiting:
            return new Center(child: new CircularProgressIndicator());
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return new ListView.builder(
                itemCount: _newsArticles.length,
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 90.0, top: 5.0),
                                          child: _newsArticles[index]
                                                      .createdAt !=
                                                  null
                                              ? Text(
                                                  _newsArticles[index]
                                                      .createdAt,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                )
                                              : Text(""),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, bottom: 8.0),
                                  child: Text(
                                    _newsArticles[index].description ?? "",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0, bottom: 8.0),
                                    child: _newsArticles[index].urlPostImages !=
                                                null &&
                                            _newsArticles[index].urlPostVideo ==
                                                ""
                                        ? Image.network(
                                            _newsArticles[index].urlPostImages,
                                            height: 190,
                                            fit: BoxFit.cover,
                                          )
                                        : null),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0, bottom: 8.0),
                                    child:
                                        _newsArticles[index].urlPostVideo != ""
                                            ? Container(
                                                alignment: Alignment.center,
                                                height: 190,
                                                child: FijkView(
                                                  player: playerList[index],
                                                  fit: FijkFit.cover,
                                                  color: Colors.black,
                                                ),
                                              )
                                            : null),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        width: double.infinity,
                        color: Color.fromRGBO(252, 213, 21, 1),
                        height: 0.5,
                      ),
                    )
                  ],
                ),
              );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: getList(),
      // appBar: new AppBar(title: new Text('TWITTER'), centerTitle: true,),
    );
  }
}

class NewsList extends StatefulWidget {
  @override
  createState() => TwitterView();
}
