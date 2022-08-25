import 'package:currency_app/theme/paths/icons_path.dart';
import 'package:currency_app/theme/styles/colors.dart';
import 'package:currency_app/theme/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/app.g.dart';
import '../../../../theme/paths/routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPassword = true;
   String? dataField;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _title(),
                _registerFields(),
                _termsAndServices(),
                SizedBox(height: 24.0,),
                _signUpButton(),
                _loginBack()
              ],
            ),
          ),
        ),
      ),
    );
  }
  AppBar _appBar (){
    return AppBar(
      backgroundColor: ColorManger.whiteColor,
      elevation: 0,
      centerTitle: true,
      title: Center(
        child:
        Transform.translate(
          offset: Offset(-25,0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(IconManger.fastIcon),
                Text("Exchangely",style: TextModelStyle.primary20BoldStyle(),)
              ]),
        ),
      ),
    );
  }
  Widget _title(){
    return
      Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Create your account",style: TextModelStyle.blackColor20BoldStyle(),),
          SizedBox(height: 8.0,),
          Text("Sell and buy currency with easy",style: TextModelStyle.greyColor312BoldStyle(),),
        ],
    ),
      );
  }
  Widget  _loginBack(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account ?",style: TextModelStyle.greyColor314BoldStyle(),),
        TextButton(onPressed: (){
          Navigator.pushNamed(context, Routes.login);
        }, child: Text("Login",style: TextModelStyle.primary14BoldStyle(),))

      ],
    );
  }

  Widget _termsAndServices(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child:
      Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style:  TextModelStyle.greyColor312BoldStyle(),
            text: "By Signing up you accept the",
            children: [
            TextSpan(text: "Terms of Service", style: TextModelStyle.primary12BoldStyle(),),
            TextSpan(text: " And",style:  TextModelStyle.greyColor312BoldStyle()),
            TextSpan(text: " Privacy Policy",style: TextModelStyle.primary12BoldStyle()),
            ]
          ),


        ),
      ),
    );
  }
  Widget _signUpButton(){
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 18.0),
        height: 45.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManger.primary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: MaterialButton(
          onPressed: (){
            Navigator.pushNamed(context, Routes.verificationPage);
          },
          child: Text("Sign Up",style: TextModelStyle.blackColor14BoldStyle(),),
        )
    );

  }


  Widget _registerFields(){
return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(height: 40.0,),
    _commonField(
      dataField: me!.fullName,
      title: "Full Name",
    ),
    SizedBox(height: 12.0,),
    _commonField(
      dataField: me!.email,
      title: "Email",
    ),
    SizedBox(height: 12.0,),
    _commonField(
      dataField: me!.phone,
      title: "Phone",
    ),
    SizedBox(height: 12.0,),
    _commonField(
      dataField: me!.bvn,
      title: "BVN",
    ),
    SizedBox(height: 12.0,),
    _commonField(
      dataField: me!.password,
      title: "Password",
      isPassword: true
    ),
    SizedBox(height: 12.0,)
  ],
);
  }
  Widget _commonField({required String? dataField,
  bool isPassword = false,
    required String title
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextModelStyle.greyColor314BoldStyle(),),
        TextFormField(
          onChanged: (value) {
            dataField = value;
            print("dataField = $dataField");
          },
          obscureText: isPassword? showPassword? true : false : false,
          decoration: InputDecoration(
            fillColor: ColorManger.whiteColor2,
            filled: true,
            hintText: "",
            border: outBoard,
            focusedBorder: outBoard,
            enabledBorder: outBoard,
            errorBorder: outBoard,
            disabledBorder: outBoard,
            suffixIcon: isPassword? IconButton(onPressed: (){
              setState(() {
                showPassword = !showPassword;
              });
            }, icon: Icon(showPassword ?Icons.visibility : Icons.visibility_off)):null
          ),
        ),
      ],
    );
  }

}
