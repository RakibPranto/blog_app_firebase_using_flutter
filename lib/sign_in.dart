// ignore_for_file: implementation_imports, unnecessary_import, prefer_final_fields, unused_local_variable

import 'package:blogapp/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'helper_f.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
                Text('Sign In',
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
                onPressed: () {
                  var obj = FirebaseHelpers().signIn(
                      _emailController.text, _passwordController.text, context);
                },
                child: const Text("Sign In")),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ));
                },
                child: const Text("Doesn't have an Account? Sign up.")),
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
