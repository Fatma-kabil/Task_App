
import 'package:flutter/material.dart';
import 'package:task_app/features/auth_feature/data/repos/auth_repo_impl.dart';
import 'package:task_app/features/auth_feature/presentation/manager/login_cubit/signin_cubit.dart';
import 'package:task_app/features/auth_feature/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:task_app/features/auth_feature/presentation/pages/welcome_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(create: (context) => SignUpCubit(AuthRepoImpl())),
          BlocProvider(create: (context) => SigninCubit(AuthRepoImpl())),
      ],
      
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
      ),
    );
  }
}