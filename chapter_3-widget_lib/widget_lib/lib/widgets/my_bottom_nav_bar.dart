import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentPage = 0;

  final List<CharacterLogo> _pages = const [
    CharacterLogo(
      name: 'Tokyo',
      imgUrl: 'https://fanfics.me/images/fandoms_heroes/1663-1592817872.jpg',
    ),
    CharacterLogo(
      name: 'Nairobi',
      imgUrl: 'https://fanfics.me/images/fandoms_heroes/1663-1592817876.jpg',
    ),
    CharacterLogo(
      name: 'Berlin',
      imgUrl: 'https://fanfics.me/images/fandoms_heroes/1663-1592817875.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(child: _pages[_currentPage]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city_rounded),
            label: _pages[0].name,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.crop_original_rounded),
            label: _pages[1].name,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_rounded),
            label: _pages[2].name,
          ),
        ],
        onTap: _changePage,
      ),
    );
  }

  void _changePage(index) {
    setState(() {
      _currentPage = index;
    });
  }
}

const headlineStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30,
  fontStyle: FontStyle.italic,
);

class CharacterLogo extends StatelessWidget {
  const CharacterLogo({
    Key? key,
    required this.name,
    required this.imgUrl,
  }) : super(key: key);

  final String name;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Card(
        elevation: 15,
        child: Column(
          children: [
            ClipRRect(child: Image.network(imgUrl)),
            Text(name, style: headlineStyle),
          ],
        ),
      ),
    );
  }
}
