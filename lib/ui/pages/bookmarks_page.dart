import 'package:flutter/material.dart';
class Bookmarks extends StatelessWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bookmarks'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Favoritos',),
              Tab(text:'Downloads')
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Text('Tab 1'),
            Text('Tab 2')
          ],
        ),
      ),
    );
  }
}
