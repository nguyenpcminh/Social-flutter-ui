import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/widgets/custom_clipper_profile.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/post_carousel.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  PageController _yourPostController = PageController();
  PageController _yourFavoriteController = PageController();
  @override
  void initState() {
    super.initState();
    _yourPostController = PageController(initialPage: 0, viewportFraction: 0.8);
    _yourFavoriteController = PageController(initialPage: 0,viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, data, child) {
        return Scaffold(
          key: _globalKey,
          drawer: CustomDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    ClipPath(
                      clipper: CustomClipperProfile(),
                      child: Image(
                        image: AssetImage(data.currentUser.backgroundImageUrl),
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: IconButton(
                        icon: Icon(Icons.menu),
                        color: Theme.of(context).primaryColor,
                        iconSize: 28,
                        onPressed: () => _globalKey.currentState.openDrawer(),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Container(
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ]),
                        child: ClipOval(
                          child: Image(
                            width: 100,
                            height: 100,
                            image: AssetImage(data.currentUser.profileImageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Following',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          data.currentUser.following.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Follower',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          data.currentUser.followers.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                PostCarousel(
                  pageController: _yourPostController,
                  posts: data.currentUser.posts,
                  title: 'Post',
                ),
                PostCarousel(
                  pageController: _yourFavoriteController,
                  posts: data.currentUser.favorites,
                  title: 'Favorites',
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
