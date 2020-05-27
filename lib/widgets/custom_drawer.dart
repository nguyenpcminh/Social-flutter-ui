import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/screens/home_screen.dart';
import 'package:flutter_social_ui/screens/login_screen.dart';
import 'package:flutter_social_ui/screens/profile_screen.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerItem(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image(
                  image: AssetImage(Provider.of<Data>(context)
                      .currentUser
                      .backgroundImageUrl),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 10,
                  bottom: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 3.0,
                                color: Theme.of(context).primaryColor)),
                        child: ClipOval(
                          child: Image(
                            image: AssetImage(Provider.of<Data>(context)
                                .currentUser
                                .profileImageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        Provider.of<Data>(context).currentUser.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            _buildDrawerItem(
              Icon(Icons.dashboard),
              'Home',
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => HomeScreen(),
                ),
              ),
            ),
            _buildDrawerItem(Icon(Icons.chat), 'Chat', () {}),
            _buildDrawerItem(Icon(Icons.location_on), 'Map', () {}),
            _buildDrawerItem(
              Icon(Icons.account_circle),
              'Your Profile',
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => ProfileScreen(),
                ),
              ),
            ),
            _buildDrawerItem(Icon(Icons.settings), 'Settings', () {}),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomLeft,
                child: _buildDrawerItem(
                  Icon(Icons.directions_run),
                  'Log Out',
                  () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
