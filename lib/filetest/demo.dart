import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: controller,
            tabs: <Widget>[
              Tab(text: "1"),
              Tab(text: "2"),
              Tab(text: "3"),
              Tab(text: "4"),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            SubPage(),
            SubPage(),
            SubPage(),
            SubPage(),
          ],
        ),
      ),
      length: 4,
    );
  }
}

class SubPage extends StatefulWidget {
  @override
  _SubPageState createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListViewWidget();
  }

  @override
  bool get wantKeepAlive => true;
}

class ListViewWidget extends StatefulWidget {
  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: 50,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return ListTile(
      title: Text(index.toString()),
    );
  }
}
