
import 'dart:convert';
import 'package:talarugbyclub/services/services.dart';
import 'package:talarugbyclub/utils/constants.dart';

class Config {
  
  // final String title; 
  // final String description;
  // final String imagen;
  // final DateTime fecha_creo;
  // final int favoriteCount;
  // final int retweetedCount; 
  // final String urlToImage; 

 final String telefonoPagos;
  final String titleHome;
  final String telefonoMarketing;
  final String telefonoNutricion;
  final String telefonoTesoreria;
  final String telefonoInfantiles;

  Config({this.telefonoPagos, this.titleHome, this.telefonoMarketing, this.telefonoNutricion, this.telefonoTesoreria, this.telefonoInfantiles });

  factory Config.fromJson(Map<String,dynamic> json) {
    return Config(
      titleHome: json['titleHome'], 
      telefonoPagos: json['telefonoPagos'], 
      telefonoMarketing: json['telefonoMarketing'],
      telefonoNutricion: json['telefonoNutricion'],
      telefonoTesoreria: json['telefonoTesoreria'],
      telefonoInfantiles: json['telefonoInfantiles'],
    );
  
}

factory Config.fromDatabase(String key, Map<dynamic, dynamic> data) {
     try {
       return Config(
        telefonoPagos: data['telefonoPagos'] ?? "",
        titleHome: data['titleHome'] ?? "",
        telefonoMarketing: data['telefonoMarketing'] ?? "",
        telefonoNutricion: data['telefonoNutricion'] ?? "",
        telefonoTesoreria: data['telefonoTesoreria'] ?? "",
        telefonoInfantiles: data['telefonoInfantiles'] ?? ""
        );
     } catch (e) {
       print(e);
     }
  }

  // static Resource<List<Novedad>> get all {
  //   return Resource(
  //     url: Constants.API_NOVEDADES,
  //     parse: (response) {
  //       final result = json.decode(response.body); 
  //       Iterable list = result;
  //       return list.map((model) => Novedad.fromJson(model)).toList();
  //     }
  //   );

  // }

  
}