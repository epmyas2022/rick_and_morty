import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? onSubmitted;

  const CustomTextField({super.key, this.onSubmitted});
  @override
  Widget build(BuildContext context) {
    final focus = FocusNode();
    return SizedBox(
      height: 60,
      child: TextField(
        onTapOutside: (event) => focus.unfocus(),
        onSubmitted: onSubmitted,
        focusNode: focus,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            hintText: 'Search for character',
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: Colors.grey[500],
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[500]),
            fillColor: Colors.white),
      ),
    );
  }
}
