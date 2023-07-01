import 'package:flutter/material.dart';

import '../models/api_response.dart';
import '../models/member.dart';
import '../services/auth.dart';
import 'components/menu.dart';

class PageWrapper extends StatefulWidget {
  const PageWrapper({super.key});

  @override
  State<PageWrapper> createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
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

  @override
  void initState() {
    _getMember();
    super.initState();
  }

  void selectedIndex(int value) {
    setState(() {
      selectedPage = value;
      _getMember();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: WidgetMenu(funct: selectedIndex),
          ),
          Expanded(
            flex: 10,
            child: Container(
              color: Colors.amber[200],
              child: pages(selectedPage, memberList),
            ),
          ),
        ],
      ),
    );
  }
}
