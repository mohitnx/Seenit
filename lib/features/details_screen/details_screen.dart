// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:seenit/common/widgets/custom_post_body.dart';
import 'package:seenit/provider/comments_provider.dart';
import 'package:seenit/theme.dart';

import '../../provider/posts_provider.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = '/details-screen';
  final int postDetails;
  final bool isSearchResult;

  const DetailsScreen({
    required this.postDetails,
    super.key,
    required this.isSearchResult,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController searchTermController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isSearchResult == false) {
      Provider.of<CommnetsProvider>(context, listen: false).getCommentsUpdated(
          Provider.of<PostsProvider>(context, listen: false)
              .posts[widget.postDetails]
              .subredditName,
          Provider.of<PostsProvider>(context, listen: false)
              .posts[widget.postDetails]
              .postId);
    } else {
      Provider.of<CommnetsProvider>(context, listen: false).getCommentsUpdated(
          Provider.of<PostsProvider>(context, listen: false)
              .searchTerms[widget.postDetails]
              .subredditName,
          Provider.of<PostsProvider>(context, listen: false)
              .searchTerms[widget.postDetails]
              .postId);
    }
  }

  @override
  void dispose() {
    searchTermController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            'SeenIt',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Pallete.cyan),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Pallete.greyColor,
              ),
              child: TextFormField(
                controller: searchTermController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    color: Pallete.cyan,
                    onPressed: () async {
                      await Provider.of<PostsProvider>(context, listen: false)
                          .searchWithFilter(searchTermController.text, '',
                              'relevance', false);
                    },
                  ),
                ),
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
        centerTitle: true,
      ),
      body: Consumer<PostsProvider>(
        builder: (context, value, child) => Container(
          padding: EdgeInsets.all(10),
          child: widget.isSearchResult
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        value.searchTerms[widget.postDetails].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Text(value.searchTerms[widget.postDetails].description),
                      SearchPostBody(widget.postDetails),
                      CommentsBody(),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        value.posts[widget.postDetails].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Text(value.posts[widget.postDetails].description),
                      PostBody(widget.postDetails),
                      CommentsBody(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class CommentsBody extends StatefulWidget {
  const CommentsBody({super.key});

  @override
  State<CommentsBody> createState() => _CommentsBodyState();
}

class _CommentsBodyState extends State<CommentsBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CommnetsProvider>(builder: (context, value, child) {
      return ListView.separated(
        shrinkWrap: true,
        primary: false,
        separatorBuilder: (context, index) => SizedBox(
          height: 6,
        ),
        itemCount: value.comments.length,
        itemBuilder: (context, index) {
          return Container(
            color: Color.fromARGB(57, 158, 158, 158),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(value.comments[index].userName),
                    Text(value.comments[index].createdTime.toString()),
                    Text(value.comments[index].editedTime.toString()),
                  ],
                ),
                Text(value.comments[index].commentBody),
              ],
            ),
          );
        },
      );
    });
  }
}
