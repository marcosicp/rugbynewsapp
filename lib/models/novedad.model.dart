
import 'dart:convert';
import 'package:talarugbyclub/services/services.dart';
import 'package:talarugbyclub/utils/constants.dart';

class Novedad {
  
  final String title; 
  final String description;
  final String imagen;
  final DateTime fecha_creo;
  final int favoriteCount;
  final int retweetedCount; 
  final String urlToImage; 

  Novedad({this.title, this.description, this.urlToImage, this.fecha_creo, this.favoriteCount, this.retweetedCount, this. imagen});

  factory Novedad.fromJson(Map<String,dynamic> json) {
    return Novedad(
      title: json['titulo'], 
      description: json['descripcion'], 
      fecha_creo: DateTime.parse(json['fecha_creo']),
      imagen: json['imagen'] 
    );
  
}

  static Resource<List<Novedad>> get all {
    return Resource(
      url: Constants.API_NOVEDADES,
      parse: (response) {
        final result = json.decode(response.body); 
        Iterable list = result;
        return list.map((model) => Novedad.fromJson(model)).toList();
      }
    );

  }

  
}