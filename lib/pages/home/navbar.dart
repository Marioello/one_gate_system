import 'package:flutter/material.dart';
import 'package:one_gate_system/services/auth.dart';
import 'package:one_gate_system/shared/responsive_layout.dart';
import 'package:one_gate_system/shared/helper.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final AuthService _auth = AuthService();
  // final _formKey = GlobalKey<FormState>();

  ///
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    ///
    final navLinks = ["Home", "Products"];

    List navItem() {
      return navLinks.map((text) {
        return Padding(
          padding: const EdgeInsets.only(left: 18),
          child: textHelper(text, size: 18.0, fontFamily: 'Montserrat-Bold'),
        );
      }).toList();
    }

    ///
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFC86DD7), Color(0xFF3023AE)],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
                child: Center(
                  child: textHelper('O', size: 30.0, color: Colors.white),
                ),
              ),
              const SizedBox(width: 5),
              textHelper("ne gate system", size: 30.0),
            ],
          ),
          if (!ResponsiveLayout.isSmallScreen(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ...navItem(),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xFFC86DD7), Color(0xFF3023AE)],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6078ea).withOpacity(.3),
                          offset: const Offset(0, 8),
                          blurRadius: 8,
                        )
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minimumSize: const Size(100, 40),
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
                                padding: const EdgeInsets.all(8.0),
                                child: Form(
                                  child: Column(
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
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.grey),
                                  ),
                                  child: const Text("Batal"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
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
                            );
                          },
                        );
                      },
                      child: textHelper('Login',
                          size: 18.0,
                          color: Colors.white,
                          letterSpacing: 1,
                          fontFamily: 'Montserrat-Bold'),
                    ),
                  ),
                )
              ],
            )
          else
            Image.network("assets/menu.png", width: 26, height: 26)
        ],
      ),
    );
  }
}
