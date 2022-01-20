import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  List<T>? items;
  TextStyle? textStyle;
  Icon? icon;
  String? label;
  String? labelSearch;
  Function(T)? onChange;
  T? selectedItem;
  String? insertText;
  Function? itemAsString;
  Function? validation;
  bool? showSearchBox;
  double? myWidth;

  CustomDropdown({
    Key? key,
    this.items,
    this.textStyle,
    this.icon,
    this.label,
    this.onChange,
    this.selectedItem,
    this.insertText,
    this.itemAsString,
    this.validation,
    this.showSearchBox,
    this.myWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      showSelectedItems: true,
      items: items,
      selectedItem: selectedItem!,
      showSearchBox: showSearchBox!,
      mode: Mode.BOTTOM_SHEET,
      compareFn: (i, s) => i == s,
      dropdownSearchDecoration: InputDecoration(
        // labelText: label!,
        hintText: label!,
        contentPadding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
        border: const OutlineInputBorder(),
        isDense: true,
      ),
      itemAsString: (data) {
        return itemAsString!(data!);
      },
      onChanged: (data) {
        onChange!(data!);
      },
      // validator: (value) => validation!(value),
    );
  }
}
