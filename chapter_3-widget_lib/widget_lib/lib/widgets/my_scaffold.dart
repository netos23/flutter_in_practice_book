import 'package:flutter/material.dart';

const secretText = TextStyle(fontWeight: FontWeight.bold, fontSize: 30);

class MyScaffold extends StatelessWidget {
  const MyScaffold({Key? key}) : super(key: key);

  final List<Widget> _drawerContent = const [
    DrawerHeader(
      child: ListTile(
        leading: CircleAvatar(child: Icon(Icons.now_wallpaper)),
        title: Text('Menta'),
      ),
      padding: EdgeInsets.all(5),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.amber,
      drawer: _buildDrawer(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Center _buildBody() {
    return Center(
      child: _buildCard(),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView.builder(
          itemCount: _drawerContent.length,
          itemBuilder: (context, index) => _drawerContent[index]),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Songs'),
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.chat_bubble_outline,
        color: Colors.amberAccent,
      ),
      backgroundColor: Colors.black,
      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Partigiano non dice addio')),
      ),
    );
  }

  Card _buildCard() {
    return Card(
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _buildColumn(),
      ),
    );
  }

  Column _buildColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Bella, chao!',
          style: secretText,
        ),
        Text(
          'Bella, chao!',
          style: secretText,
        ),
        Text(
          'Bella, chao, chao, chao!',
          style: secretText,
        ),
      ],
    );
  }
}
