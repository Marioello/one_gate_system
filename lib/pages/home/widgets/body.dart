import 'package:flutter/material.dart';
import 'package:one_gate_system/shared/helper.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.size,
    this.isMobile = false,
    this.isTablet = false,
    this.isDesktop = false,
  });

  final Size size;
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    var h = size.height / 100;
    var w = size.width / 100;

    if (isMobile) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textHelper('One Gate System',
                size: 70,
                color: Colors.white,
                weight: FontWeight.bold,
                shadows: [
                  const Shadow(
                    blurRadius: 20.0,
                    color: Colors.black87,
                    offset: Offset(0.0, 0.0),
                  )
                ]),
            const SizedBox(height: 3),
            textHelper('one stop solution',
                size: 25,
                color: Colors.grey.shade200,
                shadows: [
                  const Shadow(
                    blurRadius: 20.0,
                    color: Colors.black87,
                    offset: Offset(0.0, 0.0),
                  )
                ]),
            const SizedBox(height: 25),
            Container(
              // color: Colors.white70,
              color: Colors.transparent,
              height: 50, // h * 10,
              width: double.infinity, // w * 80,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'putinela.romario@gmail.com',
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child:
                          textHelper('Daftar', size: 17.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textHelper('One Gate System',
              size: 70,
              color: Colors.white,
              weight: FontWeight.bold,
              shadows: [
                const Shadow(
                  blurRadius: 20.0,
                  color: Colors.black87,
                  offset: Offset(0.0, 0.0),
                )
              ]),
          const SizedBox(height: 3),
          textHelper('one stop solution',
              size: 25,
              color: Colors.grey.shade200,
              shadows: [
                const Shadow(
                  blurRadius: 20.0,
                  color: Colors.black87,
                  offset: Offset(0.0, 0.0),
                )
              ]),
          const SizedBox(height: 25),
          Container(
            // color: Colors.white70,
            color: Colors.transparent,
            // width: w * (isDesktop ? 35 : 50),
            width: isDesktop ? 400 : 400,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: w * 0.5),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'putinela.romario@gmail.com',
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: h * 1.5),
                    child:
                        textHelper('Daftar', size: 17.0, color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      );
    }
  }
}
