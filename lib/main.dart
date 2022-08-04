import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization_sample/utils/localization/languages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // builder:(context, child) {
      //   return Directionality(
      //     textDirection: TextDirection.rtl,
      //     child: child!,
      //   );
      // },
      debugShowCheckedModeBanner: false,
      translations: Language(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _isenglish = true;
  bool _changeDirection = false;

  void checkLanguage(bool lang){
    _isenglish = lang;
    _changeDirection = false;
    if (lang){
    Get.updateLocale(Locale('en', 'US'));
    } else{
    Get.updateLocale(Locale('ar', 'EG'));
    }
  }

  void checkLanguageDirection(bool lang, bool _dicirection){
    _isenglish = lang;
    _changeDirection = _dicirection;
    if (lang){
      Get.updateLocale(Locale('en', 'US'));
    } else{
      Get.updateLocale(Locale('ar', 'EG'));
    }
  }

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: !_changeDirection ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('myapp'.tr),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [

              Column(
                children: [
                  Text(
                    'greeting'.tr,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  OutlinedButton(
                      onPressed: () => _isenglish ? checkLanguageDirection(false, true) : checkLanguageDirection(true, false),
                      child: Text(
                          'changelang&dir'.tr
                      )
                  ),
                  OutlinedButton(
                      onPressed: () => _isenglish ? checkLanguage(false) : checkLanguage(true),
                      child: Text(
                          'changelanguage'.tr
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
         // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
