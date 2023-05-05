class CommentsModel {
  String userName;
  String commentBody;
  int totalCommentCount;
  int upvotes;
  double createdTime;
  int editedTime;
  CommentsModel({
    required this.userName,
    required this.commentBody,
    required this.totalCommentCount,
    required this.upvotes,
    required this.createdTime,
    required this.editedTime,
  });
}
