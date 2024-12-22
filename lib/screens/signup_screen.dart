import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../helpers/encryption_helper.dart';
import '../models/profile_model.dart';
import '../widgets/bottom_navigation_bar.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final encryptedPassword = EncryptionHelper.encryptPassword(
                  passwordController.text,
                  usernameController.text,
                );
                final profile = Profile(
                  username: usernameController.text,
                  fullName: fullNameController.text,
                  password: encryptedPassword,
                );

                // Save profile to database
                await DBHelper().insertProfile(profile.toMap());

                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Signup successful!')),
                );

                // Navigate to BottomNavigationBar directly after signup
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomBottomNavigationBar(
                      username: usernameController.text,
                    ),
                  ),
                );
              },
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
