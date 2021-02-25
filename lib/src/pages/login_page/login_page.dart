import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezea_chantiers/src/widgets_generic/color_bank.dart';

import 'widgets/login_main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorBank.BACKGROUND_COLOR,
      body: SafeArea(
        child: LoginMain(),
      ),
    );
  }
}
