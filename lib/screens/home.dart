import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:talarugbyclub/screens/administracion.dart';
import 'package:talarugbyclub/screens/couching.dart';
import 'package:talarugbyclub/screens/entrenamiento.dart';
import 'package:talarugbyclub/screens/twitter.dart';
import 'package:talarugbyclub/screens/profile.dart';
import 'package:talarugbyclub/screens/novedades.dart';
import 'package:talarugbyclub/screens/informativo.dart';
import 'package:talarugbyclub/screens/valores_tala.dart';
import 'package:twitter/twitter.dart';

import 'comunidad_tala..dart';
import 'institucion.dart';

// import 'novedades_tala.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        leading: Builder(
            builder: (context) => Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 0.5, 0),
                  child: InkWell(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage('assets/images/tala.png'),
                        ),
                      ),
                    ),
                  ),
                )),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('#TALAENMOVIMIENTO'),
      ),
      //MainBody
      body: new TwitterView().build(context),
      drawer: Drawer(
        child: Container(
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(90.0, 40.0, 0.0, 8.0),
                  child: InkWell(
                    // onTap: () {

                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => ProfilePage().build(context)));
                    // },
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage('assets/images/tala.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Tala Rugby Club',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 16, 8),
                  child: Text(
                    '@TalaRugbyClub',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.grey,
                  height: 0.5,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: <Widget>[
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new Institucion()));
                        },
                        title: Text(
                          'Institucional',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new ComunidadTala()));
                        },
                        title: Text(
                          'Comunidad Tala',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(
                          Icons.computer,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new ValoresTala()));
                        },
                        title: Text(
                          'Valores Tala',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      new EntrenamientoPage()));
                        },
                        title: Text(
                          'Entrenamiento',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      new Couching()));
                        },
                        title: Text(
                          'Coaching y Capacitación',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(
                          FontAwesomeIcons.twitter,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new ProfilePage()));
                        },
                        title: Text(
                          'Administración',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(
                          FontAwesomeIcons.infoCircle,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new ProfilePage()));
                        },
                        title: Text(
                          'Servicios',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(
                          FontAwesomeIcons.infoCircle,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new ProfilePage()));
                        },
                        title: Text(
                          'TDMV FAN',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(
                          FontAwesomeIcons.infoCircle,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.grey,
                        height: 0.5,
                      ),
                    ]),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
