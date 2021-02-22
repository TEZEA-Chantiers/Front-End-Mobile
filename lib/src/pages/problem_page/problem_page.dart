import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezea_chantiers/src/pages/problem_list_page/problem_list_page.dart';

import 'widgets/problem_main.dart';

class ProblemPage extends StatelessWidget {
  const ProblemPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingControllerSearchBar = TextEditingController();

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: const Color(0xff2E4053),
          appBar: AppBar(
            backgroundColor: const Color(0xff2E4060),
            title: const Text('Problème du [DATE]'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProblemListPage(),
                ));
              }
            ),
          ),
          body: const ProblemMain()),
      //),
    );
  }
}
