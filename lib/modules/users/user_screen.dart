import 'package:flutter/material.dart';

import '../../models/users/user_model.dart';


class UsersScreen extends StatelessWidget {
  List< UserModel > users=[
    UserModel(
      id: 1,
      phone: "0120480868",
      name: "MohamedEbrahim",
    ),
    UserModel(
      id: 2,
      phone: "0120480868",
      name: "AhmedEid",
    ),
    UserModel(
      id: 3,
      phone: "0120480868",
      name: "elnagoo",
    ),
    UserModel(
      id: 4,
      phone: "0120480868",
      name: "MohamedAli",
    ),
    UserModel(
      id: 5,
      phone: "0120480868",
      name: "AboSara",
    ),
    UserModel(
      id: 1,
      phone: "0120480868",
      name: "MohamedEbrahim",
    ),
    UserModel(
      id: 2,
      phone: "0120480868",
      name: "AhmedEid",
    ),
    UserModel(
      id: 3,
      phone: "0120480868",
      name: "elnagoo",
    ),
    UserModel(
      id: 4,
      phone: "0120480868",
      name: "MohamedAli",
    ),
    UserModel(
      id: 5,
      phone: "0120480868",
      name: "AboSara",
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          "Users",
        ),
      ),
      body: ListView.separated(itemBuilder: (context,index)=>biuldUserItem(users[index] ), separatorBuilder:(context,index)=>Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),  itemCount: users.length,)
    );
  }
  Widget biuldUserItem(UserModel user)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            "${user.id}",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),

        ),
        SizedBox(
          width: 15.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${user.name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),

            ),
            Text(
              "${user.phone}",
              style: TextStyle(
                color: Colors.grey,

              ),
            ),
          ],
        ),
      ],
    ),
  );
}
