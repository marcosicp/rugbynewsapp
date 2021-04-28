import 'dart:convert';
import 'package:talarugbyclub/services/services.dart';
import 'package:talarugbyclub/utils/constants.dart';

class NewsArticle {
  final String createdAt;
  final String description;
  final String profileImage;
  final String urlPostImages;
  final String urlPostVideo;
  final int favoriteCount;
  final int retweetedCount;
  final String urlToImage;
  final dynamic entities;

  NewsArticle(
      {this.createdAt,
      this.description,
      this.urlToImage,
      this.profileImage,
      this.favoriteCount,
      this.retweetedCount,
      this.urlPostImages,
      this.entities,
      this.urlPostVideo});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    try {
      String title = json['full_text'] ?? "";
      var rt = title.substring(0, 2);
      // if (rt != 'RT') {
        String created = json['created_at'] ?? "";
        String resultTitle = "";
        String resultCre = "";
        try {
          resultTitle = title.substring(0, title.indexOf('http'));
        } catch (e) {
          resultTitle = title;
          
        }

        resultCre = created.substring(0, created.indexOf(' +0'));
        String _urlVideo = '';
        String _urlImage = '';

        if (json.containsKey('extended_entities')) {
          _urlImage = json['extended_entities']['media'][0]['media_url'];

          if (json['extended_entities']['media'][0]['video_info'] != null) {
            _urlVideo = json['extended_entities']['media'][0]['video_info']
                ['variants'][2]['url'];
          }
        }

        return NewsArticle(
          createdAt: resultCre,
          description: resultTitle,
          urlPostImages: _urlImage,
          urlPostVideo: _urlVideo,
          profileImage: json['user']['profile_image_url'],
          favoriteCount: json['favorite_count'],
          retweetedCount: json['retweeted_count'],
        );
    } catch (e) {
      print('object');
    }
  }

  static Resource<List<NewsArticle>> get all {
    return Resource(
        url: Constants.HEADLINE_NEWS_URL,
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result;
          var copyList = list.toList();
          List finalList = new List<dynamic>();
          for (var i = 0; i < copyList.length; i++) {
            var title = copyList[i]['full_text'];
            var rt = title.substring(0, 2);
            if (rt != 'RT') {
              finalList.add(copyList[i]);
            }
          }

          return finalList.map((model) => NewsArticle.fromJson(model)).toList();
        });
  }
}
