import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:elite_edge_labs/main.dart';
import 'package:elite_edge_labs/Utils/const/color_const.dart';

class TextFieldData {
  static buildField({
    int? minLines,
    bool? enabled,
    int? maxLines,
    Color? cursorColor,
    TextStyle? style,
    bool? obscureText,
    Widget? suffixIcon,
    Widget? prefixIcon,
    InputDecoration? decoration,
    bool? readOnly,
    String? hintText,
    void Function()? onTap,
    void Function(String)? onChanged,
    List<TextInputFormatter>? inputFormatters,
    AutovalidateMode? autovalidateMode,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    TextEditingController? controller,
    Widget? label,
    String? text,
  }) {
    final isObscured = obscureText ?? false;
    final adjustedMaxLines = isObscured ? 1 : (maxLines ?? 5);
    return TextFormField(
      cursorWidth: 0,
      cursorHeight: 0,
      onChanged: onChanged,
      enabled: enabled,
      onTap: onTap,
      minLines: minLines ?? 1,
      maxLines: adjustedMaxLines,
      inputFormatters: inputFormatters,
      onTapOutside: (event) {
        FocusScope.of(MyApp.navigatorKey.currentContext!)
            .requestFocus(FocusNode());
      },
      autovalidateMode: autovalidateMode,
      validator: validator,
      obscureText: obscureText ?? false,
      cursorColor: cursorColor,
      keyboardType: keyboardType,
      readOnly: readOnly ?? false,
      controller: controller,
      style: style ??
          const TextStyle(
            color: Colors.black,
          ),
      decoration: decoration ??
          InputDecoration(
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: grey,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.greenAccent,
              ),
            ),
            contentPadding: const EdgeInsets.all(10.0),
            labelStyle: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            label: label,
            prefixIcon: prefixIcon,
            hintText: hintText,
            border: const OutlineInputBorder(),
          ),
    );
  }
}
