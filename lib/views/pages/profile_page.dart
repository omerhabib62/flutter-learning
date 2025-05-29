import 'package:flutter/material.dart';
import 'package:flutter_app/data/notifiers.dart';
import 'package:flutter_app/views/pages/welcome_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListTile(
        title: Text('Logout'),
        onTap: () {
          selectedPageNotifier.value = 0; // Reset to the first page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return WelcomePage();
              },
            ),
          );
        },
      ),
    );
  }
}
