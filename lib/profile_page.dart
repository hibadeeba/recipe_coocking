import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Row(
           mainAxisAlignment:MainAxisAlignment.center,
           children: [
            Text("الملف الشخصي"),
           ] 
      ),
            backgroundColor: Colors.orange,
      ),
      body: Center(
        //padding: const EdgeInsets.only(bottom:20.0),
        child: Column(
          
          children: [
            SizedBox(height: 30),

            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, size: 70, color: Colors.white),
            ),

            SizedBox(height: 20),

            Text(
              "مرحباً، $username",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 40),

            ElevatedButton(
              onPressed: () => logout(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              ),
              child: Text(
                "تسجيل الخروج",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
