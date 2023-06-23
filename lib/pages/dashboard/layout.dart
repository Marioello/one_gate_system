import 'package:flutter/material.dart';
import 'package:one_gate_system/models/api_response.dart';
import 'package:one_gate_system/models/basic_tile.dart';
import 'package:one_gate_system/models/member.dart';
import 'package:one_gate_system/pages/dashboard/components/dashboard.dart';
import 'package:one_gate_system/pages/product/product.dart';
import 'package:one_gate_system/services/auth.dart';
import 'package:one_gate_system/shared/constants.dart';
import 'package:one_gate_system/shared/helper.dart';
import 'package:one_gate_system/shared/widgets/fast_track.dart';

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({super.key, this.showHeader = true});

  final bool showHeader;

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  AuthService auth = AuthService();
  int selectedPage = 0;
  bool isLoading = false;

  late APIResponse<List<Member>> getMbr0;
  List<Member> memberList = [];

  Future<void> _getMember() async {
    setState(() => isLoading = true);

    getMbr0 = await Member.getMember();
    memberList = getMbr0.data ?? [];

    setState(() => isLoading = false);
  }

  Widget buildTile(BasicTile tile) {
    if (tile.tiles.isEmpty) {
      return ListTile(
        title: textHelper(tile.title),
        onTap: () {
          if (tile.pageNo == -1) {
            auth.signOut();
          } else if (tile.pageNo == 31) {
            setState(() => selectedPage = 2);
          } else {
            setState(() => selectedPage = tile.pageNo);
          }
        },
      );
    } else {
      return ExpansionTile(
        title: Text(tile.title),
        children: tile.tiles.map((tile) => buildTile(tile)).toList(),
      );
    }
  }

  @override
  void initState() {
    _getMember();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Sidebar
          Expanded(
            flex: 2,
            child: Container(
              color: const Color(0xFFF2F4FC),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                    child: Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/user-bg.png'),
                            opacity: 0.7,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: textHelper('Hi Customer! - 1',
                          size: fntSizeDefault1, weight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: textHelper('+62-812-9811-2613',
                          color: Colors.grey, style: FontStyle.italic),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Expanded(
                    child: ListView(
                      children: basicTiles.map(buildTile).toList(),
                    ),
                  )
                ],
              ),
            ),
          ),

          /// Pages
          Expanded(
            flex: 10,
            child: pages(selectedPage, memberList),
          ),
        ],
      ),
    );
  }
}

/// Page list
Widget pages(int selectedPage, List<Member> memberList) {
  final pages = [
    PageDashboard(memberList: memberList),
    PageProduct(memberList: memberList),
    FastTrackWidget(memberList: memberList),
  ];
  return pages[selectedPage];
}
