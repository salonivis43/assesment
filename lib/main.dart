// lib/main.dart
import 'package:flutter/material.dart';
import 'package:my_pro/screens/splash.dart';
import 'package:my_pro/service/api_service.dart';
import 'package:my_pro/widget/user_profile.dart';
  // Import SplashScreen

import 'models/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Stories',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  SplashScreen(),  // Start with SplashScreen
    );
  }
}

// Keeping the UserStoriesPage and other code as is
class UserStoriesPage extends StatefulWidget {
  const UserStoriesPage({Key? key}) : super(key: key);

  @override
  _UserStoriesPageState createState() => _UserStoriesPageState();
}

class _UserStoriesPageState extends State<UserStoriesPage> {
  final ApiService apiService = ApiService();
  late Future<List<UserModel>> users;

  @override
  void initState() {
    super.initState();
    users = apiService.fetchUsers();  // Fetch users when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Stories'),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found.'));
          }

          // Data has been fetched successfully
          return ListView(
            children: snapshot.data!.map<Widget>((user) => UserProfile(user: user)).toList(),
          );
        },
      ),
    );
  }
}
