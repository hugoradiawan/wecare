import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecare/UIs/home_page/components/border_button.dart';
import 'package:wecare/UIs/home_page/components/home_page_button.dart';
import 'package:wecare/UIs/home_page/components/home_title.dart';
import 'package:wecare/UIs/home_page/components/static_data.dart';
import 'package:wecare/business_logics/auth_controller.dart';

class HomePage extends GetView<AuthController> {
  const HomePage({super.key});

  @override
  Widget build(_) => Scaffold(
        body: SafeArea(
          child: Column(children: [
            Expanded(
              child: Row(children: [
                const Spacer(),
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                    child: const Text(
                      'Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 3),
                const Expanded(
                  flex: 2,
                  child: HomePageButton(icon: Icons.settings),
                ),
                const Expanded(
                  flex: 2,
                  child: HomePageButton(icon: Icons.menu),
                ),
                const Spacer(),
              ]),
            ),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                height: Get.width * 0.7,
                width: Get.width * 0.7,
                child: Stack(children: [
                  CircleAvatar(
                    radius: Get.width * 0.17,
                    backgroundImage: NetworkImage(
                      controller.currentUser.value?.photoURL ?? '',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Get.theme.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.edit),
                    ),
                  ),
                ]),
              ),
            ),
            Expanded(
              child: Text(
                controller.currentUser.value?.displayName ?? '',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: const [
                  StaticData('Fundraising', 12),
                  StaticData('Followers', 487),
                  StaticData('Following', 126),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.all(26),
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.background,
                  border: Border.all(
                    color: Get.theme.colorScheme.outline.withAlpha(50),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: HomePageButton(
                          icon: Icons.add,
                          circleShaped: true,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '\$349',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Text('My wallet balance'),
                          ]),
                    ),
                    const Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: BorderButton('Top up'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const HomeTitle(title: 'About'),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: Get.width * 0.85,
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                ),
              ),
            ),
            const HomeTitle(title: 'Interest', icon: Icons.edit),
            Expanded(
              flex: 2,
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  'Medical',
                  'Education',
                  'Environment',
                  'Animal',
                  'Children',
                  'Environment'
                ].map((e) => BorderButton(e)).toList(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    children: [
                          Icons.home,
                          Icons.calendar_month,
                          Icons.menu,
                          Icons.message,
                        ]
                            .map(
                              (icon) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: HomePageButton(icon: icon),
                                ),
                              ),
                            )
                            .toList() +
                        [
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: HomePageButton(
                                icon: Icons.person,
                                isSelected: true,
                              ),
                            ),
                          )
                        ]),
              ),
            ),
          ]),
        ),
      );
}
