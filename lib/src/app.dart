import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/utils/router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          routerConfig: router,
        );
      },
    );
  }
}
