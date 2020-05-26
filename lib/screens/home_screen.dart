import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/widgets/following.dart';
import 'package:flutter_social_ui/widgets/post_carousel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0,viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, data, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'FRENZY',
              style: TextStyle(
                fontSize: 36,
                color: Theme.of(context).primaryColor,
                letterSpacing: 6,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              labelColor: Theme.of(context).primaryColor,
              labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 16,
              ),
              indicatorWeight: 3.0,
              tabs: <Widget>[
                Tab(
                  text: 'Trending',
                ),
                Tab(
                  text: 'Latest',
                ),
              ],
            ),
          ),
          body: ListView(
            children: <Widget>[
              Following(),
              PostCarousel(
                pageController: _pageController,
                title: 'Post',
                posts: data.posts,
              ),
               PostCarousel(
                pageController: _pageController,
                title: 'Favorites',
                posts: data.posts,
              ),
            ],
          ),
        );
      },
    );
  }
}
