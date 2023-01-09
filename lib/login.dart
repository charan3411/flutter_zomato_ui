import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zomato_ui/signupscreen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard_new.dart';
import 'forgotpassword.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Georgia',
      ),
      home: const MyLoginPage(title: 'Login'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  bool loginFail = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = 'bp@infostretch.com';
    _password.text = 'Today@2345';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'ZOMATO APP USING FLUTTER',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your Email Id',
                      icon: Icon(Icons.mail)),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (enteredEmail) => validateEmail(enteredEmail),
                  controller: _emailController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your Password',
                    icon: Icon(Icons.password),
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.all(18)),
                  onPressed: () {
                    if (loginFail) {
                      snackBarDisplay('Invalid Email');
                    } else {
                      snackBarDisplay('Valid Email');
                      saveLoginDetails();
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.centerLeft,
                            textStyle: const TextStyle(
                              color: Colors.red,
                            )),
                        onPressed: () {
                          navigationtoSignup(_emailController.text);
                        },
                        child: const Text(
                          'Sign Up',
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.centerRight,
                            textStyle: const TextStyle(
                              color: Colors.red,
                            )),
                        onPressed: () {
                          navigationtoForgotPswd();
                        },
                        child: const Text(
                          'Forgot Password?',
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void validateEmail(String enteredEmail) {
    if (EmailValidator.validate(enteredEmail)) {
      setState(() {
        loginFail = false;
      });
    } else {
      setState(() {
        loginFail = true;
      });
    }
  }

  void snackBarDisplay(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void navigateToDashboard() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => dashboard_new()));
  }

  void navigationtoSignup(String email) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SignupScreen(
                  text: email,
                )));
  }

  void navigationtoForgotPswd() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgotPassword()));
  }

  Future<void> saveLoginDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('email', _emailController.text);
      prefs.setString('password', _password.text);
      prefs.setBool('isLogin', true);
    });
    navigateToDashboard();
  }
}