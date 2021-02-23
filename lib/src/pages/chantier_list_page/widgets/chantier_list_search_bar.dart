import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChantierListSearchBar extends StatelessWidget {
  const ChantierListSearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.watch<TextEditingController>(),
      style: TextStyle(color: Colors.grey[600]),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey[600]),
        hintText: 'Recherche',
        prefixIcon: Icon(Icons.search, color: Colors.black),
      ),
      keyboardType: TextInputType.text,
    );
  }
}
