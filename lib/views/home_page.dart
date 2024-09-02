import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/post_data.dart';
import 'package:flutter_application_1/services/remote_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;
  //We load the postData when loading the View
  @override
  void initState() {
    super.initState();
    getData();
  }
//We call the async method to get the data
  getData() async {
    posts = await RemoteServices().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Posts"),
        ),
        //We check if the data is loaded before displaying it
        body: Visibility(
          visible: isLoaded,
          //We use an indicator while the data is being loaded or its null
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
              //We display the data in Rows with padding
              return Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    //Decorative Container
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[300]),
                    ),
                    const SizedBox(width: 16),
                    //We expand the data so that it does not overflow
                    Expanded(
                      //We display the data in a column
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Title: ${posts![index].title}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Title: ${posts![index].body ?? ""}",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(),
                            ),
                          ]),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
