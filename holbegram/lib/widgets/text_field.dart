import 'package:flutter/material.dart';

class TextFieldInput extends StatefulWidget {
  final TextEditingController controller;
  final bool ispassword;
  final String hintText;
  final TextInputType keyboardType;

  const TextFieldInput({
    super.key,
    required this.controller,
    this.ispassword = false,
    required this.hintText,
    required this.keyboardType,
  });

  @override
  TextFieldInputState createState() => TextFieldInputState();
}

class TextFieldInputState extends State<TextFieldInput> {
  late bool _isHidden;

  @override
  void initState() {
    super.initState();
    _isHidden = widget.ispassword;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      cursorColor: const Color.fromARGB(218, 226, 37, 24),
      decoration: InputDecoration(
          hintText: widget.hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          filled: true,
          contentPadding: const EdgeInsets.all(8),
          // Change suffixIcon to manage the visibility icon
          suffixIcon: widget.ispassword
              ? IconButton(
                  icon:
                      Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
                  onPressed: _togglePasswordVisibility,
                )
              : null),
      textInputAction: TextInputAction.next,
      obscureText: _isHidden,
    );
  }
}
