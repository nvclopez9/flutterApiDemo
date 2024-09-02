import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/post_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Posts"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(child: Text("Im an Item in a List"),);
          },
        ));
  }
}
