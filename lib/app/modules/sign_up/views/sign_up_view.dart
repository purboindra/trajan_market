import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trajan_market/app/modules/profile/controllers/profile_controller.dart';
import 'package:trajan_market/app/routes/app_pages.dart';

import 'package:trajan_market/app/services/dimensions.dart';
import 'package:trajan_market/app/services/theme.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  final profileC = Get.put(ProfileController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.w20,
        ),
        child: SafeArea(
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.h30,
                  ),
                  Text(
                    "Create Account",
                    style: headingStyle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.h20,
                  ),
                  _emailField(),
                  SizedBox(
                    height: Dimensions.h20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _firstNameField(),
                      ),
                      SizedBox(
                        width: Dimensions.w20,
                      ),
                      Expanded(
                        child: _lastNameField(),
                      ),
                    ],
                  ),
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
                            value: (controller.termsAndCondition.value),
                            onChanged: (value) {
                              controller.onChangeCheckBox(value!);
                            },
                          )),
                      SizedBox(
                        width: Dimensions.w10,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "I agree to the",
                                style: subTitleStyle,
                              ),
                              TextSpan(
                                text: " ",
                                style: subTitleStyle,
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: "Terms & Condition and Privacy Policy",
                                style: subTitleStyle.copyWith(
                                  color: Color(0xff3960dc),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.h30,
                  ),
                  Obx(() => ElevatedButton(
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
                          controller.createUser(
                            controller.emailController.text,
                            controller.passwordController.text,
                          );
                        },
                        child: controller.loading.isFalse
                            ? Text(
                                "Create Account",
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
                      )),
                  SizedBox(
                    height: Dimensions.h20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          indent: 20,
                          // endIndent: 20,
                          thickness: 1,
                          color: greyColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.w10,
                      ),
                      Text(
                        "Or",
                        style: titleStyle.copyWith(color: darkHeader),
                      ),
                      SizedBox(
                        width: Dimensions.w10,
                      ),
                      Expanded(
                        child: Divider(
                          // indent: 20,
                          endIndent: 20,
                          thickness: 1,
                          color: greyColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.h20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            // primary: Color(0xff3960dc),
                            fixedSize: Size(
                              Get.width,
                              Dimensions.h30 * 2.2,
                            ),
                            side: BorderSide(
                              width: 2,
                              color: Color(0xff3960dc),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                Dimensions.w15,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.w20,
                              vertical: Dimensions.h15,
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/logo_gmail.png",
                                width: Dimensions.w30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.w20,
                      ),
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            // primary: Color(0xff3960dc),
                            fixedSize: Size(
                              Get.width,
                              Dimensions.h30 * 2.2,
                            ),
                            side: BorderSide(
                              width: 2,
                              color: Color(0xff3960dc),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                Dimensions.w15,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.w20,
                              vertical: Dimensions.h15,
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.phone_solid,
                                size: Dimensions.w30,
                                color: Color(0xff3960dc),
                              ),
                              SizedBox(
                                width: Dimensions.w10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.h30,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account?",
                          style: titleStyle.copyWith(
                            color: Color(0xffa7b2d1),
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.offAndToNamed(Routes.SIGN_IN);
                            },
                          text: " Sign in",
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
            hintText: "Your email",
            prefixIcon: Icon(
              CupertinoIcons.mail,
            ),
            filled: false,
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

  Column _firstNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "First Name",
          style: titleStyle.copyWith(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: Dimensions.h5,
        ),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return ("First name can\'t b empty");
            }
            if (!GetUtils.isUsername(value)) {
              return ("Please enter valid first name");
            }
            return null;
          },
          autofocus: false,
          autocorrect: false,
          onSaved: (value) {
            controller.firstNameController.text = value!;
          },
          controller: controller.firstNameController,
          decoration: InputDecoration(
            hintText: "First name",
            prefixIcon: Icon(
              CupertinoIcons.person,
            ),
            filled: false,
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

  Column _lastNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Last Name",
          style: titleStyle.copyWith(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: Dimensions.h5,
        ),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return ("Last name can\'t b empty");
            }
            if (!GetUtils.isUsername(value)) {
              return ("Please enter valid last name");
            }
            return null;
          },
          autofocus: false,
          autocorrect: false,
          onSaved: (value) {
            controller.lastNameController.text = value!;
          },
          controller: controller.lastNameController,
          decoration: InputDecoration(
            hintText: "Last name",
            prefixIcon: Icon(
              CupertinoIcons.person,
            ),
            filled: false,
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
          "Your Password",
          style: titleStyle.copyWith(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: Dimensions.h5,
        ),
        Obx(() => TextFormField(
              validator: (value) {
                RegExp regExp = RegExp(r'^.{6,}$');
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
                hintText: "Your password",
                prefixIcon: Icon(
                  CupertinoIcons.lock,
                ),
                iconColor: Colors.white,
                suffixIcon: InkWell(
                  onTap: () {
                    controller.obsecureText.toggle();
                  },
                  child: Icon(
                    controller.obsecureText.isTrue
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                    color: greyColor,
                  ),
                ),
                filled: false,
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
            )),
      ],
    );
  }
}
