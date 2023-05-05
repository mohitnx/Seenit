class Posts {
  String subredditName;
  String userName;
  int upvotes;
  double time;
  String? flair;
  String title;
  String description;
  String postUrl;
  int commentsCount;
  bool? isGallery;
  bool? isRedditVideo;
  String postHint;
  String postId;
  String? thumbnail;
  int? thumbnailWidth;
  int? thumbnailHeight;

  Map? galleryData;
  var secureMedia;

  Posts({
    required this.postUrl,
    required this.subredditName,
    required this.userName,
    required this.upvotes,
    this.thumbnail,
    required this.time,
    this.isRedditVideo,
    this.thumbnailHeight,
    this.thumbnailWidth,
    this.galleryData,
    required this.commentsCount,
    required this.postHint,
    this.flair,
    this.isGallery,
    required this.postId,
    required this.secureMedia,
    required this.title,
    required this.description,
  });
}
