import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'welcome_controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WelcomePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WelcomePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
