import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../base_colors.dart';

class CustomIpField extends StatefulWidget {
  final String hint;
  final String initialValue;
  final TextDirection? textDirection;
  late InputBorder? border;

  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;

  final TextEditingController? controller;

  CustomIpField({
    Key? key,
    this.hint = "Ip",
    this.initialValue = "",
    this.textDirection,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.inputFormatters,
    this.border,
    this.controller,
  }) : super(key: key);

  @override
  _CustomIpFieldState createState() => _CustomIpFieldState();
}

class _CustomIpFieldState extends State<CustomIpField> {
  @override
  Widget build(BuildContext context) {
    widget.border ??= createStrokeBorder(radius: 16);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          child: Padding(
            padding: const EdgeInsets.only(right: 5, bottom: 8),
            child: Text(
              widget.hint,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          visible: widget.hint.isNotEmpty,
        ),
        TextFormField(
          controller: widget.controller,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          textDirection: widget.textDirection,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9.]"))
          ],
          decoration: InputDecoration(
              border: widget.border,
              enabledBorder: widget.border,
              focusedBorder: widget.border,
              disabledBorder: widget.border,
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              isDense: false,
              fillColor: BaseColors.textFiled,
              filled: true),
        )
      ],
    );
  }

  InputBorder createStrokeBorder({double? radius}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 20)),
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
    );
  }
}
