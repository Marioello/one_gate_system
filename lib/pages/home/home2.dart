import 'package:flutter/material.dart';
import 'package:one_gate_system/responsive.dart';
import 'package:one_gate_system/shared/helper.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size size = MediaQuery.of(context).size;
    var w = size.width / 100;
    var h = size.height / 100;

    // return Scaffold(
    //   backgroundColor: Colors.brown[50],
    //   body: Responsive(
    //     mobile: HomeHeader(
    //         defPadding: defPadding, h: h, isMobile: true, text: 'Mobile'),
    //     tablet: Container(
    //       decoration: const BoxDecoration(
    //         image: DecorationImage(
    //           image: AssetImage('assets/images/main-bg.jpg'),
    //           fit: BoxFit.cover,
    //           opacity: 1,
    //         ),
    //       ),
    //       child: Padding(
    //         padding: EdgeInsets.symmetric(vertical: h * 2, horizontal: w * 1),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             // Header
    //             Expanded(
    //               flex: 1,
    //               child:
    //                   HomeHeader(defPadding: defPadding, h: h, text: 'Tablet'),
    //             ),
    //             // Body
    //             Expanded(
    //               flex: 10,
    //               child: HomeBody(h: h, w: w, isTablet: true),
    //             ),
    //             // Footer
    //             Expanded(
    //               flex: 1,
    //               child: HomeFooter(defPadding: defPadding),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     desktop: Container(
    //       decoration: const BoxDecoration(
    //         image: DecorationImage(
    //           image: AssetImage('assets/images/main-bg.jpg'),
    //           fit: BoxFit.cover,
    //           opacity: 1,
    //         ),
    //       ),
    //       child: Padding(
    //         padding: EdgeInsets.symmetric(vertical: h * 2, horizontal: w * 1),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             // Header
    //             Expanded(
    //               flex: 1,
    //               child:
    //                   HomeHeader(defPadding: defPadding, h: h, text: 'Desktop'),
    //             ),
    //             // Body
    //             Expanded(
    //               flex: 10,
    //               child: HomeBody(h: h, w: w),
    //             ),
    //             // Footer
    //             Expanded(
    //               flex: 1,
    //               child: HomeFooter(defPadding: defPadding),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
// 1589

    ///
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
                flex: 1,
                child: HomeHeader(size: size, mobileMode: true, text: 'Mobile'),
              ),
              // // Body
              // Expanded(
              //   flex: 10,
              //   child: HomeBody(size: size, isMobile: true),
              // ),
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
                flex: 1,
                child: HomeHeader(size: size, tabletMode: true, text: 'Tablet'),
              ),
              // // Body
              // Expanded(
              //   flex: 10,
              //   child: HomeBody(size: size, isTablet: true),
              // ),
              // Footer
              Expanded(
                flex: 1,
                child: HomeFooter(size: size),
              ),
            ],
          ),
          desktop: Padding(
            padding: EdgeInsets.symmetric(vertical: h * 2, horizontal: w * 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Header
                Expanded(
                  flex: 1,
                  child: HomeHeader(
                      size: size, desktopMode: true, text: 'Desktop'),
                ),
                // // Body
                // Expanded(
                //   flex: 10,
                //   child: HomeBody(size: size, isTablet: true),
                // ),
                // Footer
                Expanded(
                  flex: 1,
                  child: HomeFooter(size: size),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.size,
    this.mobileMode = false,
    this.tabletMode = false,
    this.desktopMode = false,
    this.text = 'Desktop',
  });

  final Size size;
  final bool mobileMode;
  final bool tabletMode;
  final bool desktopMode;
  final String text;

  @override
  Widget build(BuildContext context) {
    var titleText = text.isNotEmpty ? ' - $text' : text;
    var mode = '';
    if (mobileMode) {
      mode = 'Mobile';
    } else if (tabletMode) {
      mode = 'Tablet';
    } else if (desktopMode) {
      mode = 'Desktop';
    }

    print('Mode: $mode');

    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(size.width * 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textHelper(
                mobileMode ? 'OGS$titleText' : 'One Gate System$titleText',
                size: 30.0,
                color: Colors.white,
                shadows: [
                  const Shadow(
                    blurRadius: 20.0,
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                  )
                ]),
            // mobileMode
            //     ? Icon(Icons.menu, size: size.width * 8, color: Colors.white)
            //     : ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: Colors.purple,
            //           elevation: 10.0,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10.0),
            //           ),
            //         ),
            //         onPressed: () {},
            //         child: Padding(
            //           padding: EdgeInsets.symmetric(vertical: size.height * 1),
            //           child:
            //               textHelper('Login', size: 17.0, color: Colors.white),
            //         ),
            //       ),
          ],
        ),
      ),
    );
  }
}

// class HomeBody extends StatelessWidget {
//   const HomeBody({
//     super.key,
//     required this.size,
//     this.isMobile = false,
//     this.isTablet = false,
//     this.isDesktop = false,
//   });

//   final Size size;
//   final bool isMobile;
//   final bool isTablet;
//   final bool isDesktop;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: isMobile
//           ? Padding(
//               padding: EdgeInsets.all(size.width * 8),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   textHelper('One Gate System',
//                       size: 70,
//                       color: Colors.white,
//                       weight: FontWeight.bold,
//                       shadows: [
//                         const Shadow(
//                           blurRadius: 20.0,
//                           color: Colors.black87,
//                           offset: Offset(0.0, 0.0),
//                         )
//                       ]),
//                   SizedBox(height: size.height * 2.5),
//                   SizedBox(
//                     width: size.width * 80,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: EdgeInsets.only(right: size.width * 0.5),
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 hintText: 'putinela.romario@gmail.com',
//                               ),
//                               onChanged: (value) {},
//                             ),
//                           ),
//                         ),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.purple,
//                             elevation: 10.0,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: Padding(
//                             padding:
//                                 EdgeInsets.symmetric(vertical: size.height * 2),
//                             child: textHelper('Daftar',
//                                 size: 17.0, color: Colors.white),
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )
//           : Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 textHelper('One Gate System',
//                     size: 70,
//                     color: Colors.white,
//                     weight: FontWeight.bold,
//                     shadows: [
//                       const Shadow(
//                         blurRadius: 20.0,
//                         color: Colors.black87,
//                         offset: Offset(0.0, 0.0),
//                       )
//                     ]),
//                 textHelper('one stop solution',
//                     size: 25,
//                     color: Colors.grey.shade200,
//                     shadows: [
//                       const Shadow(
//                         blurRadius: 20.0,
//                         color: Colors.black87,
//                         offset: Offset(0.0, 0.0),
//                       )
//                     ]),
//                 SizedBox(height: size.height * 5),
//                 SizedBox(
//                   width: size.width * 20,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Padding(
//                           padding: EdgeInsets.only(right: size.width * 0.5),
//                           child: TextField(
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Colors.white,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               hintText: 'putinela.romario@gmail.com',
//                             ),
//                             onChanged: (value) {},
//                           ),
//                         ),
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.purple,
//                           elevation: 10.0,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: Padding(
//                           padding:
//                               EdgeInsets.symmetric(vertical: size.height * 1.5),
//                           child: textHelper('Daftar',
//                               size: 17.0, color: Colors.white),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//     );
//   }
// }

class HomeFooter extends StatelessWidget {
  const HomeFooter({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[50]?.withOpacity(.50),
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(size.width * 1),
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
