import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Text(
            "Você fez login como",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: Cross,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              ),
              backgroundColor: Colors.blue,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nityananda Barbosa Vieira Teixeira",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "nityananda@gmail.com",
                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 4.0, bottom: 0),
          child: Divider(
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
