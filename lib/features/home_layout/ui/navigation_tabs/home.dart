import 'package:currency_app/theme/paths/image_paths.dart';
import 'package:currency_app/theme/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../theme/paths/icons_path.dart';
import '../../../../theme/styles/text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _titleView(),
              SizedBox(height: 24.0,),
              _moneyExchange(),
              SizedBox(height: 24.0,),
              _currentExchange(),
              SizedBox(height: 24.0,),
              _transactionHistory()
            ],
          ),
        ),
      );
  }

  Widget _titleView(){
    ColorFilter colorFilter;
    return  Row(
      children: [


           Container(
            height: 58.0,
            width: 58.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManger.primary,
              border: Border.all(color: ColorManger.primary,width: 1.0),
              boxShadow: [

                BoxShadow(
                  color: ColorManger.primary,
                  blurRadius: 2.0,
                  spreadRadius: 3.0
                ),
                BoxShadow(
                    color: ColorManger.whiteColor,
                    blurRadius: 0.0,
                    spreadRadius: 2.0
                ),
              ],
              image: DecorationImage(
                image: AssetImage(ImageManger.profileImage),
              )
            ),

          ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi , Momen",style: TextModelStyle.blackColor20BoldStyle(),),
            Text("checkout our current rates",style: TextModelStyle.greyColor214MediumStyle(),),
          ],
        ),
        SizedBox(width: 10.0,),
        Spacer(),
        Stack(
          alignment: Alignment.topRight,
          children: [
            Icon(Icons.notifications_none_outlined,size: 40),
            CircleAvatar(
              radius: 10,
              backgroundColor: ColorManger.redColor,
              child: Center(child: Text("3",style: TextModelStyle.whiteColor11MediumStyle(),)),
            )
          ],
        )
      ],
    );
  }
  Widget _moneyExchange(){
    return Container(
      height: 200.0,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 16.0,bottom: 16.0,right: 8.0,left: 18.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          ColorManger.darkColor,
          ColorManger.blackColor2,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width*.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Buy and sell Currency with easy",
                  maxLines: 3,
                  style: TextModelStyle.whiteColor18BoldStyle(),),
                SizedBox(height: 10.0,),
                Container(
                  width: 150,
                  height: 30.0,
                  color: ColorManger.primary,
                  child: MaterialButton(
                      onPressed: (){},
                    child: Text("Exchange Now",style: TextModelStyle.blackColor14BoldStyle(),),),
                )
              ],
            ),
          ),

          Image.asset(ImageManger.moneyImage,height: 150,
            width: MediaQuery.of(context).size.width *.4,
            fit: BoxFit.contain,)
        ],
      ),
    );
  }
  Widget _currentExchange(){
    return Container(
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
        Text("Current ExchangeRate",
          style: TextModelStyle.blackColor16BoldStyle(),),
       SizedBox(height: 10.0,),
        itemExchange(title: "USD",buyNumber: 220,sellNumber: 215,imagePath: IconManger.USD_Icon),
        SizedBox(
          height: 16.0,
        ),
          itemExchange(title: "EUR",buyNumber: 410 ,sellNumber: 425,imagePath: IconManger.EUR_Icon),
        SizedBox(
          height: 10.0,
        ),
          itemExchange(title: "GBP",buyNumber: 620 ,sellNumber: 690,imagePath: IconManger.GBP_Icon),
      ],

      ),
    );
  }
  
  Widget itemExchange({required String imagePath,
    required String title,
    required double sellNumber,
    required double buyNumber,

  }){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(imagePath,height: 50.0,width: 50.0,fit: BoxFit.contain,),
          SizedBox(width: 10.0,),
           Text(title,style: TextModelStyle.greyColor214MediumStyle(),)
            ],
          ),
          Column(children: [
            Text("Buy",style:TextModelStyle.greyColor214MediumStyle() ,),
            Text("\$$buyNumber",style: TextModelStyle.blackColor16BoldStyle(),),

          ],),
          Column(children: [
            Text("Sell",style: TextModelStyle.greyColor214MediumStyle(),),
            Text("\$$sellNumber",style: TextModelStyle.blackColor16BoldStyle()),

          ],),
        ],
      ),
    );
  }
  Widget _transactionHistory(){
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Transaction History",style: TextModelStyle.blackColor16BoldStyle(),),
              Text("Sell all",style: TextModelStyle.primary12BoldStyle(),),

            ],
          ),
          SizedBox(height: 32.0,),
          _itemOFTransactionHistory(
              firstIconPath: IconManger.ireland,
              secondIconPath: IconManger.USD_Icon,
              sellNumber: 6000,
              USDNumber: 140,
              currency: 19.52,
              isSuccess: false),
          SizedBox(height: 24.0,),
          _itemOFTransactionHistory(
              firstIconPath: IconManger.ireland,
              secondIconPath: IconManger.USD_Icon,
              sellNumber: 200,
              USDNumber: 500,
              currency: 49.52,
              isSuccess: true)
        ],
      ),
    );
  }

  Widget _itemOFTransactionHistory({
    required String firstIconPath,
    required bool isSuccess,
    required String secondIconPath,
    required double sellNumber,
    required double USDNumber,
    required double currency,


  }){
    return Container(
      height: 100.0,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: ColorManger.lightYellow,
            padding: const EdgeInsets.all(8.0),
            height: 100.0,
            width: 60.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(firstIconPath,height: 35,width: 35,fit: BoxFit.contain,),
                Divider(height: 10.0,thickness: 2.0,color: ColorManger.redColor,),
                Image.asset(secondIconPath,height: 35,width: 35,fit: BoxFit.contain,),
              ],
            ),
          ),
          Column(children: [
            Text("Sell N $sellNumber",style: TextModelStyle.greyColor314BoldStyle(),),
            Chip(
              label: Text("$USDNumber USD",
                style: TextModelStyle.whiteColor11MediumStyle(),),
              backgroundColor: ColorManger.greyColor4,),
            Text("10/02/2021",style: TextModelStyle.greyColor314BoldStyle(),),

          ],),
          SizedBox(width: 8.0,),
          Column(children: [
            Text("\$ $currency",style: TextModelStyle.greyColor3Color20BoldStyle(),),
           SizedBox(height: 12.0,),
            Text(isSuccess?"Success" : "Pending",
            style: isSuccess?
            TextModelStyle.lightGreen12BoldStyle():TextModelStyle.redColor2Color12BoldStyle()
              ,
            ),

          ],),
          SizedBox(width: 24.0,),

        ],
      ),
    );
  }

}


