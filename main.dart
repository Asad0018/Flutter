import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        fontFamily: 'Dana',
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'Dana',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Dana',
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        actions: [
          SizedBox(width: 16),
          Image.asset("assets/images/Menu.png"),
          SizedBox(width: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "قیمت به روز ارز",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset("assets/images/Icon.png"),
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset("assets/images/q.png"),
                  SizedBox(width: 5),
                  Text(
                    "نرخ ارز آزاد چیست؟",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              SizedBox(height: 12),

              Text(
                " نرخ ارز فلان است حال ندارم توضیح بدم سدقد بثققد فب ثخصد قبنس مدبلثتج صصجقصخ ثجفج ثقذق ثدجفذث قتغلق ادکقدا ل کقفبدلاک یبدکل دیبکن دلاکیبد اکنذبدذ کندی بکلد قدلخد رطجلید لدیید لدیزح ثدق ربدر کسیبر خثقدخ دقد ب ثقث حد ححث بدححح ححب ثبت",
                style: Theme.of(context).textTheme.bodyMedium,
                textDirection: TextDirection.rtl,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: Container(
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                    color: Color.fromARGB(255, 130, 130, 130),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "نام ارز",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "قیمت",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "تغییر",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 360,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int position) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                      child: MyItems(),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    if ((index + 1) % 3 == 0) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                        child: Ad(),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 232, 232, 232),
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        child: TextButton.icon(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Color.fromARGB(255, 202, 193, 255),
                            ),
                            shape:
                                WidgetStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1000),
                                  ),
                                ),
                          ),
                          onPressed: () => _showSnackBar(context, "به روز رسانی با موفقیت شکست خورد"),
                          icon: Icon(
                            CupertinoIcons.refresh_bold,
                            color: Colors.black,
                          ),
                          label: Padding(
                            padding: const EdgeInsets.fromLTRB(8,0,0,0),
                            child: Text(
                              "به روز رسانی",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                        ),
                      ),
                      Text("آخرین به روز رسانی ${_getTime()}"),
                      SizedBox(width: 8,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _getTime() {
  return "20:45";
}

void _showSnackBar(BuildContext context, String msg){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(msg, style: Theme.of(context).textTheme.headlineMedium,), backgroundColor: Colors.green,)
  );
}

class MyItems extends StatelessWidget {
  const MyItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[BoxShadow(blurRadius: 1.0, color: Colors.grey)],
        color: Colors.white,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("دلار", style: Theme.of(context).textTheme.bodyMedium),
          Text("103000", style: Theme.of(context).textTheme.bodyMedium),
          Text("3.5%+", style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class Ad extends StatelessWidget {
  const Ad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[BoxShadow(blurRadius: 1.0, color: Colors.grey)],
        color: Colors.red,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "محل تبلیغات",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
