import 'package:flutter/material.dart';
import 'package:task_app/features/auth_feature/presentation/pages/sign_in_page.dart';
import 'package:task_app/features/auth_feature/presentation/pages/sign_up_page.dart';
import 'package:task_app/features/auth_feature/presentation/pages/widget/custom_background.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomBackground(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TabBar(
                dividerColor: Colors.transparent,
                controller: tabController,
                unselectedLabelColor: Colors.white,
                labelColor: Colors.black,
                tabs: [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('Sign In', style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('Sign Up', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [SigninPage(), SignUpPage()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
