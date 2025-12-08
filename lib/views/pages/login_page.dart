import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:news/views/widget_tree.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController(
    text: 'iktiar@gmail.com',
  );
  TextEditingController controllerPass = TextEditingController(text: '9086');
  String authServiceEmail = 'iktiar@gmail.com';
  String authServicePass = '9086';
  String errorMessage = '';
  @override
  void initState() {
    print('InitState initiated');
    super.initState();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lotties/Login.json'),

                SizedBox(height: 20.0),
                TextField(
                  controller: controllerEmail,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onEditingComplete: () => setState(() {}),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: controllerPass,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onEditingComplete: () => setState(() {}),
                ),
                Text(errorMessage, style: TextStyle(color: Colors.red)),
                FilledButton(
                  onPressed: () {
                    onLogin();
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onLogin() {
    if (authServiceEmail == controllerEmail.text &&
        authServicePass == controllerPass.text) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WidgetTree();
          },
        ),
        (route) => false,
      );
      setState(() {
        errorMessage = '';
      });
    } else {
      setState(() {
        errorMessage = 'Invalid Credentials';
      });
    }
  }
}
