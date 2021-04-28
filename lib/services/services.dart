
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:talarugbyclub/models/config.model.dart';
import 'package:twitter/twitter.dart';

class Resource<T> {
  final String url; 
  T Function(Response response) parse;

  Resource({this.url,this.parse});
}

class Webservice {
  main () async {
    
  }
  
  Future<T> loadTwitter<T>(Resource<T> resource) async {

      Twitter twitter= new Twitter('IkM7lyUZHQCWMuqYoggYLeoEu', '1ciONgfv0MtlhQAOex2DwxAgqyVMDNZZakn6iW6U9Aw1jZXp8l',
                        '708485173-MsmtoLHJXdSFbcZJNbO14nSg5XWLif1iDbj5o3X7', 'fzOawTjcHFpNw3FZ8TmA35bB1QafSlHl64q3Nmz4DHakW');
      var response2 = await twitter.request("GET", "statuses/user_timeline.json?screen_name=TalaRugbyClub");
      print(response2.body);
      
      final response = await twitter.request("GET", "statuses/user_timeline.json?screen_name=TalaRugbyClub&include_entities=true&tweet_mode=extended");
      twitter.close();
      if(response.statusCode == 200) {
        
        return resource.parse(response);
      } else {
        throw Exception('Failed to load data!');
      }
      
  }

  Future<T> getAll<T>(Resource<T> resource) async {
      final response = await http.get(
          Uri.encodeFull('http://talarugbyclub.herokuapp.com/api/UltimasNovedades'),
          headers: {"Accept": "application/json"}
          );
      if(response.statusCode == 200) {
        
        return resource.parse(response);
      } else {
        throw Exception('Failed to load data!');
      }
      
  }


  

}