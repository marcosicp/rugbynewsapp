import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:talarugbyclub/models/novedad.model.dart';
import 'package:talarugbyclub/services/services.dart';
import 'package:talarugbyclub/screens/novedades_detalle.dart';

class Novedades extends StatefulWidget {
  @override
  createState() => _Novedades();
}

class _Novedades extends State<Novedades> {
  List<Novedad> novedades = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<Novedad>> populateNovedades() async {
    await Webservice().getAll(Novedad.all).then((_novedades) => {
          // setState(() => novedades = _novedades),
          novedades = _novedades
        });
    return novedades;
  }

  Future<void> _refreshStockPrices() async {
    await Webservice().getAll(Novedad.all).then((_novedades) => {
          setState(() => novedades = _novedades),
        });
  }

  makeCardList(int index) {
    getimagenes() {
      Uint8List _img = base64Decode(novedades[index].imagen);
      return new MemoryImage(_img);
    }

    return Card(
        child: new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          child: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: novedades[index].imagen != null
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
              new Text(novedades[index].title ?? "",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              new Text(novedades[index].description ?? "",
                  maxLines: 4, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
        new InkWell(
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) =>
                          new NovedadesDetalle(novedad: novedades[index])));
            },
            child: new Container(
              padding: const EdgeInsets.all(5.0),
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text(
                    "MOSTRAR",
                    style: new TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
            ))
      ],
    ));
  }

  Widget getList() {
    return new FutureBuilder<List<Novedad>>(
      future: this.populateNovedades(), // a Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<List<Novedad>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return new Text('Press button to start');
          case ConnectionState.waiting:
            return new Center(child: new CircularProgressIndicator());
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return new Center(
                  child: new RefreshIndicator(
                child: ListView.builder(
                  itemCount: novedades.length,
                  itemBuilder: (BuildContext context, int index) {
                    return makeCardList(index);
                  },
                ),
                onRefresh: _refreshStockPrices,
              ));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: getList(),
    );
  }
}
