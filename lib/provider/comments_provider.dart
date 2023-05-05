import 'package:flutter/material.dart';
import 'package:seenit/models/comments_model.dart';

import '../services/comments_service.dart';

class CommnetsProvider extends ChangeNotifier {
  List<CommentsModel> comments = [];
  String a = 's';

  Future getComments(String subreddit, String id) async {
    var json = await gettingComments(subreddit, id);
    var temp = json[1]['data']['children'];
    int i = temp.length;
    for (int j = 0; j < i; j++) {
      CommentsModel data = CommentsModel(
        userName: json[1]['data']['children'][j]['data']['author'],
        commentBody: json[1]['data']['children'][j]['data']['body'],
        totalCommentCount: i,
        upvotes: json[1]['data']['children'][j]['data']['ups'],
        createdTime: json[1]['data']['children'][j]['data']['created_utc'],
        //edited time can either have the edited time or if it has not been edieted, false is retured from json call itself
        editedTime: (json[1]['data']['children'][j]['data']['ups'] == false)
            ? 123
            : json[1]['data']['children'][j]['data']['ups'],
      );

      comments.add(data);
      notifyListeners();
    }
  }

  getCommentsUpdated(String subreddit, String id) async {
    comments = [];
    await getComments(subreddit, id);
  }
}
