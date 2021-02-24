import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/widgets_generic/color_bank.dart';
import '../../models/chantier/status_type.dart';
import '../../models/chantier/chantier.dart';
import 'package:enum_to_string/enum_to_string.dart';

import '../../services/firebase_services/database_service.dart';
import 'widgets/chantier_main.dart';

class ChantierPage extends StatelessWidget {

  Chantier chantier;

  ChantierPage({
    Key key,
    this.chantier
  }) : super(key: key);

  Color statusColor = Colors.black;

  void setStatusColor(){
    switch (chantier.statusChantier) {
      case StatusType.ENATTENTE:
        {
          statusColor = Colors.orange;
          break;
        }

      case StatusType.ENCOURS:
        {
          statusColor = Colors.green;
          break;
        }

      case StatusType.TERMINE:
        {
          statusColor = Colors.grey;
          break;
        }

      default:
        {
          statusColor = Colors.black;
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {

    final textEditingControllerSearchBar = TextEditingController();
    setStatusColor();
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: ColorBank.BACKGROUND_COLOR,
        appBar: AppBar(
          backgroundColor: ColorBank.APP_BAR_COLOR,
          title: Row(
            children: [
              Expanded(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                      text: chantier.nomChantier),
                ),
              ),

              Text(EnumToString.convertToString(chantier.statusChantier),style: TextStyle(fontSize: 10),),
              Icon(Icons.circle, color: statusColor),
            ],
          ),
        ),
        body: Provider.value(
          value: chantier,
          child: ChantierMain()),
      ),
    );
  }
}
