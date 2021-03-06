import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
// import '../config/routes/router_name.dart';
import '../controller/route_controller.dart';
import 'package:splashscreen/splashscreen.dart';
// import '../shared/login_shared.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // splash() async {
  //   await Future.delayed(Duration(seconds: 3), () {
  //     getStatus().then((value) =>
  //         (value) ? Get.offNamed(HomeRoute) : Get.offNamed(LoginRoute));
  //   });
  // }

  final RouteController rc = Get.put(RouteController());

  @override
  void initState() {
    super.initState();
    // splash();
    rc.cek_auth();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Color(0xFF2f2546),
    //   body: SafeArea(
    //     child: Center(
    //       child: SpinKitFadingCube(
    //         color: Colors.white,
    //         size: 50.0,
    //       ),
    //     ),
    //   ),
    // );

    return Obx(
      () => SplashScreen(
        // loadingText: Text('loading..'),
        seconds: 3,
        // the widget to run after running your splashscreen
        navigateAfterSeconds: rc.route.value,
        title: Text(
          'Kabupaten Magelang',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        image: Image.asset(
          'assets/logo/logo_rtlh_red_2.png',
          height: (MediaQuery.of(context).size.width * 1 / 3) + 50,
          alignment: Alignment.bottomCenter,
        ),
        backgroundColor: Color(0xFF2f2546),
        // styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.amber,
      ),
    );
  }
}
