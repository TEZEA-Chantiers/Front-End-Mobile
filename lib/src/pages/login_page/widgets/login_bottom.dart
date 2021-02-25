import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/pages/chantier_list_page/chantier_list_page.dart';
import 'package:tezea_chantiers/src/services/crud/authentification.dart';
import 'package:tezea_chantiers/src/services/crud/utilisateur_service.dart';
import 'package:tezea_chantiers/src/widgets_generic/color_bank.dart';

import '../models/login_input_controller_model.dart';

class LoginBottom extends StatelessWidget {
  const LoginBottom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 5)),
            RaisedButton.icon(
              onPressed: () {
                if (context
                    .read<GlobalKey<FormState>>()
                    .currentState
                    .validate()) {
                  AuthentificationService.authenticate(
                    context
                        .read<LoginInputControllerModel>()
                        .emailController
                        .text
                        .trim(),
                    context
                        .read<LoginInputControllerModel>()
                        .passwordController
                        .text
                        .trim(),
                  ).then((token) {
                    FocusScope.of(context).unfocus();
                    print(token);
                    if (token == null) {
                      String auth_error = "La connexion au compte a échoué.";
                      //Good lord, it seems to be deprecated.
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(auth_error),
                      ));
                    } else {
                      //print("Retrieved JWT : " + value.jwt);
                      Utilisateur_Service.getUtilisateur(token.jwt).then(
                          (utilisateur) => AuthentificationService.currentUser =
                              utilisateur);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChantierListPage()));
                    }
                  });
                }
              },
              icon: const Icon(
                Icons.arrow_forward_rounded,
                color: ColorBank.CARD_COLOR,
              ),
              label: Text.rich(TextSpan(
                text: 'Connexion',
                style: TextStyle(color: ColorBank.CARD_COLOR),
              )),
              color: ColorBank.APP_BAR_COLOR,
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            Text.rich(TextSpan(
              text: 'En cas d\'oubli, contactez l\'administration. ',
              style: TextStyle(color: Colors.grey[600]),
            )),
          ],
        ),
      ),
    );
  }
}
