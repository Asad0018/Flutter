import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa', ''), // Farsi
      ],

      theme: ThemeData(
        fontFamily: 'Dana'
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }

}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        actions: [
          SizedBox(width: 16,),
          Image.asset("assets/images/Menu.png"),
          SizedBox(width: 8,),
          Text("قیمت به روز ارز"),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft, 
              child: Image.asset("assets/images/Icon.png"))),
          SizedBox(width: 8,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
        children: [
        Row(
          children: [
          Image.asset("assets/images/q.png"),
          SizedBox(width: 5,),
          Text("نرخ ارز آزاد چیست؟", 
          style: TextStyle(color: const Color.fromARGB(255, 80, 115, 133))),
        ],),
        
        Text(" نرخ ارز فلان است حال ندارم توضیح بدم سدقد بثققد فب ثخصد قبنس مدبلثتج صصجقصخ ثجفج ثقذق ثدجفذث قتغلق ادکقدا ل کقفبدلاک یبدکل دیبکن دلاکیبد اکنذبدذ کندی بکلد قدلخد رطجلید لدیید لدیزح ثدق ربدر کسیبر خثقدخ دقد ب ثقث حد ححث بدححح ححب ثبت", 
        textDirection: TextDirection.rtl)
      ],)
    ));
  }
}


