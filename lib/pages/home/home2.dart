import 'package:flutter/material.dart';
import 'package:one_gate_system/responsive.dart';
import 'package:one_gate_system/shared/helper.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size _size = MediaQuery.of(context).size;
    const double defPadding = 10.0;
    var size = MediaQuery.of(context).size;
    var w = size.width / 100;
    var h = size.height / 100;

    print('width: $w');
    print('height: $h');
    print('defPadding: $defPadding');

    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: Responsive(
        desktop: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/main-bg.jpg'),
              fit: BoxFit.cover,
              opacity: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: h * 2, horizontal: w * 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Header
                HomeHeader(defPadding: defPadding, h: h),
                const Spacer(),
                // Body
                HomeBody(h: h, w: w),
                const Spacer(),
                // Footer
                HomeFooter(defPadding: defPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeFooter extends StatelessWidget {
  const HomeFooter({
    super.key,
    required this.defPadding,
  });

  final double defPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[50]?.withOpacity(.50),
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(defPadding * 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textHelper('Copyright 2023 - One Gate System Team',
                size: 15.0, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          SizedBox(height: h * 5),
          SizedBox(
            width: w * 20,
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
                        hintText: 'Masukan email anda',
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
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.defPadding, required this.h});

  final double defPadding;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[50]?.withOpacity(.50),
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(defPadding * 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textHelper('One Gate System',
                size: 30.0,
                color: Colors.white,
                shadows: [
                  const Shadow(
                    blurRadius: 20.0,
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                  )
                ]),
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
                padding: EdgeInsets.symmetric(vertical: h * 1),
                child: textHelper('Login', size: 17.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
