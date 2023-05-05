import 'package:flutter/material.dart';
import 'package:seenit/services/post_service.dart';

import '../models/posts._model.dart';

class PostsProvider extends ChangeNotifier {
  List<Posts> posts = [];
  List<Posts> searchTerms = [];

  Future<void> anynomousHomePage(subredditName, type) async {
    Map json = await gettingPosts(subredditName, type);
    for (int i = 0; i < 25; i++) {
      Posts data = Posts(
          subredditName: json['data']['children'][i]['data']['subreddit'],
          userName: json['data']['children'][i]['data']['author'],
          upvotes: json['data']['children'][i]['data']['ups'],
          time: json['data']['children'][i]['data']['created'],
          flair: json['data']['children'][i]['data']['link_flair_text'],
          title: json['data']['children'][i]['data']['title'],
          commentsCount: json['data']['children'][i]['data']['num_comments'],
          description: json['data']['children'][i]['data']['selftext'],
          isGallery: json['data']['children'][i]['data']['is_gallery'] ?? false,
          isRedditVideo: json['data']['children'][i]['data']
              ['is_reddit_media_domain'],
          postHint: json['data']['children'][i]['data']['post_hint'] ?? '',
          thumbnail: json['data']['children'][i]['data']['thumbnail'] ?? '',
          galleryData: json['data']['children'][i]['data']['gallery_data'],
          postId: json['data']['children'][i]['data']['name'],
          thumbnailWidth:
              json['data']['children'][i]['data']['thumbnail_width'] ?? 1,
          thumbnailHeight:
              json['data']['children'][i]['data']['thumbnail_height'] ?? 1,
          postUrl: json['data']['children'][i]['data']
                  ['url_overridden_by_dest'] ??
              'https://images.unsplash.com/photo-1527443195645-1133f7f28990?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bG9hZGluZyUyMHNjcmVlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
          secureMedia: json['data']['children'][i]['data']['secure_media']);

      posts.add(data);

      notifyListeners();
    }
  }

  Future<void> searchPage(String searchTerm, String subredditNamee,
      String sortType, bool isSubredditSearch) async {
    if (sortType == 'new') {
      var json = await searchingTerms(
          searchTerm, subredditNamee, 'new', isSubredditSearch);
      for (int i = 0; i < 10; i++) {
        Posts data = Posts(
            subredditName: json['data']['children'][i]['data']['subreddit'],
            userName: json['data']['children'][i]['data']['author'],
            upvotes: json['data']['children'][i]['data']['ups'],
            time: json['data']['children'][i]['data']['created'],
            flair: json['data']['children'][i]['data']['link_flair_text'],
            title: json['data']['children'][i]['data']['title'],
            commentsCount: json['data']['children'][i]['data']['num_comments'],
            description: json['data']['children'][i]['data']['selftext'],
            isGallery:
                json['data']['children'][i]['data']['is_gallery'] ?? false,
            isRedditVideo: json['data']['children'][i]['data']
                ['is_reddit_media_domain'],
            postHint: json['data']['children'][i]['data']['post_hint'] ?? '',
            thumbnail: json['data']['children'][i]['data']['thumbnail'] ?? '',
            galleryData: json['data']['children'][i]['data']['gallery_data'],
            thumbnailWidth:
                json['data']['children'][i]['data']['thumbnail_width'] ?? 1,
            postId: json['data']['children'][i]['data']['name'],
            thumbnailHeight:
                json['data']['children'][i]['data']['thumbnail_height'] ?? 1,
            postUrl: json['data']['children'][i]['data']
                    ['url_overridden_by_dest'] ??
                'https://images.unsplash.com/photo-1527443195645-1133f7f28990?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bG9hZGluZyUyMHNjcmVlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            secureMedia: json['data']['children'][i]['data']['secure_media']);

        searchTerms.add(data);
      }
    }
    if (sortType == 'relevance') {
      var json = await searchingTerms(
          searchTerm, subredditNamee, 'relevance', isSubredditSearch);
      for (int i = 0; i < 10; i++) {
        Posts data = Posts(
            subredditName: json['data']['children'][i]['data']['subreddit'],
            userName: json['data']['children'][i]['data']['author'],
            upvotes: json['data']['children'][i]['data']['ups'],
            time: json['data']['children'][i]['data']['created'],
            flair: json['data']['children'][i]['data']['link_flair_text'],
            title: json['data']['children'][i]['data']['title'],
            commentsCount: json['data']['children'][i]['data']['num_comments'],
            description: json['data']['children'][i]['data']['selftext'],
            isGallery:
                json['data']['children'][i]['data']['is_gallery'] ?? false,
            isRedditVideo: json['data']['children'][i]['data']
                ['is_reddit_media_domain'],
            postHint: json['data']['children'][i]['data']['post_hint'] ?? '',
            thumbnail: json['data']['children'][i]['data']['thumbnail'] ?? '',
            galleryData: json['data']['children'][i]['data']['gallery_data'],
            postId: json['data']['children'][i]['data']['name'],
            thumbnailWidth:
                json['data']['children'][i]['data']['thumbnail_width'] ?? 1,
            thumbnailHeight:
                json['data']['children'][i]['data']['thumbnail_height'] ?? 1,
            postUrl: json['data']['children'][i]['data']
                    ['url_overridden_by_dest'] ??
                'https://images.unsplash.com/photo-1527443195645-1133f7f28990?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bG9hZGluZyUyMHNjcmVlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            secureMedia: json['data']['children'][i]['data']['secure_media']);

        searchTerms.add(data);
      }
    }
    if (sortType == 'hot') {
      var json = await searchingTerms(
          searchTerm, subredditNamee, 'hot', isSubredditSearch);
      for (int i = 0; i < 10; i++) {
        Posts data = Posts(
            subredditName: json['data']['children'][i]['data']['subreddit'],
            userName: json['data']['children'][i]['data']['author'],
            upvotes: json['data']['children'][i]['data']['ups'],
            time: json['data']['children'][i]['data']['created'],
            flair: json['data']['children'][i]['data']['link_flair_text'],
            title: json['data']['children'][i]['data']['title'],
            commentsCount: json['data']['children'][i]['data']['num_comments'],
            description: json['data']['children'][i]['data']['selftext'],
            isGallery:
                json['data']['children'][i]['data']['is_gallery'] ?? false,
            isRedditVideo: json['data']['children'][i]['data']
                ['is_reddit_media_domain'],
            postHint: json['data']['children'][i]['data']['post_hint'] ?? '',
            thumbnail: json['data']['children'][i]['data']['thumbnail'] ?? '',
            galleryData: json['data']['children'][i]['data']['gallery_data'],
            postId: json['data']['children'][i]['data']['name'],
            thumbnailWidth:
                json['data']['children'][i]['data']['thumbnail_width'] ?? 1,
            thumbnailHeight:
                json['data']['children'][i]['data']['thumbnail_height'] ?? 1,
            postUrl: json['data']['children'][i]['data']
                    ['url_overridden_by_dest'] ??
                'https://images.unsplash.com/photo-1527443195645-1133f7f28990?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bG9hZGluZyUyMHNjcmVlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            secureMedia: json['data']['children'][i]['data']['secure_media']);

        searchTerms.add(data);
      }
    }
    if (sortType == 'top') {
      var json = await searchingTerms(
          searchTerm, subredditNamee, 'top', isSubredditSearch);
      for (int i = 0; i < 10; i++) {
        Posts data = Posts(
            subredditName: json['data']['children'][i]['data']['subreddit'],
            userName: json['data']['children'][i]['data']['author'],
            upvotes: json['data']['children'][i]['data']['ups'],
            time: json['data']['children'][i]['data']['created'],
            flair: json['data']['children'][i]['data']['link_flair_text'],
            title: json['data']['children'][i]['data']['title'],
            commentsCount: json['data']['children'][i]['data']['num_comments'],
            description: json['data']['children'][i]['data']['selftext'],
            isGallery:
                json['data']['children'][i]['data']['is_gallery'] ?? false,
            isRedditVideo: json['data']['children'][i]['data']
                ['is_reddit_media_domain'],
            postHint: json['data']['children'][i]['data']['post_hint'] ?? '',
            thumbnail: json['data']['children'][i]['data']['thumbnail'] ?? '',
            galleryData: json['data']['children'][i]['data']['gallery_data'],
            thumbnailWidth:
                json['data']['children'][i]['data']['thumbnail_width'] ?? 1,
            thumbnailHeight:
                json['data']['children'][i]['data']['thumbnail_height'] ?? 1,
            postId: json['data']['children'][i]['data']['name'],
            postUrl: json['data']['children'][i]['data']
                    ['url_overridden_by_dest'] ??
                'https://images.unsplash.com/photo-1527443195645-1133f7f28990?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bG9hZGluZyUyMHNjcmVlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            secureMedia: json['data']['children'][i]['data']['secure_media']);

        searchTerms.add(data);
      }
    }

    notifyListeners();
  }

  searchWithFilter(String searchTerm, String subredditNamee, String sortType,
      bool isSubredditSearch) async {
    searchTerms = [];
    await searchPage(searchTerm, subredditNamee, sortType, isSubredditSearch);
  }
}
