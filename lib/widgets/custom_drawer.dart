import 'package:flutter/material.dart';
import 'package:social_media_app_ui/data/data.dart';
import 'package:social_media_app_ui/screens/home_screen.dart';
import 'package:social_media_app_ui/screens/login_screen.dart';
import 'package:social_media_app_ui/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 19.0),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl),
                fit: BoxFit.cover,
              ),
              Positioned(
                  left: 15,
                  bottom: 15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3.0,
                              color: Theme.of(context).primaryColor),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            currentUser.profileImageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        currentUser.name,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.5),
                      ),
                    ],
                  ))
            ],
          ),
          _buildDrawerOption(
            Icon(Icons.dashboard),
            'Home',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(Icon(Icons.chat), 'Chat', () {}),
          _buildDrawerOption(Icon(Icons.location_on), 'Map', () {}),
          _buildDrawerOption(Icon(Icons.account_circle), 'Your Profile', () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => ProfileScreen(user: currentUser),
            ),
          ),),
          _buildDrawerOption(Icon(Icons.settings), 'Settings', () {}),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                Icon(Icons.directions_run),
                'Logout',
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
