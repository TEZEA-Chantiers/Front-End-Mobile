import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom({
    @required TextEditingController controller,
    @required TextInputType textInputType,
    @required String hintText,
    @required bool obscureText,
    String Function(String) validator,
    bool validatorEmptyCheck = true,
    Key key,
  })  : _controller = controller,
        _textInputType = textInputType,
        _hintText = hintText,
        _obscureText = obscureText,
        _validator = validator,
        _validatorEmptyCheck = validatorEmptyCheck,
        super(key: key);

  final TextEditingController _controller;
  final TextInputType _textInputType;
  final String _hintText;
  final bool _obscureText;
  final String Function(String) _validator;
  final bool _validatorEmptyCheck;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
            child: TextFormField(
              obscureText: _obscureText,
              keyboardType: _textInputType,
              controller: _controller,
              decoration: InputDecoration(
                hintText: _hintText,
              ),
              validator: (value) {
                if (_validatorEmptyCheck && value.isEmpty) {
                  return 'Valeur manquante.';
                }

                if (_validator != null) {
                  return _validator(value);
                }

                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
