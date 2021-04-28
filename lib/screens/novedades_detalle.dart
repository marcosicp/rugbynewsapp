import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:talarugbyclub/models/novedad.model.dart';

class NovedadesDetalle extends StatelessWidget {
  final Novedad novedad;

  NovedadesDetalle({this.novedad});

  getimagenes() {
    Uint8List _img = base64Decode(novedad.imagen);
    return new MemoryImage(_img);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Card(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: novedad.imagen != null
                        ? getimagenes()
                        : new AssetImage("assets/images/image1.jpeg"),
                    fit: BoxFit.cover),
              ),
            ),
            height: 180.0,
          ),
          new Container(
            padding: const EdgeInsets.all(15.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(novedad.title),
                new Text(novedad.description),
              ],
            ),
          ),
        ],
      )),
      appBar: new AppBar(centerTitle: true, title: new Text('Información')),
    );
  }
}
