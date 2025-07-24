import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/utils/widgets/show_custom_snackbar.dart';
import 'package:task_app/features/auth_feature/domain/entities/sign_up_enitity.dart';
import 'package:task_app/features/auth_feature/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:task_app/features/auth_feature/presentation/pages/widget/custom_button.dart';
import 'package:task_app/features/auth_feature/presentation/pages/widget/sign_up_form.dart';
import 'package:task_app/features/home/presentation/pages/home_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 25),

          /// 🧾 الفورم
          SignUpForm(
            formKey: formKey,
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController,
          ),

          const SizedBox(height: 30),

          /// 🔁 الزر مع BlocConsumer
          BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                showCustomSnackBar(
                  context: context,
                  message: 'Account created successfully 🎉',
                  isSuccess: true,
                );
                Future.delayed(const Duration(seconds: 2), () {
                  if (context.mounted) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  }
                });
                // Navigate or delay as needed
              } else if (state is SignUpFailure) {
                showCustomSnackBar(
                  context: context,
                  message: state.error,
                  isSuccess: false,
                );
              }
            },
            builder: (context, state) {
              final isLoading = state is SignUpLoading;

              return CustomButton(
                buttonText: isLoading ? 'Loading...' : "Sign Up",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final user = SignUpEnitity(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    context.read<SignUpCubit>().signUp(user);
                  }
                },
              );
            },
          ),

          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
