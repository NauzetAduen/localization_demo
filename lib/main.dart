import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EasyLocalization(
    path: 'assets/translations',
    supportedLocales: [
      Locale('en', 'US'),
      Locale('es', 'ES'),
    ],
    fallbackLocale: Locale('en'),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      title: 'long name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title').tr(),
      ),
      body: Center(
        child: Text('text').tr(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.locale = context.locale == context.supportedLocales.first
              ? context.supportedLocales.last
              : context.supportedLocales.first;
        },
        tooltip: 'Change language',
        child: Icon(Icons.switch_left),
      ),
    );
  }
}
