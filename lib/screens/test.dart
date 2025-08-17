import 'package:flutter/material.dart';

import 'package:shop/data/repository/authentication_repository.dart';

import 'package:shop/util/auth_manager.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              var either = await AuthenticationRepository().login(
                "aliszs1234",
                "5560474509",
              );
            },
            child: Text('login'),
          ),

          ElevatedButton(
            onPressed: () async {
              AuthManager.lougout();
            },
            child: Text('logout'),
          ),
          ValueListenableBuilder(
            valueListenable: AuthManager.authChangeNotifire,
            builder: (context, value, child) {
              if (value == null || value.isEmpty) {
                return Text('not login');
              } else {
                return Text('login: $value');
              }
            },
          ),
        ],
      ),
    );
  }
}
