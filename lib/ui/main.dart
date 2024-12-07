import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/data/Api/dio.dart';
import 'package:mohamed/ui/HomeScreen/SplashScreen.dart';
import 'package:mohamed/ui/My-Bloc.dart';
import 'package:mohamed/ui/SharedPreference.dart';
import 'package:mohamed/ui/auth/edit%20profile/Edit%20profile.dart';
import 'package:mohamed/ui/HomeScreen/HomeScreen.dart';
import 'package:mohamed/ui/CurrentOrder/current%20requests.dart';
import 'package:mohamed/ui/auth/login/sign%20in.dart';
import '../data/Api/const.dart';
import 'Canceled orders.dart';
import 'Completed orders.dart';
import 'List Delegates.dart';
import 'Order management.dart';
import 'Requests incomplete.dart';
import 'Settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPreferenceUtils.init();
  await DioFinalHelper.init();
  token = SharedPreferenceUtils.getData(key: 'token') as String?;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        //language.routeName: (context) => language(),
        SignIn.routeName: (context) => SignIn(),
        Ordermanagement.routeName: (context) => Ordermanagement(),
        HomeScreen.routeName: (context) => HomeScreen(),
        Settings.routeName: (context) => Settings(),
        CanceledOrders.routeName: (context) => CanceledOrders(),
        CompletedOrders.routeName: (context) => CompletedOrders(),
        CurrentRequests.routeName: (context) => CurrentRequests(),
        ListDelegates.routeName: (context) => ListDelegates(),
        RequestsIncomplete.routeName: (context) => RequestsIncomplete(),
        // ignore: equal_keys_in_map
        CanceledOrders.routeName: (context) => CanceledOrders(),
        EditProfile.routeName: (context) => EditProfile(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}