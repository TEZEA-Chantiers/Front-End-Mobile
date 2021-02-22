import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/services/crud/authentification.dart';
import 'package:tezea_chantiers/src/services/crud/utilisateur_service.dart';

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
                  ).then((value) {
                    FocusScope.of(context).unfocus();
                    if (value == null) {
                      String auth_error = "La connexion au compte a échoué.";
                      //Good lord, it seems to be deprecated.
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(auth_error),
                      ));
                    } else {
                      //print("Retrieved JWT : " + value.jwt);
                      Utilisateur_Service.getUtilisateur(value.jwt).then(
                          (utilisateur) => AuthentificationService.currentUser =
                              utilisateur);
                    }
                  });
                }
              },
              icon: const Icon(Icons.arrow_forward_rounded),
              label: const Text('Connexion'),
              color: Colors.deepOrangeAccent,
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            const Text.rich(TextSpan(
              text: 'En cas d\'oubli, contactez l\'administration. ',
              style: TextStyle(color: Colors.white70),
            )),
          ],
        ),
      ),
    );
  }
}
