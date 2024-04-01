import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_management/app/core/widgets/custom_button.dart';
import 'package:school_management/app/core/widgets/custom_text_field.dart';
import 'package:school_management/app/modules/sing_up/sing_up_controller.dart';

class SingUpPage extends GetView<SingUpController> {
  const SingUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.school_outlined,
                    size: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Gap(10),
                  Text(
                    textAlign: TextAlign.center,
                    "School Management System \n Sing Up",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const Gap(10),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  controller.pickedImage == null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          //backgroundImage:
                          // AssetImage("assets/images/profile.png"),
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          backgroundImage: FileImage(controller.pickedImage!),
                        ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        _showDialog(context);
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Form(
                key: controller.forky,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextFromField(
                      controller: controller.nameController,
                      hintText: "Full Name",
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Full name can't be empty";
                        }
                        return null;
                      },
                    ),
                    const Gap(5),
                    CustomTextFromField(
                      controller: controller.jobTitleController,
                      hintText: "Job Title",
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Job title can't be empty";
                        }
                        return null;
                      },
                    ),
                    const Gap(5),
                    CustomTextFromField(
                      controller: controller.phoneController,
                      hintText: "Phone Number",
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Phone Number can't be empty";
                        }
                        return null;
                      },
                    ),
                    const Gap(5),
                    CustomTextFromField(
                      controller: controller.emailController,
                      hintText: "Email",
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Email can't be empty";
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
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AboutDialog(
          applicationName: "School Management",
          applicationIcon: const Icon(
            Icons.school_outlined,
          ),
          children: [
            InkWell(
                onTap: () {
                  controller.cameraPickImage();
                  Navigator.pop(context);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.camera_alt,
                  ),
                  title: Text("Camera"),
                )),
            InkWell(
              onTap: () async {
                await controller.galleryPickImage();
                Navigator.pop(context);
              },
              child: const ListTile(
                leading: Icon(
                  Icons.image,
                ),
                title: Text("Gallery"),
              ),
            ),
          ],
        );
      },
    );
  }
}
