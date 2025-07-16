import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suitmedia_01/core/utils/riverpod_logger.dart';

import 'core/routes/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/remove_focus_node.dart';
import 'core/utils/ui_helper.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [CommonStateLogger()],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final appRouter = AppRouter();

    return ScreenUtilInit(
      designSize: Size(
        UIHelper.getCurrentDeviceType(context) == DeviceType.mobile
            ? 390
            : MediaQuery.sizeOf(context).width,
        UIHelper.getCurrentDeviceType(context) == DeviceType.mobile
            ? 844
            : MediaQuery.sizeOf(context).height,
      ),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GestureDetector(
        onTap: () => removeFocusNode(context),
        child: MaterialApp.router(
          routerConfig: appRouter.config(),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: Platform.isIOS
                  ? const CupertinoScrollBehavior()
                  : const MaterialScrollBehavior().copyWith(overscroll: false),
              child: child ?? Container(),
            );
          },
        ),
      ),
    );
  }
}
