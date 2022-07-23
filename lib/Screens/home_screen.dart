// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation/Components/images.dart';
import 'package:meditation/Components/pallete.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _feelingTitleList = [
    'Happy',
    'Angry',
    'Anxious',
    'Sleepy',
    'Sad',
    'Irritated',
  ];

  final List<String> _feelingImgList = [
    grinning,
    angry,
    anxious,
    sleepy,
    crying,
    irritated,
  ];

  int currentNavOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: Column(
            children: [
              _appBar(context),
              _mainBody(),
              _navBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget customPadding({
    required Widget child,
    EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 30),
  }) {
    return Container(
      child: child,
      margin: margin,
    );
  }

  Widget _appBar(BuildContext context) {
    return customPadding(
      child: Row(
        children: [
          SvgPicture.asset(menu),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 30),
              decoration: BoxDecoration(
                border: Border.all(color: kBorderGrey),
                borderRadius: BorderRadius.circular(18),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: kPrimaryColor,
                  ),
                  hintText: 'Search what motivates you!',
                  hintStyle: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _mainBody() {
    return Expanded(
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 30,
            ),
            customPadding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Welcome Sam!',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'GilroyLight',
                      color: kPrimaryColor,
                    ),
                  ),
                  Image.asset(
                    user,
                    scale: 8,
                  ),
                ],
              ),
            ),
            customPadding(
              child: const Text(
                'How are you feeling?',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'GilroyEBold',
                  color: kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _feelingTitleList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  return _feelings(
                    title: _feelingTitleList[index],
                    image: _feelingImgList[index],
                  );
                },
              ),
            ),
            customPadding(
              child: const Text(
                'Let\'s Explore',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'GilroyEBold',
                  color: kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 180,
              child: ListView(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  _explore(
                    title: 'Guided\nMeditation',
                    desc: '18 Sessions',
                    bgImg: bg3,
                  ),
                  _explore(
                    title: 'Relax\nand Sleep',
                    desc: '26 Sessions',
                    bgImg: bg2,
                  ),
                  _explore(
                    title: 'Focus\nEnhancement',
                    desc: '20 Sessions',
                    bgImg: bg1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _explore({required String title, required String desc, required String bgImg}) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
      ),
      child: Stack(
        children: [
          Image.asset(bgImg),
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'GilroyEBold',
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              desc,
              style: const TextStyle(
                fontSize: 14,
                color: kPrimaryColor,
                fontFamily: 'GilroyLight',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _feelings({required String title, required String image}) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            height: 60,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'GilroyLight',
              color: kPrimaryColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _navBar() {
    return Container(
      child: Row(children: [
        _nav(
          index: 0,
          navIcon: home,
        ),
        _nav(
          index: 1,
          navIcon: disc,
        ),
        _nav(
          index: 2,
          navIcon: moon,
        ),
        _nav(
          index: 3,
          navIcon: music,
        ),
      ]),
    );
  }

  Widget _nav({required String navIcon, required int index}) {
    bool isSelected = currentNavOption == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentNavOption = index;
          });
        },
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                navIcon,
                color: isSelected ? kPrimaryColor : kBorderGrey,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 3,
                width: 15,
                color: isSelected ? kPrimaryColor : Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
