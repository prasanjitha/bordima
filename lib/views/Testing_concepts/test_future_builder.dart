import 'dart:convert';
import 'dart:developer';

import 'package:bordima/themes/custom_colors.dart';
import 'package:bordima/views/Testing_concepts/PostModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestFutureBuilder extends StatefulWidget {
  const TestFutureBuilder({Key? key}) : super(key: key);

  @override
  State<TestFutureBuilder> createState() => _TestFutureBuilderState();
}

class _TestFutureBuilderState extends State<TestFutureBuilder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPost();
  }

  Future<List<PostModel>> getPost() async {
    List<PostModel> posts = [];
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      late http.Response response;
      response = await http.get(url);
      if (response.statusCode == 200) {
        List postData = jsonDecode(response.body);
        for (var item in postData) {
          PostModel post = PostModel(
              body: item['body'], postId: item['id'], title: item['title']);
          posts.add(post);
        }
      }
    } catch (e) {
      return Future.error(e.toString());
    }
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.PRIMARY,
        title: const Text('Future Builder'),
      ),
      body: FutureBuilder(
        future: getPost(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snapshot.data[index].title),
                    const Divider(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
