import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key? key}) : super(key: key);

  final int _tabsCount = 5;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabsCount,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildTabBarView(),
      ),
    );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
      children: [
        SeasonInfo(
            imgSrc: 'https://static.wikia.nocookie.net/'
                'bumazhniidom/images/6/63/Wp5954433.jpg/revision/'
                'latest?cb=20210616185537&path-prefix=ru'),
        SeasonInfo(
            imgSrc: 'https://images.kinorium.com/movie'
                '/poster/1623199/w1500_47477961.jpg'),
        SeasonInfo(
            imgSrc: 'https://images.kinorium.com/movie'
                '/poster/1623199/w1500_47489921.jpg'),
        SeasonInfo(
            imgSrc: 'https://s14.stc.all.kpcdn.net/'
                'putevoditel/serialy/wp-content/'
                'uploads/2020/04/MyCollages-2-5-467x697.jpg'),
        SeasonInfo(
            imgSrc: 'https://images.kinorium.com/movie'
                '/poster/1623199/w1500_49928370.jpg'),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      bottom: _buildTabBar(),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      tabs: [
        Tab(text: '1'),
        Tab(text: '2'),
        Tab(text: '3'),
        Tab(text: '4'),
        Tab(text: '5'),
      ],
    );
  }
}

class SeasonInfo extends StatelessWidget {
  final String imgSrc;

  const SeasonInfo({Key? key, required this.imgSrc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        imgSrc,
        fit: BoxFit.cover,
      ),
    );
  }
}
