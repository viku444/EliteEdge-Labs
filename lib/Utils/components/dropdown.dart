import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:elite_edge_labs/Utils/const/color_const.dart';

// ignore: must_be_immutable
class DropdownView<T> extends StatefulWidget {
  DropdownView(
      {super.key,
      this.hintText,
      required this.items,
      required this.itemAsString,
      required this.onChanged,
      this.validator,
      this.hintTextName,
      this.selectedItem,
      this.popupProps});

  final String? hintText;
  final String? hintTextName;
  final List<T> items;
  final PopupProps<T>? popupProps;
  final T? selectedItem;
  final String Function(T)? itemAsString;
  final String? Function(T? value)? validator;
  void Function(T? value)? onChanged;
  @override
  State<DropdownView<T>> createState() => _DropdownViewState<T>();
}

class _DropdownViewState<T> extends State<DropdownView<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      popupProps: widget.popupProps ??
          PopupProps.dialog(
            fit: FlexFit.loose,
            showSelectedItems: false,
            showSearchBox: true,
            searchFieldProps: TextFieldProps(
              maxLines: 1,
              style: TextStyle(color: black),
              decoration: InputDecoration(
                hintText: widget.hintText,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
              ),
              cursorColor: Colors.blue,
            ),
          ),
      // selectedItem: selectedClient.clientCompany,
      onChanged: widget.onChanged,
      selectedItem: widget.selectedItem,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      dropdownButtonProps: DropdownButtonProps(
        color: black,
      ),
      items: widget.items,
      itemAsString: widget.itemAsString,
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: TextStyle(
          color: black,
          fontSize: 14,
        ),
        dropdownSearchDecoration: InputDecoration(
          label: Text(
            widget.hintTextName ?? "Search",
            style: TextStyle(
              fontSize: 14,
              color: grey,
            ),
          ),
          hintMaxLines: 1,
          // iconColor: color,
          // labelStyle: TextStyle(color: grey),
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
          contentPadding: const EdgeInsets.all(10),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
