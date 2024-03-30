import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_management/app/core/widgets/custom_button.dart';
import 'package:school_management/app/core/widgets/custom_text_field.dart';
import 'package:school_management/app/modules/sing_up/sing_up_controller.dart';
import 'package:school_management/app/routes/sing_in_routes.dart';
import 'package:school_management/app/routes/sing_up_routes.dart';

class SingUpPage extends GetView<SingUpController> {
  const SingUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Icon(
                  Icons.school_outlined,
                  size: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const Gap(10),
                Text(
                  "Sing Up",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            Form(
              key: controller.forky,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextFromField(
                    hintText: "User ID or Email",
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "User ID or Email can't be empty";
                      }
                      return null;
                    },
                  ),
                  const Gap(5),
                  Obx(() => CustomTextFromField(
                        controller: controller.passwordController,
                        hintText: "Password",
                        obscureText: controller.passwordValidator.value,
                        textInputAction: TextInputAction.done,
                        suffixIcon: IconButton(
                          onPressed: () => controller.setPasswordValidator(),
                          icon: Icon(
                            controller.passwordValidator == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Password can't be empty";
                          }
                          return null;
                        },
                      )),
                  const Gap(10),
                  CustomButton(
                    text: "Sign Up",
                    onTap: () => controller.singUp(),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do have an account?",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                InkWell(
                  onTap: () => controller.singIn(),
                  child: Text(
                    "SingIn",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
