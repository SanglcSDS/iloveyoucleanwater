import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iloveyoucleanwater/views/learning/learning_view.dart';

class Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoState();
  }
}

class DemoState extends State<Demo> {
  Future<List<ListData>> listDataJSON() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List listData = json.decode(response.body);
      return listData
          .map((listData) => new ListData.fromJson(listData))
          .toList();
    } else {
      throw Exception('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pull To Refresh'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (a, b, c) => LearningView(),
              transitionDuration: Duration(seconds: 0),
            ),
          );
          return Future.value(null);
        },
        child: FutureBuilder<List<ListData>>(
          future: listDataJSON(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemBuilder: (BuildContext context, int currentIndex) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    snapshot.data![currentIndex].thumbnailUrl),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 10.0),
                                width: 280.0,
                                child: Text(
                                  snapshot.data![currentIndex].title,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}

class ListData {
  final int albumId;
  final int id;

  final String title;
  final String url;
  final String thumbnailUrl;

  ListData(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});
  factory ListData.fromJson(Map<String, dynamic> jsonData) {
    return ListData(
      albumId: jsonData['albumId'] ?? '',
      id: jsonData['id'] ?? '',
      title: jsonData['title'] ?? '',
      url: jsonData['url'] ?? '',
      thumbnailUrl: jsonData['thumbnailUrl'] ?? '',
    );
  }
}
