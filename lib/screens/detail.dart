import 'package:flutter/material.dart';
import 'package:week1Assignment/screens/model.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Model model = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Card(
        child: Wrap(children: [
          Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(model.post),
                  ),
                  Text(
                    model.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              _text(model.caption),
              Image.network(model.post, fit: BoxFit.cover),
            ],
          ),
        ]),
      ),
    );
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
