import 'package:flutter/material.dart';
import 'package:talarugbyclub/models/novedad.model.dart';
import 'package:talarugbyclub/services/services.dart';

class Couching extends StatefulWidget{

  @override
  _Couching createState() => _Couching();
}

class _Couching extends State<Couching>{
  List<Novedad> novedades = List<Novedad>(); 
  
  @override
  void initState() {
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    makeCardList() {
      Webservice().getAll(Novedad.all).then((_novedades) => {
        novedades = _novedades
      });

      return Card(
        child:
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              child: new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage("assests/images/image1.jpeg"),
                      fit: BoxFit.cover
                  ),

                ),
              ),
              height: 180.0,
            ),
            new Container(
              padding: const EdgeInsets.all(15.0),
              child:  new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("Number 10"),
                  new Text("Whitehaven Beach"),
                  new Text("Whitsunday Island,Whitsunday Island"),
                ],
              ),
            ),
            new Container(
              padding: const EdgeInsets.all(5.0),
              child:new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text("SHARE", style:
                  new TextStyle(
                      color:Colors.blue,
                      fontWeight: FontWeight.bold
                  ),),
                  new Text("EXPLORE", style:
                  new TextStyle(
                      color:Colors.blue,
                      fontWeight: FontWeight.bold
                  ),)
                ],

              ),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
            )
          ],
        )

    );
    }

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return makeCardList();
        },
      ),
    );


    return new Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: makeBody,
      appBar: new AppBar(title: new Text('Novedades')),
    );
  }

  static List<Widget> getCards(int count){
    return new List<Widget>.generate(count,
            (int index) => new Container(
          child: new Couching(),
        )
    );
  }
}

class ImageCard extends StatelessWidget{
  final List<Widget> cards = _Couching.getCards(20);

  @override
  Widget build(BuildContext context) {
    return
      new Container(
          padding: const EdgeInsets.all(12.0),
          decoration: new BoxDecoration(
              color: Colors.grey[100]
          ),
          child:new ListView(
            children: cards,
          ),
      );
  }
}

class ImageCardListApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
          appBar: new AppBar(
            title: new Text("Image Card List App"),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: new Container(
            child:  new ImageCard(),
          )
      );
  }
}