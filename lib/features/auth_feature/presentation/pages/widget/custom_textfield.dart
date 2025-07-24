import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextEditingController controller;
  final bool isObscure;
  final String? Function(String?)? validator; // ✅ جديد
  final Widget? suffixicon;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.hint,
    required this.controller,
    this.isObscure = false,
    this.validator,
    this.suffixicon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        
        validator: validator, // ✅ استخدم الفاليديشن
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          suffixIcon: suffixicon,
          prefixIcon: Icon(icon),
          label: Text(hint),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
