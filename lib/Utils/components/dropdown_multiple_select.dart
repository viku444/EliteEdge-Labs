import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:elite_edge_labs/Utils/const/color_const.dart';

class DropdownMultiplleSelect<T> extends StatefulWidget {
  final String? hintText;
  final List<T> selectedItems;
  final List<T> items;
  final void Function(List<T>)? onChanged;
  final String Function(T)? itemAsString;
  final PopupPropsMultiSelection<T>? popupProps;
  final String? Function(List<T>?)? validator;
  final AutovalidateMode? autoValidateMode;
  final ClearButtonProps clearButtonProps;
  final bool enabled;
  const DropdownMultiplleSelect({
    super.key,
    this.hintText,
    this.selectedItems = const [],
    this.items = const [],
    this.onChanged,
    this.itemAsString,
    this.popupProps,
    this.validator,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.enabled = true,
    this.clearButtonProps = const ClearButtonProps(),
  });

  @override
  State<DropdownMultiplleSelect<T>> createState() =>
      _DropdownMultiplleSelectState<T>();
}

class _DropdownMultiplleSelectState<T>
    extends State<DropdownMultiplleSelect<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>.multiSelection(
      clearButtonProps: widget.clearButtonProps,
      enabled: widget.enabled,
      autoValidateMode: widget.autoValidateMode,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: grey, fontSize: 14),
          hintMaxLines: 1,
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
      validator: widget.validator,
      popupProps: widget.popupProps ??
          PopupPropsMultiSelection.dialog(
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
      selectedItems: widget.selectedItems,
      items: widget.items,
      itemAsString: widget.itemAsString,
      onChanged: widget.onChanged,
    );
  }
}
