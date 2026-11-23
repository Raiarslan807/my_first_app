
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  String? name;

  Dashboard(this.name);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _signout_confirmation = false;

  void _logOut(BuildContext context) async {
    // Yes Button
    Widget yesButton = TextButton(
      onPressed: () {
        setState(() {
          _signout_confirmation = true;
        });

        Navigator.pop(context); // Close the dialog
      },
      child: Text('Yes'),
    );

    // No Button
    Widget noButton = TextButton(
      onPressed: () {
        setState(() {
          _signout_confirmation = false;
        });

        Navigator.pop(context); // Close the dialog
      },
      child: Text('No'),
    );

    // Alert Dialog
    AlertDialog alert = AlertDialog(
      title: Text('Log Out'),
      content: Text('Are you sure you want to Log Out?'),
      actions: [
        yesButton,
        noButton,
      ],
    );

    // Show Dialog
    await showDialog(
      context: context,
      builder: (context) {
        return alert;
      },
    );

    // Go back to Login screen only if user presses Yes
    if (_signout_confirmation) {
      Navigator.pop(context, "Logged Out Successfully");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Welcome ' + widget.name!),
        actions: [
          IconButton(
            onPressed: () => _logOut(context),
            icon: Icon(Icons.logout_rounded),
          ),
        ],
      ),
    );
  }
}
