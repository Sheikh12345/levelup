import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:levelup/DataModel/Stripe_model.dart';
import 'package:levelup/Services/StripePayment/stripe_service.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/common/common.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:toast/toast.dart';

import 'add_card.dart';

class PaymentHome extends StatefulWidget {
  final String amount;
  final courseRoute;
  final json;
  final link;
  PaymentHome({Key key, this.amount, this.courseRoute, this.json, this.link})
      : super(key: key);

  @override
  PaymentHomeState createState() => PaymentHomeState();
}

class PaymentHomeState extends State<PaymentHome> {





  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  FirebaseFirestore _firesUser = FirebaseFirestore.instance;
  onItemPress(BuildContext context, int index) async {
    switch (index) {
      case 0:
        payViaNewCard(context);
        break;
      case 1:
        // screenPush(context, ExistingCardsPage());
        break;
    }
  }

  List purchaseCourses = [];
  static CollectionReference _fireRefUsers =
      FirebaseFirestore.instance.collection("Users");

  updatePurchaseCourses() {
    _fireRefUsers
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((querySnapshot) {
          purchaseCourses = querySnapshot.get("purchaseCourses");
        })
        .whenComplete(() {})
        .catchError((error) {
          print("Error =>" + error.toString());
        });
  }

  payViaNewCard(BuildContext context) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Please wait...');
    await dialog.show();
    var response = await StripeService.payWithNewCard(
        amount: '${widget.amount}00', currency: 'USD');
    await dialog.hide();
    showInSnackBar(context: context, response: response);
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
    updatePurchaseCourses();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Payment Cards',
          style: txtStyleCab(letterSpacing: 1, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primaryClr,
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: StreamBuilder(
            stream: _firesUser
                .collection("Users")
                .doc(FirebaseAuth.instance.currentUser.uid)
                .snapshots(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.data["Cards"].length == 0) {
                return Center(
                  child: Text(
                    "Please Add card and process payments",
                    style: txtStylePop(
                        weight: FontWeight.w600,
                        color: Colors.black54,
                        size: size.width * 0.05),
                    textAlign: TextAlign.center,
                  ),
                );
              }
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data["Cards"].length ?? 0,
                    itemBuilder: (_, index) {
                      return InkWell(
                          onTap: () {
                            _showDialog(
                                size: size,
                                context: context,
                                cardNum: snapshot.data["Cards"][index]
                                    ["cardNumber"],
                                expiry: snapshot.data["Cards"][index]
                                    ["expiryDate"]);
                            // addRouteToUsersPurchases();
                          },
                          child: Stack(
                            children: [
                              Container(
                                child: CreditCardWidget(
                                  cardBgColor: Colors.black,
                                  cardHolderName: snapshot.data["Cards"][index]
                                      ["cardHolderName"],
                                  cardNumber: snapshot.data["Cards"][index]
                                      ["cardNumber"],
                                  cvvCode: snapshot.data["Cards"][index]
                                      ["cvvCode"],
                                  expiryDate: snapshot.data["Cards"][index]
                                      ["expiryDate"],
                                  showBackView: false,
                                ),
                              ),
                              Positioned(
                                  right: size.width * 0.04,
                                  top: size.height * 0.02,
                                  child: IconButton(
                                    onPressed: () {
                                      _showDialogForDeleteCard(
                                          index: index,
                                          context: context,
                                          size: size);
                                    },
                                    icon: Icon(
                                      Icons.delete_forever,
                                      color: Colors.red,
                                      size: size.width * 0.09,
                                    ),
                                  ))
                            ],
                          ));
                    });
              }

              return Center(
                child: Text("Network Error"),
              );
            },
          )),
      floatingActionButton: InkWell(
        onTap: () {
          screenPush(context, AddCard());
        },
        child: Container(
          width: size.width * 0.3,
          height: size.height * 0.06,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          decoration: BoxDecoration(
              color: primaryClr,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(2, 2),
                    spreadRadius: 4,
                    blurRadius: 5),
                BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(-2, -2),
                    spreadRadius: 4,
                    blurRadius: 5),
              ]),
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.credit_card,
                  color: Colors.white,
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                FittedBox(
                  child: Text("Add Card",
                      style: txtStyleCab(
                          color: Colors.white, weight: FontWeight.w600)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showInSnackBar({
    String value,
    BuildContext context,
    StripeTransactionResponse response,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(response.message),
      duration: Duration(milliseconds: response.success ? 1300 : 3000),
    ));
  }

  _showDialog(
      {Size size, BuildContext context, String cardNum, String expiry}) {
    showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text("Are you sure you want to proceed with this card?"),
        actions: [
          MaterialButton(
            onPressed: () {
              payViaExistingCard(
                  expiry: expiry, cardNum: cardNum, context: context);
            },
            child: Text("Yes"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("No"),
          )
        ],
      ),
    );
  }

  payViaExistingCard(
      {BuildContext context, String expiry, String cardNum}) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Please wait...');
    await dialog.show();
    var expiryArr = expiry.split('/');
    CreditCard stripeCard = CreditCard(
      number: cardNum,
      expMonth: int.parse(expiryArr[0]),
      expYear: int.parse(expiryArr[1]),
    );
    var response = await StripeService.payViaExistingCard(
        amount: '${widget.amount}00', currency: 'USD', card: stripeCard);
    await dialog.hide();
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(
          content: new Text(response.message),
          duration: Duration(milliseconds: 1300),
        ))
        .closed
        .then((_) {
      if (response.success == true) {
        addRouteToUsersPurchases();
        Toast.show("Courses added into my purchases", context,
            gravity: 1, duration: 2);
      }
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  _showDialogForDeleteCard({Size size, BuildContext context, int index}) {
    showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text("Are you sure you want to delete this card?"),
        actions: [
          MaterialButton(
            onPressed: () {
              removeCard(index);
              Navigator.pop(context);
            },
            child: Text("Yes"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("No"),
          )
        ],
      ),
    );
  }

  removeCard(int index) {
    try {
      List<dynamic> cards = [];
      _firesUser
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .get()
          .then((value) {
        cards = value["Cards"];
      }).whenComplete(() {
        print(cards[index]["cardNumber"]);
        cards.removeAt(index);
        deleteCard(cards);
      }).catchError(() {
        Toast.show("Network error", context, gravity: 1);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  deleteCard(List card) {
    _firesUser
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .set({
      "Cards": FieldValue.arrayUnion(card),
    }).whenComplete(() {
      print("Done");
    });
  }

  addRouteToUsersPurchases() {
    print("add Route To Users Purchases");
    coursesList.add(widget.courseRoute);
    try {
      FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection("purchaseCourses").add({
        "link":"${widget.link}",
        "title": widget.json.title??"",
        "description": widget.json.description??"",
        "address": widget.courseRoute??""
      }).whenComplete(() {
        Future.delayed(Duration(seconds: 2),(){
          FirebaseFirestore.instance
              .collection("Users")
              .doc(FirebaseAuth.instance.currentUser.uid)
              .update({
            "listCourses": FieldValue.arrayUnion(coursesList),
            "CourseIsAvailable": true
          });
        });
      });
    } catch (e) {
      print("error stripe => ${e.toString()}");
    }
  }
}
