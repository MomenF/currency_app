import 'package:currency_app/theme/paths/icons_path.dart';
import 'package:currency_app/theme/styles/colors.dart';
import 'package:currency_app/theme/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/app.g.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  bool showPassword = true;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _title(),
              _loginFields(),
              SizedBox(height: 24.0,),
              _loginButton(),
            _signUpBack()
            ],
          )),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 18.0),
        height: 45.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManger.primary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: MaterialButton(
          onPressed: () {},
          child: Text(
            "Login",
            style: TextModelStyle.blackColor14BoldStyle(),
          ),
        ));
  }
  Widget  _signUpBack(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't Have an account ?",style: TextModelStyle.greyColor314BoldStyle(),),
        TextButton(onPressed: (){}, child: Text("Sign Up",style: TextModelStyle.primary14BoldStyle(),))
        
      ],
    );
  }


  Widget _title() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Welcome Back",
              style: TextModelStyle.blackColor20BoldStyle(),
            ),
            Image.asset(IconManger.handsIcon)
          ],
        ),
        SizedBox(
          height: 24.0,
        ),
        Text(
          "Kindly login to your account  to continue with your transaction",
          style: TextModelStyle.black2Color14MediumStyle(),
        )
      ],
    );
  }

  Widget _loginFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24.0,
        ),
        Text(
          "Email",
          style: TextModelStyle.greyColor314BoldStyle(),
        ),
        _emailField(),
        SizedBox(
          height: 12.0,
        ),
        Text(
          "Password",
          style: TextModelStyle.greyColor314BoldStyle(),
        ),
        _passwordField(),
        _forgetPassword()
      ],
    );
  }

  Widget _emailField() {
    return TextFormField(
      onChanged: (value) {
        email = value;
      },
      decoration: InputDecoration(
        fillColor: ColorManger.whiteColor2,
        filled: true,
        hintText: "",
        border: outBoard,
        focusedBorder: outBoard,
        enabledBorder: outBoard,
        errorBorder: outBoard,
        disabledBorder: outBoard,
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      onChanged: (value) {
        password = value;
      },
      obscureText: showPassword,
      decoration: InputDecoration(
          fillColor: ColorManger.whiteColor2,
          filled: true,
          hintText: "",
          border: outBoard,
          focusedBorder: outBoard,
          enabledBorder: outBoard,
          errorBorder: outBoard,
          disabledBorder: outBoard,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off))),
    );
  }

  Widget _forgetPassword() {
    return Row(
      children: [
        Spacer(),
        TextButton(
            onPressed: () {},
            child: Text(
              "Forget Password",
              style: TextModelStyle.primary14BoldStyle(),
            )),
      ],
    );
  }
}
