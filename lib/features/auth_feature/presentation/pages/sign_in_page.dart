import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/utils/widgets/show_custom_snackbar.dart';
import 'package:task_app/features/auth_feature/presentation/manager/login_cubit/signin_cubit.dart';
import 'package:task_app/features/auth_feature/presentation/pages/widget/custom_button.dart';
import 'package:task_app/features/auth_feature/presentation/pages/widget/sign_in_form.dart';
import 'package:task_app/features/home/presentation/pages/home_page.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),

        // ✅ الفورم فقط
        SignInForm(
          formKey: _formKey,
          emailController: emailController,
          passwordController: passwordController,
        ),

        const SizedBox(height: 30),

        // ✅ الزر + BlocConsumer
        BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state is SigninSuccess) {
              showCustomSnackBar(
                context: context,
                message: 'ٍSignin Successfully ✅',
                isSuccess: true,
              );
              Future.delayed(const Duration(seconds: 2), () {
                if (context.mounted) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                }
              });
            } else if (state is SigninFailure) {
              showCustomSnackBar(
                context: context,
                message: state.errMessage,
                isSuccess: false,
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is SigninLoading;

            return CustomButton(
              buttonText: isLoading ? 'Loading...' : "Sign in",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();

                  // ✅ استدعاء الكيوبت هنا فقط
                  BlocProvider.of<SigninCubit>(
                    context,
                  ).signIn({'email': email, 'password': password});
                }
              },
            );
          },
        ),

        const SizedBox(height: 80),
      ],
    );
  }
}
