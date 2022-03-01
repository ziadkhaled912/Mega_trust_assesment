import 'package:flutter/material.dart';

class DefaultDropDown extends StatelessWidget {
  const DefaultDropDown({
    Key? key,
    this.label,
    required this.onChanged,
    required this.validator,
    this.hint,
    required this.items,
    this.values,
    this.selectedValue,
    this.isLoading = false,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final String? selectedValue;
  final Function onChanged;
  final String? Function(String?) validator;
  final List<String> items;
  final List<String>? values;
  final bool isLoading;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      isDense: false,
      dropdownColor: Colors.white,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        fillColor: backgroundColor,
        filled: true,
      ),
      value: selectedValue,
      validator: validator,
      onChanged: (newValue) {
        FocusScope.of(context).requestFocus(FocusNode());
        onChanged(newValue);
      },
      icon: isLoading ? const SizedBox(
          width: 20,
          height: 20, child: CircularProgressIndicator()) : null,
      items: List.generate(
        items.length,
            (index) => DropdownMenuItem(
          value: values != null
              ? values![index] : items[index],
          child: Text(items[index]),
        ),
      ),
    );
  }
}
