import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:task/constants/colors.dart';
import 'package:task/providers/authentication_provider.dart';
import 'package:task/screens/bottom_bar.dart';
import 'package:task/screens/home_screen.dart';
import 'package:task/screens/login_screen.dart';
import 'package:task/utils/text_styles.dart';
import 'package:task/widgets/snackbar.dart';
import 'package:task/widgets/text_form_field.dart';
import 'package:task/widgets/widget_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(builder: (context, provider, _) {
      return ModalProgressHUD(
        inAsyncCall: provider.isLoading,
        progressIndicator: CircularProgressIndicator(
          color: primaryColor,
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Container(
                    height: 400.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/ellemora_logo.jpg")),
                    ),
                  ),
                  SizedBox(
                      height: 60.h,
                      child: CustomTextFormField(
                          context, "Name", _nameController,
                          height: 40.h)),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 60.h,
                    child: CustomTextFormField(
                        context, "Email", _emailController,
                        height: 40.h),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 60.h,
                    child: CustomTextFormField(
                        context, "Password", _passwordController,
                        height: 40.h),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      String result = await provider.signupUser(
                          _emailController.text,
                          _passwordController.text,
                          _nameController.text);
                      if (result == "success") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomBar(initialIndex: 0,)));
                      } else {
                        showCustomSnackBar(context, result);
                      }
                    },
                    child: custombutton('SignUp'),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: normalTextStyle,
                        ),
                        TextSpan(
                          text: 'Login',
                          style: normalBlueTextStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
