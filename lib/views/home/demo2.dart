import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iloveyoucleanwater/views/home/slide/test/test1.dart';
import 'package:iloveyoucleanwater/views/home/slide/test/test2.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 1;

  late int totalPages;

  List<Passenger> passengers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> getPassengerData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }

    final Uri uri = Uri.parse(
        "https://api.instantwebtools.net/v1/passenger?page=$currentPage&size=10");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = passengersDataFromJson(response.body);

      if (isRefresh) {
        passengers = result.data;
      } else {
        passengers.addAll(result.data);
      }

      currentPage++;

      totalPages = result.totalPages;

      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinite List Pagination"),
      ),
      body: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        onRefresh: () async {
          final result = await getPassengerData(isRefresh: true);
          if (result) {
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
          }
        },
        onLoading: () async {
          final result = await getPassengerData();
          if (result) {
            refreshController.loadComplete();
          } else {
            refreshController.loadFailed();
          }
        },
        child: ListView.separated(
          itemBuilder: (context, index) {
            final passenger = passengers[index];

            return ListTile(
              title: Text(passenger.name),
              subtitle: Text(passenger.name),
              trailing: Text(
                passenger.name,
                style: TextStyle(color: Colors.green),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: passengers.length,
        ),
      ),
    );
  }
}
