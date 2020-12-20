import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:week1Assignment/screens/model.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List posts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: FutureBuilder(
            builder: (context, snapshot) {
              List data = json.decode(snapshot.data.toString());
              for (int i = 0; i < data.length; i++) {
                // 4. Create a new user and add to the list
                posts.add(data[i]);
                print(posts);
              }

              return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    Model model = Model(
                        name: posts[index]['name'],
                        post: posts[index]['post'],
                        caption: posts[index]['caption'],
                        img: posts[index]['post']);
                    return Card(
                        child: Column(children: [
                      Row(children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(posts[index]['post']),
                        ),
                        Text(
                          posts[index]['name'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          posts[index]['postType'],
                          style: TextStyle(color: Colors.black38),
                        ),
                      ]),
                      _text(posts[index]['caption']),
                      SizedBox(height: 10),
                      GestureDetector(
                          child: Image.network(
                            posts[index]['post'],
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, "/details",
                                arguments: model);
                          }),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.thumb_up,
                            color: Colors.blue,
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                          ),
                          Icon(
                            Icons.mood,
                            color: Colors.orange,
                          ),
                          Text(
                            '${posts[index]['react']}',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            ' ${posts[index]['Comments']} Comments',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            '. ${posts[index]['share']} Shares',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      _icons(),
                    ]));
                  });
            },
            future:
                DefaultAssetBundle.of(context).loadString('assets/posts.json'),
          ),
        ));
  }
}

Widget _text(String caption) {
  return RichText(
    text: TextSpan(
        text: caption,
        style: TextStyle(color: Colors.black54),
        children: [
          TextSpan(
            text: " lets do it!",
            style: TextStyle(color: Colors.blue),
          )
        ]),
  );
}

Widget _icons() {
  return Row(
    children: [
      Icon(
        Icons.thumb_up,
        color: Colors.grey,
      ),
      SizedBox(
        width: 3,
      ),
      Text(
        'Likes',
        style: TextStyle(color: Colors.grey),
      ),
      SizedBox(
        width: 22,
      ),
      Icon(
        Icons.comment,
        color: Colors.grey,
      ),
      SizedBox(
        width: 3,
      ),
      Text(
        'Comments',
        style: TextStyle(color: Colors.grey),
      ),
      SizedBox(
        width: 22,
      ),
      Icon(
        Icons.share,
        color: Colors.grey,
      ),
      SizedBox(
        width: 3,
      ),
      Text(
        'Share',
        style: TextStyle(color: Colors.grey),
      )
    ],
  );
}
