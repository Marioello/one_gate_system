import 'package:flutter/material.dart';
import 'package:one_gate_system/services/auth.dart';
import 'package:one_gate_system/shared/helper.dart';
import 'package:one_gate_system/shared/responsive_layout.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      largeScreen: LargeChild(),
    );
  }
}

class LargeChild extends StatefulWidget {
  const LargeChild({super.key});

  @override
  State<LargeChild> createState() => _LargeChildState();
}

class _LargeChildState extends State<LargeChild> {
  final AuthService _auth = AuthService();
  String _email = '';
  final String _password = '1234567890';

  ///
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: .6,
            child: Image.network("assets/images/main-bg.jpg", scale: .85),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: .6,
            child: Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textHelper('Selamat datang',
                      size: 60.0,
                      weight: FontWeight.normal,
                      color: const Color(0xFF8591B0)),
                  RichText(
                    text: const TextSpan(
                      text: "di ",
                      style: TextStyle(
                        fontSize: 50,
                        color: Color(0xFF8591B0),
                        fontWeight: FontWeight.normal,
                      ),
                      children: [
                        TextSpan(
                          text: "One Gate System",
                          style: TextStyle(
                            fontSize: 65,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: 'Montserrat-Bold',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 20),
                    child: textHelper('LET’S EXPLORE THE WORLD'),
                  ),
                  const SizedBox(height: 40),
                  // Register text box & button
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 4.0, right: 650, top: 10, bottom: 40),
                    child: Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 8),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 8,
                              child: TextField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Masukan email anda',
                                ),
                                onChanged: (value) {
                                  if (value.length > 3) {
                                    setState(() => _email = value.toString());
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFC86DD7),
                                      Color(0xFF3023AE),
                                    ],
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF6078ea)
                                          .withOpacity(.3),
                                      offset: const Offset(0.0, 8.0),
                                      blurRadius: 8.0,
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: () async =>
                                      await _auth.registerwithEmailAndPassword(
                                          _email, _password),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    minimumSize: const Size(100, 40),
                                  ),
                                  child: textHelper('Daftar',
                                      size: ResponsiveLayout.isSmallScreen(
                                              context)
                                          ? 12
                                          : ResponsiveLayout.isMediumScreen(
                                                  context)
                                              ? 12
                                              : 16,
                                      color: Colors.white,
                                      letterSpacing: 1.0,
                                      fontFamily: 'Montserrat-Bold'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
