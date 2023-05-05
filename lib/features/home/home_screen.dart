import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seenit/features/details_screen/details_screen.dart';
import 'package:seenit/features/search/search_screen.dart';

import 'package:seenit/models/posts._model.dart';
import 'package:seenit/provider/posts_provider.dart';

import '../../common/widgets/custom_post_body.dart';
import '../../theme.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchTermController = TextEditingController();
  List<Posts> posts = [];

//withouth disposing controller, when we return from search screen to this screen and enter a new term and go
//back to search screen..there won't be any update as controller will have been the same
  @override
  void dispose() {
    searchTermController.dispose(); // Dispose the TextEditingController
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<PostsProvider>(context, listen: false)
        .anynomousHomePage('test', 'type');

    print('test----------------------------------------');
  }

  @override
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
                  hintText: 'Search',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    color: Pallete.cyan,
                    onPressed: () async {
                      await Navigator.pushNamed(context, SearchScreen.routeName,
                          arguments: searchTermController.text);
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
          child: ListView.separated(
            separatorBuilder: (context, index) => Container(
              height: 10,
            ),
            itemCount: value.posts.length,
            itemBuilder: (context, index) => Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(value.posts[index].upvotes.toString()),
                      Text(' '),
                      Text(value.posts[index].subredditName),
                      Text(' '),
                      Text(value.posts[index].userName),
                      Text(' '),
                      Text(value.posts[index].upvotes.toString())
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            await Navigator.pushNamed(
                                context, DetailsScreen.routeName,
                                arguments: [index, false]);
                          },
                          child: Text(
                            value.posts[index].title,
                            maxLines: 3,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await Navigator.pushNamed(
                                context, DetailsScreen.routeName,
                                arguments: [index, false]);
                          },
                          child: Text(
                            value.posts[index].description,
                            maxLines: 5,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        PostBody(index),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await Navigator.pushNamed(
                          context, DetailsScreen.routeName,
                          arguments: [index, false]);
                    },
                    child: Text(
                        '${value.posts[index].commentsCount.toString()} comments'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
