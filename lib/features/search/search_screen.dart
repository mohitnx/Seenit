import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:seenit/theme.dart';

import '../../common/widgets/custom_post_body.dart';
import '../../provider/posts_provider.dart';
import '../details_screen/details_screen.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchTerm;
  SearchScreen({super.key, required this.searchTerm});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedTopType = 'all';
  List<String> topType = [
    'all',
    'day',
    'week',
    'month',
    'year',
  ];
  TextEditingController searchTermController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PostsProvider>(context, listen: false)
        .searchWithFilter(widget.searchTerm, '', 'relevance', false);
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
                  hintText: widget.searchTerm,
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
      body: Container(
        width: double.infinity,
        height: 600,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text('Posts'),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text('Comments'),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text('Communities'),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text('People'),
                  onPressed: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextButton(
                      child: Text('Relevance'),
                      onPressed: () async {
                        if (searchTermController.text.isNotEmpty) {
                          await Provider.of<PostsProvider>(context,
                                  listen: false)
                              .searchWithFilter(searchTermController.text, '',
                                  'relevance', false);
                        } else {
                          await Provider.of<PostsProvider>(context,
                                  listen: false)
                              .searchWithFilter(
                                  widget.searchTerm, '', 'relevance', false);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      child: Text('new'),
                      onPressed: () async {
                        if (searchTermController.text.isNotEmpty) {
                          await Provider.of<PostsProvider>(context,
                                  listen: false)
                              .searchWithFilter(
                                  searchTermController.text, '', 'new', false);
                        } else {
                          await Provider.of<PostsProvider>(context,
                                  listen: false)
                              .searchWithFilter(
                                  widget.searchTerm, '', 'new', false);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      child: Text('hot'),
                      onPressed: () async {
                        if (searchTermController.text.isNotEmpty) {
                          await Provider.of<PostsProvider>(context,
                                  listen: false)
                              .searchWithFilter(
                                  searchTermController.text, '', 'hot', false);
                        } else {
                          await Provider.of<PostsProvider>(context,
                                  listen: false)
                              .searchWithFilter(
                                  widget.searchTerm, '', 'hot', false);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      child: Text('top'),
                      onPressed: () async {
                        if (searchTermController.text.isNotEmpty) {
                          await Provider.of<PostsProvider>(context,
                                  listen: false)
                              .searchWithFilter(
                                  searchTermController.text, '', 'top', false);
                        } else {
                          await Provider.of<PostsProvider>(context,
                                  listen: false)
                              .searchWithFilter(
                                  widget.searchTerm, '', 'top', false);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(5),
                      isExpanded: true,
                      focusColor: Colors.cyan,
                      disabledHint: Text('Time'),
                      value: selectedTopType,
                      items: topType
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Text(
                                    e,
                                    style: TextStyle(color: Colors.blue),
                                  )),
                            ),
                          )
                          .toList(),
                      onChanged: ((value) => setState(
                            () {
                              selectedTopType = value!;
                            },
                          )),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 30,
                      underline: SizedBox(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 400,
              height: 504,
              child: Consumer<PostsProvider>(
                builder: (context, value, child) => Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Container(
                      height: 10,
                    ),
                    itemCount: value.searchTerms.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Row(
                          children: [
                            Text(value.searchTerms[index].upvotes.toString()),
                            Text(' '),
                            Text(value.searchTerms[index].subredditName),
                            Text(' '),
                            Text(value.searchTerms[index].userName),
                            Text(' '),
                            Text(value.searchTerms[index].upvotes.toString())
                          ],
                        ),
                        Container(
                            child: Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                await Navigator.pushNamed(
                                    context, DetailsScreen.routeName,
                                    arguments: [index, true]);
                              },
                              child: Text(
                                value.searchTerms[index].title,
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
                                    arguments: [index, true]);
                              },
                              child: Text(
                                value.searchTerms[index].description,
                                maxLines: 5,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            SearchPostBody(index),
                          ],
                        )),
                        InkWell(
                          onTap: () async {
                            await Navigator.pushNamed(
                                context, DetailsScreen.routeName,
                                arguments: [index, true]);
                          },
                          child: Text(
                              '${value.searchTerms[index].commentsCount.toString()} comments'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
