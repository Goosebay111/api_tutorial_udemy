//tokens come in here.
import 'package:api_tutorial_udemy/screens/home.dart';
import 'package:api_tutorial_udemy/services/api_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  // login details for website for user access.
  final TextEditingController nameController =
      TextEditingController(text: "mor_2314");
  final TextEditingController passwordController =
      TextEditingController(text: "83r5^_");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Shop'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    final getToken = await ApiService.userLogin(
                      nameController.text,
                      passwordController.text,
                    );
                    if (getToken['token'] != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Login Success | your token id is ${getToken['token']}'),
                          backgroundColor: Colors.green));
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Login Failed'),
                          backgroundColor: Colors.red));
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
