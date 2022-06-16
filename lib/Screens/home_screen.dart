import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation/Components/images.dart';
import 'package:meditation/Components/pallete.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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

  Widget customPadding({required Widget child, EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 30)}) {
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
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: kPrimaryColor,
                  ),
                  hintText: 'Search what motivates you!',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 48,
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
    return Container();
  }

  Widget _navBar() {
    return Container();
  }
}
