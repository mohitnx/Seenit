import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../provider/posts_provider.dart';

Widget PostBody(int index) {
  //last task...put the whole task here instead of just the body...remove title and
  //description from above and put it here
  return Consumer<PostsProvider>(builder: (context, value, child) {
    if (value.posts[index].secureMedia == null &&
        value.posts[index].postHint == 'image') {
      //now check if it is gallery..if gallery do sothing..else return below code
      return InkWell(
          onTap: () async {
            await Navigator.pushNamed(context, FullScreen.routeName,
                arguments: [(value.posts[index].postUrl)]);
          },
          child: Image.network(value.posts[index].postUrl));
    }
    //for gallery
    if (value.posts[index].secureMedia == null &&
        value.posts[index].isGallery == true) {
      print(value.posts[index].galleryData!['items']);
      return Gallery(
        galleryData: value.posts[index].galleryData!['items'],
        imgFormat: value.posts[index].thumbnail.toString(),
      );
    }
    //for external links which aren't video
    //only reason why these two(external links and external video links) are different is to show slightly differnt layout for both

    if (value.posts[index].secureMedia == null &&
        value.posts[index].postHint == 'link') {
      return InkWell(
        onTap: () async {
          //we can add wheter to enable to js, open in default broser or webview, etc
          Uri url = Uri.parse(value.posts[index].postUrl);
          if (!await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          } else {
            throw 'Could not open link';
          }
        },
        child: Column(
          children: [
            Image.network(
              value.posts[index].thumbnail.toString(),
              width: value.posts[index].thumbnailWidth!.toDouble(),
              height: value.posts[index].thumbnailHeight!.toDouble(),
            ),
            Text(
              value.posts[index].title,
            ),
          ],
        ),
      );
    }
//for video links
//see if you can play youtube video in flutter app itself
    if (value.posts[index].secureMedia != null &&
        value.posts[index].isRedditVideo == false &&
        value.posts[index].postHint == "rich:video") {
      return InkWell(
        onTap: () async {
          Uri url = Uri.parse(value.posts[index].postUrl);
          if (!await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          } else {
            throw 'Could not open link';
          }
        },
        child: Column(
          children: [
            Image.network(
              value.posts[index].thumbnail.toString(),
              width: value.posts[index].thumbnailWidth!.toDouble(),
              height: value.posts[index].thumbnailHeight!.toDouble(),
            ),
            Text(
              value.posts[index].title,
            ),
          ],
        ),
      );
    }

    //for hosted video
    if (value.posts[index].secureMedia != null &&
        value.posts[index].isRedditVideo == true) {
      print(value.posts[index].secureMedia['reddit_video']['fallback_url']);
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2,
        child: VideoPlayerScreen(
          videoUrl: value.posts[index].secureMedia['reddit_video']
              ['fallback_url'],
          thumbnail: [
            value.posts[index].thumbnail.toString(),
            'https://images.unsplash.com/photo-1523821741446-edb2b68bb7a0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Ymx1cnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
          ],
          vidHeight: value.posts[index].secureMedia['reddit_video']['height'],
          vidWidth: value.posts[index].secureMedia['reddit_video']['width'],
        ),
      );
    }
    //some links that aren't caought by above if code for external links(not video)
    //this if is for those external links not covered in above if code

    return Text('sorry we dont have the feature to display this type of data');
  });
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final List thumbnail;
  final int vidWidth;
  final int vidHeight;

  VideoPlayerScreen(
      {required this.videoUrl,
      required this.thumbnail,
      required this.vidWidth,
      required this.vidHeight});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

Widget SearchPostBody(int index) {
  //last task...put the whole task here instead of just the body...remove title and
  //description from above and put it here
  return Consumer<PostsProvider>(builder: (context, value, child) {
    if (value.searchTerms[index].secureMedia == null &&
        value.searchTerms[index].postHint == 'image') {
      //now check if it is gallery..if gallery do sothing..else return below code
      return InkWell(
          onTap: () async {
            await Navigator.pushNamed(context, FullScreen.routeName,
                arguments: [(value.searchTerms[index].postUrl)]);
          },
          child: Image.network(value.searchTerms[index].postUrl));
    }
    //for gallery
    if (value.searchTerms[index].secureMedia == null &&
        value.searchTerms[index].isGallery == true) {
      print(value.searchTerms[index].galleryData!['items']);
      return Gallery(
        galleryData: value.searchTerms[index].galleryData!['items'],
        imgFormat: value.searchTerms[index].thumbnail.toString(),
      );
    }
    //for external links which aren't video
    //only reason why these two(external links and external video links) are different is to show slightly differnt layout for both

    if (value.searchTerms[index].secureMedia == null &&
        value.searchTerms[index].postHint == 'link') {
      return InkWell(
        onTap: () async {
          //we can add wheter to enable to js, open in default broser or webview, etc
          Uri url = Uri.parse(value.searchTerms[index].postUrl);
          if (!await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          } else {
            throw 'Could not open link';
          }
        },
        child: Container(
          child: Column(
            children: [
              Image.network(
                value.searchTerms[index].thumbnail.toString(),
                width: value.searchTerms[index].thumbnailWidth!.toDouble(),
                height: value.searchTerms[index].thumbnailHeight!.toDouble(),
              ),
              Text(
                value.searchTerms[index].title,
              ),
            ],
          ),
        ),
      );
    }
//for video links
//see if you can play youtube video in flutter app itself
    if (value.searchTerms[index].secureMedia != null &&
        value.searchTerms[index].isRedditVideo == false &&
        value.searchTerms[index].postHint == "rich:video") {
      return InkWell(
        onTap: () async {
          Uri url = Uri.parse(value.searchTerms[index].postUrl);
          if (!await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          } else {
            throw 'Could not open link';
          }
        },
        child: Column(
          children: [
            Image.network(
              value.searchTerms[index].thumbnail.toString(),
              width: value.searchTerms[index].thumbnailWidth!.toDouble(),
              height: value.searchTerms[index].thumbnailHeight!.toDouble(),
            ),
            Text(
              value.searchTerms[index].title,
            ),
          ],
        ),
      );
    }

    //for hosted video
    if (value.searchTerms[index].secureMedia != null &&
        value.searchTerms[index].isRedditVideo == true) {
      print(
          value.searchTerms[index].secureMedia['reddit_video']['fallback_url']);
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2,
        child: VideoPlayerScreen(
          videoUrl: value.searchTerms[index].secureMedia['reddit_video']
              ['fallback_url'],
          thumbnail: [
            value.searchTerms[index].thumbnail.toString(),
            'https://images.unsplash.com/photo-1523821741446-edb2b68bb7a0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Ymx1cnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
          ],
          vidHeight: value.searchTerms[index].secureMedia['reddit_video']
              ['height'],
          vidWidth: value.searchTerms[index].secureMedia['reddit_video']
              ['width'],
        ),
      );
    }
    //some links that aren't caought by above if code for external links(not video)
    //this if is for those external links not covered in above if code

    return Text('sorry we dont have the feature to display this type of data');
  });
}

class FullScreen extends StatelessWidget {
  static const String routeName = '/full-screen';
  final List<dynamic> imagesUrl;
  FullScreen({super.key, required this.imagesUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView.builder(
            physics: PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: imagesUrl.length,
            itemBuilder: (BuildContext context, int index) {
              return InteractiveViewer(
                panEnabled: true,
                boundaryMargin: EdgeInsets.all(10),
                minScale: 0.3,
                maxScale: 4,
                child: Image.network(
                  imagesUrl[index],
                ),
              );
            }),
      ),
    );
  }
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: widget.vidWidth.toDouble() / widget.vidHeight.toDouble(),
      autoInitialize: true,
      autoPlay: false,
      looping: false,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Chewie(
              controller: _chewieController!,
            ),
          ),
        ),
      ],
    );
  }
}

//see the use of .map and .split fucntions....easyyyy to understand
//easy to implement
//combined three different jsons to generate a link in a single fucntion
class Gallery extends StatefulWidget {
  List galleryData;
  String imgFormat;
  Gallery({
    Key? key,
    required this.galleryData,
    required this.imgFormat,
  }) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  //we have a list of map ...we iterate thorugh each item in the list(here each item is a map)  and extract the value of 'media_id' and assign
  //it to a temp varaible: temp..suppose there are 10 maps then we now have 10 strings
  //one in each pass
  //then we return a url with that 'media_id' value in each pass which acts as our network image url;

  //getting the file format:jpg,png,jpeg, etc from the thumbnail
  //the thumbnail for a gallery looks liek this: "https://a.thumbs.redditm…OjrP212UZSWtbs1kaiX0.jpg"
  //we need the last jpg part
  //so we can do string manipulation
  //using substring method will give all the strings after first (.)..which is not what we need
  //so we xan use split..split will split the string into a list of substrings based on (.)
  //and we can take teh last one in the list as it will always have the file format

  //.split creates a list of substrings...we need the last substring so we sue .last to get the last substring

  late String formatt = widget.imgFormat.split('.').last;
  late List<String> mediaId = widget.galleryData.map((e) {
    String temp = e['media_id'].toString();

    return 'https://i.redd.it/$temp.$formatt';
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.3,
      child: InkWell(
        onTap: () async {
          await Navigator.pushNamed(context, FullScreen.routeName,
              arguments: mediaId);
        },
        child: PageView.builder(
          //so that we scrll past one item in each scroll
          physics: PageScrollPhysics(),
          scrollDirection: Axis.horizontal,

          itemCount: mediaId.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: [
              Center(
                child: Image.network(
                  mediaId[index],
                  //fit: BoxFit.contain,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                    margin: EdgeInsets.all(9),
                    padding: EdgeInsets.all(5),
                    color: Colors.black.withOpacity(0.5),
                    child: Text('gallery')),
              ),
            ]);
          },
        ),
      ),
    );
  }
}

//remaining todo:
//hosted video ko dimensions
//gallery ma each swipe ma 1/9..2/9..3/9 type ko increment/decrement dekhaune chatgpt ma ans cha...pagecontroller of pageveiw use garna milcha re