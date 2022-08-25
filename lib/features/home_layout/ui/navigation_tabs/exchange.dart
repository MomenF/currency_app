import 'package:currency_app/theme/paths/icons_path.dart';
import 'package:currency_app/theme/styles/colors.dart';
import 'package:currency_app/theme/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../core/app.g.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({Key? key}) : super(key: key);

  @override
  _ExchangePageState createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  List<Map<String, dynamic>> USD_list = [
    {"NP": "USD", "icon": IconManger.USD_Icon},
    {"NP": "EUR", "icon": IconManger.EUR_Icon},
    {"NP": "GBP", "icon": IconManger.GBP_Icon},
  ];
  List<Map<String, dynamic>> USD_list_Wanted = [
    {"NP": "USD", "icon": IconManger.USD_Icon},
    {"NP": "EUR", "icon": IconManger.EUR_Icon},
    {"NP": "GBP", "icon": IconManger.GBP_Icon},
  ];
  Map<String, dynamic>? currentValue;
  Map<String, dynamic>? currentValueWanted;
  String? amountData;
  String? amountDataWanted;
  String userNumber = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _appBar(),
          _bodyExchangeContent(),
          Divider(
            height: 10.0,
            thickness: 10.0,
            color: ColorManger.whiteColor2,
          ),
          _dropDetails()
        ],
      ),
    );
  }

  Widget dropFieldsDetails({
    required String title,
     required String dataField,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextModelStyle.greyColor314BoldStyle(),
        ),
        TextFormField(
          onChanged: (value) {
            dataField = value;
            print("dataField = $dataField");
          },
          decoration: InputDecoration(
            fillColor: ColorManger.whiteColor2,
            filled: true,
            hintText: hint,
            border: outBoard,
            focusedBorder: outBoard,
            enabledBorder: outBoard,
            errorBorder: outBoard,
            disabledBorder: outBoard,
          ),
        ),
      ],
    );
  }

  Widget _dropDetails() {
    return Container(
        padding: const EdgeInsets.all(32.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Drop Your account Details",
            style: TextModelStyle.blackColor16BoldStyle(),
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            "NP : you will be credited into this account",
            style: TextModelStyle.greyColor312BoldStyle(),
          ),
          SizedBox(
            height: 24.0,
          ),
          dropFieldsDetails(
              dataField: userNumber,
              title: "Naira Account Number",
              hint: "Add Your 10 Digits")
        ],
    ),
      );
  }

  Widget _bodyExchangeContent() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _haveBalance(),
            SizedBox(
              height: 16.0,
            ),
            _sendRate(),
            SizedBox(
              height: 24.0,
            ),
            _wantBalance(),
            SizedBox(
              height: 24.0,
            ),
            _willGet(),
          ],
        ),
      ),
    );
  }

  Widget _willGet() {
    return Center(
      child: Column(
        children: [
          Text(
            "You Will Get",
            style: TextModelStyle.blackColor14BoldStyle(),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "00:00",
            style: TextModelStyle.greyColor312BoldStyle(),
          )
        ],
      ),
    );
  }

  Widget _sendRate() {
    return Row(
      children: [
        Icon(
          Icons.error_outlined,
          color: ColorManger.lightGreen,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          "Send Rate : 560",
          style: TextModelStyle.lightGreen12BoldStyle(),
        )
      ],
    );
  }

  Widget _haveBalance() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "I have",
                style: TextModelStyle.blackColor14BoldStyle(),
              ),
              _dropDownBtn()
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("amount", style: TextModelStyle.blackColor14BoldStyle()),
              _fieldData(dataField: amountData)
            ],
          ),
        ),
      ],
    );
  }

  Widget _wantBalance() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("I Want", style: TextModelStyle.blackColor14BoldStyle()),
              _dropDownBtnWanted()
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("amount", style: TextModelStyle.blackColor14BoldStyle()),
              _fieldDataWanted(dataField: amountDataWanted)
            ],
          ),
        ),
      ],
    );
  }

  Widget _fieldData({
    required String? dataField,
  }) {
    return Container(
      height: 35.0,
      child: TextFormField(
        onChanged: (value) {
          dataField = value;
          print("dataField = $dataField");
        },
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
            fillColor: ColorManger.whiteColor2,
            filled: true,
            hintText: "Amount",
            border: outBoard,
            focusedBorder: outBoard,
            enabledBorder: outBoard,
            errorBorder: outBoard,
            disabledBorder: outBoard,
            prefixIcon: Transform.translate(
                offset: Offset(15, 10),
                child: Text(
                  "\$",
                ))),
      ),
    );
  }

  Widget _fieldDataWanted({
    required String? dataField,
  }) {
    return Container(
      height: 35.0,
      child: TextFormField(
        onChanged: (value) {
          dataField = value;
          print("dataField = $dataField");
        },
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
            fillColor: ColorManger.whiteColor2,
            filled: true,
            hintText: "Amount",
            border: outBoard,
            focusedBorder: outBoard,
            enabledBorder: outBoard,
            errorBorder: outBoard,
            disabledBorder: outBoard,
            prefixIcon: Transform.translate(
              offset: Offset(15, 10),
              child: Text(
                "\$",
              ),
            )),
      ),
    );
  }

  Widget _dropDownBtn() {
    return DropdownButton<Map<String, dynamic>>(
        value: currentValue,
        hint: Text("Select USD"),
        items: USD_list.map((e) => DropdownMenuItem<Map<String, dynamic>>(
              value: e,
              child: Row(
                children: [
                  Image.asset(
                    e["icon"],
                    height: 30,
                    width: 30,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(e["NP"]),
                ],
              ),
            )).toList(),
        onChanged: (Map<String, dynamic>? value) {
          setState(() {
            currentValue = value;
          });
        });
  }

  Widget _dropDownBtnWanted() {
    return DropdownButton<Map<String, dynamic>>(
        value: currentValueWanted,
        hint: Text("Select USD"),
        items:
            USD_list_Wanted.map((e) => DropdownMenuItem<Map<String, dynamic>>(
                  value: e,
                  child: Row(
                    children: [
                      Image.asset(
                        e["icon"],
                        height: 30,
                        width: 30,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(e["NP"]),
                    ],
                  ),
                )).toList(),
        onChanged: (Map<String, dynamic>? value) {
          setState(() {
            currentValueWanted = value;
          });
        });
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: ColorManger.whiteColor,
      title: Text(
        "Exchange Currency",
        style: TextModelStyle.blackColor20BoldStyle(),
      ),
      centerTitle: true,
    );
  }
}
