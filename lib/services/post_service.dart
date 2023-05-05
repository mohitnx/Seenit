import 'dart:convert';
import 'package:http/http.dart' as http;

Future gettingPosts(String subredditName, String type) async {
  var json;
  var url = Uri.parse('https://reddit.com/r/popular.json');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    json = jsonDecode(response.body);

    print(json);
  } else if (response.statusCode == 404) {
    throw Exception('Not Found');
  } else {
    throw Exception('error');
  }
  return json;
}

Future searchingTerms(
  String searchTerm,
  String subredditName,
  String sortType,
  bool isSubredditSearch,
  // String postType
) async {
  var json;

  if (isSubredditSearch) {
    final queryParameters = {
      'q': searchTerm,
      'sort': sortType,
      'limit': '10',
      'restrict_sr': 'true',
      // 'type': 'user',
    };
    print('this is a subreddit search');
    var uri = Uri.parse('https://www.reddit.com/r/$subredditName/search.json')
        .replace(queryParameters: queryParameters);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      json = jsonDecode(response.body);
      print(json);
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('error');
    }
    return json;
  }

  if (!isSubredditSearch) {
    final queryParameters = {
      'q': searchTerm,
      'sort': sortType,
      'limit': '10',
    };
    print('this is a general search');
    var uri = Uri.parse('https://www.reddit.com/search.json')
        .replace(queryParameters: queryParameters);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      json = jsonDecode(response.body);
      print(json);
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('error');
    }
    return json;
  }
}
