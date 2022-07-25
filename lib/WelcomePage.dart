import 'package:flutter/material.dart';
import 'package:webview/main.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  String stringurl;

  WelcomePage({Key? key, required this.stringurl}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SecondPageState(this.stringurl);
  }
}

class SecondPageState extends State<WelcomePage> {
  SecondPageState(this.stringurl);
  final key = UniqueKey();
  String stringurl;
  int position = 1;

  @override
  Widget build(BuildContext context) {
    print('url is $stringurl');
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue,
            title: Text('Web View')),
        body: IndexedStack(index: position, children: <Widget>[
          WebView(
            initialUrl: stringurl,
            javascriptMode: JavascriptMode.unrestricted,
            key: key,
            onPageFinished: doneLoading,
            onPageStarted: startLoading,
            javascriptChannels: <JavascriptChannel>{
              JavascriptChannel(
                  name: 'MessageInvoker',
                  onMessageReceived: (s) {
                    deleteURL();
                    gotoMainScreen();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(s.message.toString())),
                    );
                  }),
            },
          ),
          Container(
            color: Colors.white,
            child: const Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            )),
          ),
        ]));
  }

  doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  startLoading(String A) {
    setState(() {
      position = 1;
    });
  }

  void gotoMainScreen() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
        ModalRoute.withName("/Home"));
  }

  void deleteURL() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}
