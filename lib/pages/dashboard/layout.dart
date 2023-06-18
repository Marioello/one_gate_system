import 'package:flutter/material.dart';
import 'package:one_gate_system/models/api_response.dart';
import 'package:one_gate_system/models/member.dart';
import 'package:one_gate_system/services/auth.dart';
import 'package:one_gate_system/shared/constants.dart';
import 'package:one_gate_system/shared/helper.dart';

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

  /// Fasttrack

  late APIResponse<List<Member>> getMbr0;
  List<Member> getMbr = [];

  Future<void> _getMember() async {
    setState(() => isLoading = true);

    getMbr0 = await Member.getMember();
    getMbr = getMbr0.data ?? [];

    setState(() => isLoading = false);
  }

  @override
  void initState() {
    _getMember();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listMenu = [
      ListTile(
        title: textHelper('Beranda'),
        onTap: () => setState(() => selectedPage = 0),
      ),
      ListTile(
        title: textHelper('Produk'),
        onTap: () => setState(() => selectedPage = 1),
      ),
      ListTile(
        title: textHelper('Marketing Plan'),
        onTap: () {},
      ),
      ListTile(
        title: textHelper('Logout'),
        onTap: () => auth.signOut(),
      ),
    ];

    ///
    return Scaffold(
      // appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
                    child: ListView.separated(
                      itemBuilder: (context, index) => listMenu[index],
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: listMenu.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: pages(selectedPage, getMbr),
          ),
        ],
      ),
    );
  }
}
