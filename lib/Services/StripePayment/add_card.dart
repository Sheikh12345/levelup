import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:toast/toast.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore _firesUser = FirebaseFirestore.instance;

  List<dynamic> cards = [];
  @override
  void initState() {
    super.initState();
    try{
      _firesUser.collection("Users").doc(FirebaseAuth.instance.currentUser.uid).
      get().then((value){
        cards = value.get("Cards");
      }).whenComplete((){

      });
    }catch(e){
      print(e.toString());
    }
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Add Card",style: txtStyleCab(
          color: Colors.white,

        ),),
        backgroundColor: primaryClr,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         Padding(
           padding:  EdgeInsets.all(size.width*0.05),
           child: CreditCardWidget(
             cardBgColor: Colors.black,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
            animationDuration: Duration(milliseconds: 1000),
            // width: size.width*0.8,
            // height: size.height*0.25,
            //true when you want to show cvv(back) view
        ),
         ),

            CreditCardForm(
              key: formKey,
              themeColor: primaryClr,
              onCreditCardModelChange: (CreditCardModel data) {
               setState(() {
                 isCvvFocused = data.isCvvFocused;
                 expiryDate = data.expiryDate;
                 cvvCode = data.cvvCode;
                 cardHolderName = data.cardHolderName;
                 cardNumber = data.cardNumber;
               });
              },
            ),
            SizedBox(
              height: size.height*0.03,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                primary: primaryClr,
              ),
              child: Container(
                height: size.height*0.04,
                alignment: Alignment.center,
                width: size.width*0.6,
                margin: const EdgeInsets.all(8),
                child:  Text(
                  'ADD CARD',
                  style:txtStyleCab(
                    color: Colors.white,
                    weight: FontWeight.w600,
                    letterSpacing: 1,
                    size: size.width*0.04
                  )
                ),
              ),
              onPressed: () {
                if (cardNumber.length>15 && expiryDate.length>4&&cardHolderName.length>1&& cvvCode.length>2) {
                  addCardToFireStore(context);

                } else {
                Toast.show("Invalid card", context,gravity: 1,);
                }
              },
            )
          ],
        ),
      ),
    ));
  }

  addCardToFireStore(BuildContext context){
    print("card "+cardNumber);
  try{
    Map<String,dynamic> _cardMap = Map();
    if(cardNumber.length>15 && expiryDate.length>4&&cardHolderName.length>1&& cvvCode.length>2){
      _cardMap.addAll({
        "cardNumber":cardNumber,
        "expiryDate":expiryDate,
        "cardHolderName":cardHolderName,
        "cvvCode":cvvCode,
      });
      cards.add(_cardMap);
    }

    print(      FirebaseAuth.instance.currentUser.uid);
    FirebaseFirestore.instance.collection("Users").doc(
        FirebaseAuth.instance.currentUser.uid
    ).update({
      "Cards":FieldValue.arrayUnion(cards)
    }).whenComplete((){
      Navigator.pop(context);
    }).catchError((){
      Toast.show("Network error", context,gravity: 1);
    });
  }catch(e){
    print(e.toString());
  }
  }
}
