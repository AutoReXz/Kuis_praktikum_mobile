import 'package:flutter/material.dart';
import 'package:tugas_2_latihan_quiz/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final user = TextEditingController();
  final pass = TextEditingController();

  final keyform = GlobalKey<FormState>();
  bool islogin = false;

  @override
  void dispose() {
    super.dispose();
    user.dispose();
    pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: keyform,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SizedBox(
              height: 600,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/images/upnLogo.png",
                      width: 150,
                    ),
                    Text("Login",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Text("login untuk mengakses lebih banyak fitur"),
                    TextFormField(
                      controller: user,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username wajib isi";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          label: Text("Username")),
                    ),
                    TextFormField(
                      controller: pass,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password wajib isi";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          label: Text("Password")),
                      obscureText: true,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (keyform.currentState!.validate()) {
                                if (user.text == "fulan" &&
                                    pass.text == "fulan") {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Home(username: user.text)));
                                } else {
                                  setState(() {
                                    islogin = true;
                                  });
                                }
                              }
                            },
                            child: Text("Login",
                                style:
                                    TextStyle(fontWeight: FontWeight.bold)))),
                    islogin
                        ? const Text("Email atau Password salah",
                            style: TextStyle(color: Colors.red))
                        : const SizedBox()
                  ]),
            ),
          ),
        ),
      ),
    ));
  }
}
