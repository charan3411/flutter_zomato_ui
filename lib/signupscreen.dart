import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatelessWidget {
  bool isEmail = false;
  bool isMobile = false;
  bool isPswd = false;
  bool isAddress = false;
  bool isUsername = false;

  String result = '';
  String text;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pswdController = TextEditingController();
  final TextEditingController _confrimPswdController = TextEditingController();

  SignupScreen({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.mail),
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: _usernameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.mail),
                        labelText: 'Email Id',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone),
                        labelText: 'Mobile Number',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      controller: _mobileController,
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(10)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.location_on),
                        labelText: 'Address',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.streetAddress,
                      controller: _addressController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      controller: _pswdController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      controller: _confrimPswdController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.all(20)),
                      onPressed: () {
                        getTextInputData(context);
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(result),
                  )
                ],
              ))),
    );
  }

  void getTextInputData(BuildContext context) {
    if (_pswdController.text.isNotEmpty &&
        _confrimPswdController.text.isNotEmpty) {
      if (_pswdController.text == _confrimPswdController.text) {
        isPswd = true;
      } else {
        isPswd = false;
      }
    }

    if (_addressController.text.isNotEmpty) {
      isAddress = true;
    } else {
      isAddress = false;
    }

    if (_usernameController.text.isNotEmpty) {
      isUsername = true;
    } else {
      isUsername = false;
    }

    if (EmailValidator.validate(_emailController.text)) {
      isEmail = true;
    } else {
      isEmail = false;
    }

    if (_mobileController.text.length < 10) {
      isMobile = false;
    } else {
      isMobile = true;
    }

    if (isEmail && isPswd && isMobile && isAddress) {
      showSnackBar(context, 'OK');
      Navigator.pop(context);
    } else {
      if (!isEmail) {
        showSnackBar(context, 'Please enter valid Email Id');
      } else if (!isPswd) {
        showSnackBar(context, 'Password is not matching with Confirm Password');
      } else if (!isMobile) {
        showSnackBar(context, 'Please enter valid Mobile Number');
      } else if (!isAddress) {
        showSnackBar(context, 'Please enter valid Address');
      } else if (!isUsername) {
        showSnackBar(context, 'Please enter valid Username');
      }
    }
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }
}
