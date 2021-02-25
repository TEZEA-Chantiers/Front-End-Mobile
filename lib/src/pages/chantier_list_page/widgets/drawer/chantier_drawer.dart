import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezea_chantiers/src/pages/login_page/login_page.dart';
import 'package:tezea_chantiers/src/widgets_generic/color_bank.dart';

import '../../../chantier_list_page/chantier_list_page.dart';
import '../../../chantier_page/chantier_page.dart';
import '../../../problem_list_page/problem_list_page.dart';
import '../../../problem_page/problem_page.dart';
import 'chantier_drawer_menu.dart';

class ChantierListDrawer extends StatelessWidget {
  const ChantierListDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();

    return Drawer(
      child: Container(
        color: ColorBank.APP_BAR_COLOR,
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.zero,
            children: [
              Padding(padding: EdgeInsets.only(bottom: 100)),
              const ChantierListDrawerMenu(),
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text('Se déconnecter'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
