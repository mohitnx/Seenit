import 'dart:convert';
import 'package:http/http.dart' as http;

Future gettingComments(String subredditName, String postId) async {
  //postId is in the form t1_abced for teh api call we only need abced so splitting the postId to postIdFinal
  String postIdFinal = postId.split("_").last;

  var json;
  var url = Uri.parse(
      'https://reddit.com/r/$subredditName/comments/$postIdFinal.json');

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
