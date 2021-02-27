import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/widgets_generic/color_bank.dart';
import 'package:tezea_chantiers/src/wrappers/auth_wrapper/auth_wrapper.dart';

import '../../../services/crud/utilisateur/utilisateur_service.dart';
import '../../../services/database/authentification_service.dart';
import '../models/login_input_controller_model.dart';

class LoginBottom extends StatelessWidget {
  const LoginBottom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _utilisateurService = UtilisateurService();
    final _authentificationService = AuthentificationService();
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
                  _authentificationService
                      .authenticate(
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
                  )
                      .then((token) {
                    FocusScope.of(context).unfocus();
                    if (token == null) {
                      Scaffold.of(context).showSnackBar(const SnackBar(
                        content: Text('La connexion au compte a échoué.'),
                      ));
                    } else {
                      _utilisateurService
                          .getUtilisateur(token.jwt)
                          .then((utilisateur) async {
                        await context.read<FlutterSecureStorage>().write(
                            key: 'utilisateur',
                            value: jsonEncode(utilisateur.toJson()));
                        await Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthWrapper()));
                      });
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
              text: "En cas d'oubli, contactez l'administration.",
              style: TextStyle(color: Colors.grey[700]),
            )),
          ],
        ),
      ),
    );
  }
}
