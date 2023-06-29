import 'package:flutter/material.dart';
import 'package:one_gate_system/services/auth.dart';
import 'package:one_gate_system/shared/helper.dart';

class WidgetLogin extends StatefulWidget {
  const WidgetLogin({super.key, required this.btnHeight});

  final double btnHeight;

  @override
  State<WidgetLogin> createState() => _WidgetLoginState();
}

class _WidgetLoginState extends State<WidgetLogin> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.purple.shade50,
              scrollable: true,
              title: textHelper('Login', size: 20.0),
              content: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          icon: Icon(
                            Icons.email,
                            // size: w * 5,
                            // color: colorHelper('#642e6a'),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          icon: Icon(
                            Icons.password,
                            // size: w * 5,
                            // color: colorHelper('#642e6a'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.grey),
                          ),
                          child: const Text("Batal"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const SizedBox(width: 10.0),
                        ElevatedButton(
                          child: const Text("Login"),
                          onPressed: () {
                            _auth
                                .signInWithEmailAndPassword(
                                    emailController.text,
                                    passwordController.text)
                                .then((value) {
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: widget.btnHeight),
        child: textHelper('Login', size: 17.0, color: Colors.white),
      ),
    );
  }
}
