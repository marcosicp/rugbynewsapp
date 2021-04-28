import 'package:flutter/material.dart';

class EntrenamientoPage extends StatefulWidget {
  EntrenamientoPage();

  @override
  _EntrenamientoPageState createState() => _EntrenamientoPageState();
}

enum Opciones { FEM, MAS }

class _EntrenamientoPageState extends State<EntrenamientoPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      transform: Matrix4.translationValues(0.0, -25.0, 0.0),
                      child: Hero(
                        tag: 'sadsa',
                        child: ShadowClip(
                          clipper: CircularClipper(),
                          shadow: Shadow(blurRadius: 1.0),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/tala.png',
                            height: 150.0,
                            width: double.infinity,
                            fit: BoxFit.contain,
                            image: 'assets/images/tala.png',
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          padding: EdgeInsets.only(left: 30.0),
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back),
                          iconSize: 30.0,
                          color: Colors.white,
                        ),
                        Image(
                          image: AssetImage(
                              'assets/images/kierokuentoslogotipografia.png'),
                          height: 60.0,
                          width: 150.0,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'dasdadsadad',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'dadsdsadasdasds',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        'dasdadadsaas',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'Year',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                'dasdsadsadadaddadsa',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'Autor',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                'Descr Tala',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'Duration',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                'adsadadadasdadas',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 25.0),
                      // Container(
                      //   height: 4000.0,
                      //   width: 300,
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        child: Text(
                          'asdadadadsadadadadada',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        // ),
                      ),
                    ],
                  ),
                ),
                // VerticalMovieWidget(title: 'Vistas', movie: widget.movie)
              ],
            ),
          ),
        ));
  }
}

@immutable
class ShadowClip extends StatelessWidget {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  ShadowClip({
    @required this.shadow,
    @required this.clipper,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: this.clipper,
        shadow: this.shadow,
      ),
      child: ClipPath(child: child, clipper: this.clipper),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({@required this.shadow, @required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - size.width / 4,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
