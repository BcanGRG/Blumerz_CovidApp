import 'package:covid_tracker/screens/navigation_option.dart';
import 'package:covid_tracker/utils/constants.dart';
import 'package:flutter/material.dart';

import 'country.dart';
import 'global.dart';

enum NavigationStatus {
  GLOBAL,
  COUNTRY,
}

class Tracker extends StatefulWidget {
  Tracker({Key? key}) : super(key: key);

  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  NavigationStatus navigationStatus = NavigationStatus.GLOBAL;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text("Blumerz"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: navigationStatus == NavigationStatus.GLOBAL
                    ? Global()
                    : Country(),
              ),
            ),
          ),
          Container(
              height: size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavigationOption(
                    title: "Global",
                    selected: navigationStatus == NavigationStatus.GLOBAL,
                    onSelected: () {
                      setState(() {
                        navigationStatus = NavigationStatus.GLOBAL;
                      });
                    },
                  ),
                  NavigationOption(
                    title: "Ülkesel",
                    selected: navigationStatus == NavigationStatus.COUNTRY,
                    onSelected: () {
                      setState(() {
                        navigationStatus = NavigationStatus.COUNTRY;
                      });
                    },
                  )
                ],
              ))
        ],
      ),
    );
  }
}
