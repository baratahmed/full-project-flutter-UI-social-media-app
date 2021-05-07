import 'package:flutter/material.dart';
import 'package:social_media_app_ui/models/user_model.dart';
import 'package:social_media_app_ui/widgets/custom_drawer.dart';
import 'package:social_media_app_ui/widgets/posts_carousel.dart';
import 'package:social_media_app_ui/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  ProfileScreen({this.user});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _yourPostsPageController;
  PageController _favoritesPageController;

  @override
  void initState() {
    super.initState();
    _yourPostsPageController = PageController(initialPage: 0, viewportFraction: 0.8);
    _favoritesPageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300,
                    width: double.infinity,
                    image: AssetImage(widget.user.backgroundImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    iconSize: 30,
                    icon: Icon(Icons.menu),
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  ),
                ),
                Positioned(
                    bottom: 10.0,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, 2),
                                blurRadius: 6.0)
                          ]),
                      child: ClipOval(
                        child: Image(
                          height: 120,
                          width: 120,
                          image: AssetImage(widget.user.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                widget.user.name,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Following', style: TextStyle(fontSize: 22, color: Colors.black54),),
                    SizedBox(height: 2,),
                    Text(widget.user.following.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  ],
                ),
                Column(
                  children: [
                    Text('Followers', style: TextStyle(fontSize: 22, color: Colors.black54),),
                    SizedBox(height: 2,),
                    Text(widget.user.followers.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  ],
                ),
              ],
            ),
            PostsCarousel(pageController: _yourPostsPageController, title: 'Your Posts', posts: widget.user.posts,),
            PostsCarousel(pageController: _favoritesPageController, title: 'Favorites', posts: widget.user.favorites,),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
