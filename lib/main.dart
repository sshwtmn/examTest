import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'package:kati_masterclass_app/firebase_options.dart';
import 'package:kati_masterclass_app/providers/bookings.dart';
import 'package:kati_masterclass_app/services/authCheck.dart';
import 'package:provider/provider.dart';
import 'package:kati_masterclass_app/providers/products_provider.dart';



import 'components/theme.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //localization
  await EasyLocalization.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => Products()),
              ChangeNotifierProvider(create: (context) => Bookings()),
            ],
        child:  MyApp()),
      );

}

class MyApp extends StatelessWidget {
     MyApp({super.key});

    final FlutterLocalization localization = FlutterLocalization.instance;


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: primaryTheme,
        home:  const  AuthCheck()
        );

  }
}
