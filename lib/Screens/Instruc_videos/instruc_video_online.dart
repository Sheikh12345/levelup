import 'package:flutter/material.dart';
import 'package:levelup/Screens/Instruc_videos/shop_for_video.dart';
import 'package:levelup/Screens/MyPurchases/my_purchases.dart';
import 'package:levelup/Style/appColor.dart';

class InstructionVideos extends StatefulWidget {
  @override
  _InstructionVideosState createState() => _InstructionVideosState();
}

class _InstructionVideosState extends State<InstructionVideos>  with SingleTickerProviderStateMixin{
  TabController _controller;
  int _selectedIndex = 0;
  List<Widget> list = [
    Tab(
      text: "Shop For Videos",
    ),
    Tab(
      text: "My Purchases",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: list.length, vsync: this);
    _controller.addListener(() {
      if (this.mounted) {
        setState(() {
          _selectedIndex = _controller.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: primaryClr,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        bottom: TabBar(
          labelColor: Colors.white,
          indicatorColor:Colors.white,
          onTap: (index) {

          },
          controller: _controller,
          tabs: list,
        ),
      ),
       body: TabBarView(
          controller: _controller,
          children: [
            ShopForVideo(),
            MyPurchases(),
          ],
        ),
    ));
  }
}
