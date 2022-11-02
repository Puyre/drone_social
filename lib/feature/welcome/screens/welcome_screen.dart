import 'dart:math';

import 'package:drone_assist/feature/auth/widgets/sign_in_widget.dart';
import 'package:drone_assist/feature/auth/widgets/sign_up_widget.dart';
import 'package:drone_assist/feature/welcome/widgets/beer_background_painter.dart';
import 'package:drone_assist/feature/welcome/widgets/beer_background_widget.dart';
import 'package:drone_assist/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController = TabController(
    length: 2,
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BeerBackgroundWidget(),
            LayoutBuilder(
              builder: (context, constraints) {
                return Center(
                  child: SizedBox(
                    height: 360,
                    width: min(350, constraints.maxWidth),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Column(
                          children: [
                            const SizedBox(height: 22),
                            const Text(
                              "Welcome",
                              style: TextStyle(fontSize: 28, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            TabBar(
                              indicatorColor: Colors.amber,
                              controller: tabController,
                              tabs: [
                                Tab(text: LocaleKeys.auth_signIn.tr()),
                                Tab(text: LocaleKeys.auth_signUp.tr()),
                              ],
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              height: 220,
                              child: TabBarView(
                                controller: tabController,
                                children: const [
                                  SignInWidget(),
                                  SignUpWidget(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
