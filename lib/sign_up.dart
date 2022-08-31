// ignore_for_file: implementation_imports, unnecessary_import, unused_local_variable

import 'package:blogapp/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'helper_f.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(
          Icons.home,
          color: Colors.black,
          size: 40,
        ),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(
                height: 180,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fill,
                )),
            Column(
              children: const [
                SizedBox(
                  height: 20,
                ),
                Text('Sign Up',
                    style: TextStyle(color: Colors.black, fontSize: 12)),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Logopit.jpg",
              height: 120,
              width: double.infinity,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: "Enter Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Enter Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  var obj = await FirebaseHelpers().signUp(
                      _emailController.text, _passwordController.text, context);
                },
                child: const Text("Sign Up")),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ));
                },
                child: const Text("Already have an Account? Sign in.")),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "“Move fast, break things”",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
