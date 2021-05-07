import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app_ui/data/data.dart';
import 'package:social_media_app_ui/widgets/custom_drawer.dart';
import 'package:social_media_app_ui/widgets/following_users.dart';
import 'package:social_media_app_ui/widgets/posts_carousel.dart';

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
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          'SocialMCD',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 10.0,
          ),
        ),
        bottom: TabBar(
          labelPadding: EdgeInsets.only(bottom: 6.0),
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontSize: 16.0),
          tabs: [
            Text('Trending'),
            Text('Latest'),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          FollowingUsers(),
          PostsCarousel(pageController: _pageController, title: "Posts", posts: posts),
        ],
      ),
    );
  }
}
