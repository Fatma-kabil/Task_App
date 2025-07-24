import 'package:flutter/material.dart';
import 'package:task_app/features/auth_feature/presentation/pages/widget/custom_textfield.dart';

class SignUpForm extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const SignUpForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
   bool _isPasswordObscured = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key:widget.formKey ,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              controller: widget.nameController,
              icon: Icons.person_outline,
              hint: "Name",
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
             CustomTextField(
              controller: widget.emailController,
              icon: Icons.email_outlined,
              hint: "Email",
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Email is required';
                } else if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                ).hasMatch(value)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: widget.passwordController,
              icon: Icons.lock_outline,
              hint: "Password",
      
              isObscure: _isPasswordObscured,
              suffixicon: IconButton(
                icon: Icon(
                  _isPasswordObscured ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordObscured = !_isPasswordObscured;
                  });
                },
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Password is required';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
