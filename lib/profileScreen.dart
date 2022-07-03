import 'package:assignment_project/constants.dart';
import 'package:assignment_project/main.dart';
import 'package:assignment_project/userdetail.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key, required this.myid}) : super(key: key);

  final int myid;
  @override
  Widget build(BuildContext context) {
    UserDetail userDetail = box.get(myid);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.fromLTRB(15, 150, 15, 150),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome! ${userDetail.name}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                loggedinscreen(data: 'Your Age\n\n${userDetail.age}'),
                loggedinscreen(data: 'Your Gender\n\n${userDetail.gender}'),
              ],
            ),
            myButton(
                requiredjob: (() {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MyApp();
                  }));
                }),
                typedata: 'Sign Out'),
          ],
        ),
      ),
    );
  }
}
