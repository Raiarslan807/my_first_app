
import 'package:flutter/material.dart';
import 'package:my_first_app/screens/dashboard.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> _globalKey = GlobalKey();

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  // show / hide the password
  bool _isObscure = true;

  void _signIn(BuildContext context) async {
    if (_globalKey.currentState!.validate()) {
      String? username_entered = _username.text;
      String? password_entered = _password.text;

      // print('Username Entered = $username_entered');
      // print('Password Entered = $password_entered');

      _username.clear();
      _password.clear();

      // Navigate to Dashboard after Username & Password Entered
      String? response = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(username_entered),
        ),
      );

      print(response);
    }
  }

  String? _validateUsername(String? value) {
    return value!.isEmpty ? 'Username is Invalid' : null;
  }

  String? _validatePassword(String? value) {
    return value!.isEmpty ? 'Password is Invalid' : null;
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [


              SizedBox(width: double.infinity, height: 15.0),

              Text(
                'Log In',
                style: TextStyle(fontSize: 24.0),
              ),

              SizedBox(width: double.infinity, height: 15.0),

              Form(
                key: _globalKey,
                child: Column(
                  children: [
                    // ---------- Username ----------
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: _username,
                        validator: (value) =>
                            _validateUsername(value),
                        decoration: InputDecoration(
                          labelText: 'Username',
                          hintText: 'Enter Username',
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),

                    // ---------- Password ----------
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: _password,
                        validator: (value) =>
                            _validatePassword(value),
                        obscureText: _isObscure,
                        autocorrect: false,
                        enableSuggestions: false,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(20.0),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: double.infinity, height: 15.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _signIn(context),
                    child: Text('Log In'),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(
                        Colors.orange.shade700,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 25, height: 15.0),

                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Sign Up'),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(
                        Colors.orange.shade700,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(width: double.infinity, height: 10.0),

              TextButton(
                onPressed: () {},
                child: Text('Forget Password'),
              ),
              SizedBox(width: double.infinity, height: 20.0),

              CircleAvatar(
                backgroundImage: AssetImage(
                  'resources/images/OLogo.jpeg',
                ),
                radius: 55,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
