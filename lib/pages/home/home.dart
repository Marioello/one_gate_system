import 'package:flutter/material.dart';

import '../../responsive.dart';
import '../../shared/helper.dart';
import 'widgets/body.dart';
import 'widgets/footer.dart';
import 'widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size size = MediaQuery.of(context).size;
    // var w = size.width / 100;
    // var h = size.height / 100;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main-bg.jpg'),
            fit: BoxFit.cover,
            opacity: 1,
          ),
        ),
        child: Responsive(
          mobile: Column(
            children: [
              // Header
              Expanded(
                flex: 2,
                child: HomeHeader(size: size, mobileMode: true),
              ),
              // Body
              Expanded(
                flex: 10,
                child: HomeBody(size: size, isMobile: true),
              ),
              // Footer
              Expanded(
                flex: 1,
                child: HomeFooter(size: size),
              ),
            ],
          ),
          tablet: Column(
            children: [
              // Header
              Expanded(
                flex: 2,
                child: HomeHeader(size: size, tabletMode: true),
              ),
              // Body
              Expanded(
                flex: 10,
                child: HomeBody(size: size, isTablet: true),
              ),
              // Footer
              Expanded(
                flex: 1,
                child: HomeFooter(size: size),
              ),
            ],
          ),
          desktop: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Header
              Expanded(
                flex: 2,
                child: HomeHeader(size: size, desktopMode: true),
              ),
              // Body
              Expanded(
                flex: 10,
                child: HomeBody(size: size, isDesktop: true),
              ),
              // Footer
              Expanded(
                flex: 1,
                child: HomeFooter(size: size),
              ),
            ],
          ),
          tooSmall: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: textHelper('Halaman terlalu kecil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
