import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trajan_market/app/model/user_model.dart';
import 'package:trajan_market/app/modules/home/controllers/home_controller.dart';
import 'package:trajan_market/app/modules/profile/controllers/profile_controller.dart';
import 'package:trajan_market/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:trajan_market/app/routes/app_pages.dart';
import 'package:trajan_market/app/services/app_constant.dart';
import 'package:trajan_market/app/services/dimensions.dart';
import 'package:trajan_market/app/services/theme.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  final profileC = Get.put(ProfileController());
  RegExp regExp = RegExp(r'^.{6,}$');
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    if (box.read("sign_in") != null) {
      print("HAS DATA");
    } else {
      print("NOTHING");
    }
    Get.put(HomeController());
    Get.put(SignUpController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.w20,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.h30,
                  ),
                  Text(
                    "Hello, Welcome Back!",
                    style: subHeadingStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.h10,
                  ),
                  Text(
                    "Hello again, you\'ve been missed!",
                    style: titleStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      color: greyColor,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.h30,
                  ),
                  _emailField(),
                  SizedBox(
                    height: Dimensions.h20,
                  ),
                  _passwordField(),
                  SizedBox(
                    height: Dimensions.h30,
                  ),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            value: (controller.remember.value),
                            onChanged: (value) {
                              controller.rememberMe(value!);
                            },
                          )),
                      SizedBox(
                        width: Dimensions.w10,
                      ),
                      Expanded(
                        child: Text(
                          "Remember Me",
                          style: titleStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.h30,
                  ),
                  Obx(
                    () => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff3960dc),
                          fixedSize: Size(
                            Get.width,
                            Dimensions.h30 * 2.2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Dimensions.w15,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.w20,
                            vertical: Dimensions.h15,
                          )),
                      onPressed: () {
                        // final box = GetStorage();
                        // box.remove(AppConstant.SIGN_UP_USER);
                        controller.signInUser(controller.emailController.text,
                            controller.passwordController.text);

                        final box = GetStorage();
                        if (controller.remember.value == true) {
                          box.write(
                            AppConstant.SIGN_IN_USER,
                            controller.emailController.text,
                          );
                        }
                      },
                      child: controller.loading.isFalse
                          ? Text(
                              "Sign in",
                              style: titleStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.h30,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Dont\'t have an account?",
                          style: titleStyle.copyWith(
                            color: lightGrey,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(Routes.SIGN_UP);
                            },
                          text: " Sign up",
                          style: titleStyle.copyWith(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3960dc),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email Address",
          style: titleStyle.copyWith(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: Dimensions.h5,
        ),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return ("Please enter your email");
            }
            if (!GetUtils.isEmail(value)) {
              return ("Please enter valid email");
            }
            return null;
          },
          autofocus: false,
          autocorrect: false,
          onSaved: (value) {
            controller.emailController.text = value!;
          },
          controller: controller.emailController,
          decoration: InputDecoration(
            hintText: "Enter your email",
            filled: false,
            prefixIcon: Icon(
              CupertinoIcons.mail,
            ),
            fillColor: Color(0xffe5edfc),
            focusColor: Color(0xffe5edfc),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(
                Dimensions.w15,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: titleStyle.copyWith(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: Dimensions.h5,
        ),
        Obx(() => TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return ("You have to added password");
                }
                if (!regExp.hasMatch(value)) {
                  return ("Please enter valid password (Min. 6 characters)");
                }
                return null;
              },
              autofocus: false,
              autocorrect: false,
              onSaved: (value) {
                controller.passwordController.text = value!;
              },
              controller: controller.passwordController,
              obscureText: controller.obsecureText.value,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  CupertinoIcons.lock,
                ),
                hintText: "Enter your password",
                iconColor: Colors.white,
                suffixIcon: InkWell(
                  onTap: () {
                    controller.obsecureText.toggle();
                  },
                  child: Icon(
                    controller.obsecureText.isTrue
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                    color: darkGrey,
                  ),
                ),
                filled: false,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(
                    Dimensions.w15,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
