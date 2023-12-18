import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'config/app_routes.dart';
import 'controllers/login_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: LoginController().hasToken(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.from(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromRGBO(32, 63, 129, 1.0),
              ),
            ),
            initialRoute:
                snapshot.data ?? false ? AppRoutes.home : AppRoutes.login,
            // AppRoutes.warehouse_list,
            getPages: AppRoutes.getPages,
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
