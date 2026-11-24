
import 'package:flutter/material.dart';
import 'signin.dart';

class Home extends StatelessWidget {
  final String studentId;

  const Home({
    super.key,
    required this.studentId,
  });

  void signOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text(
            'Do you want to sign out of UniLibrary?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignIn(),
                  ),
                      (route) => false,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Signed out of UniLibrary'),
                  ),
                );
              },
              child: const Text('Sign Out'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, $studentId'),
        actions: [
          IconButton(
            icon: const Icon(Icons.power_settings_new),
            onPressed: () => signOut(context),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'You are signed in to UniLibrary',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.teal.shade800,
          ),
        ),
      ),
    );
  }
}
