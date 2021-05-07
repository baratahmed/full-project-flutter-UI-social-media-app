import 'package:flutter/material.dart';
import 'package:social_media_app_ui/data/data.dart';
import 'package:social_media_app_ui/models/user_model.dart';
class FollowingUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Text(
            'Following',
            style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0),
          ),
        ),
        Container(
          height: 80,
          //color: Colors.red,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 5),
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                User user = users[index];
                return GestureDetector(
                  onTap: (){},
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0,2),
                            blurRadius: 6.0
                        )
                      ],
                      border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 60,
                        width: 60,
                        image: AssetImage(user.profileImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
