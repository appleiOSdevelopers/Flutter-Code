import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io'; // Add this import.
import 'WelcomePage.dart';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async'; // Add this import

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WebView',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  String savedURL = '';
  String title = 'NRP APP';
  final URL_KEY = 'URL_KEY';
  int _groupValue = -1;

  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
    _loadURLFromPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.lightBlueAccent,
            foregroundColor: Colors.white,
            title: Text(title)),
        body: mainBody());
  }

  Widget mainBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0), // from top
      child: Card(
        //Big Card
        // Outer View
        elevation: 200,
        shadowColor: Colors.black,
        color: Colors.black12,
        child: SizedBox(
          height: 400,
          child: Column(
            children: [upperPortion(), const Divider(), downPortion()],
          ), //Column
        ), //Padding
      ), //SizedBox
    );
  }

  Widget upperPortion() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        //Big Card
        elevation: 100,
        shadowColor: Colors.orangeAccent,
        color: Colors.black12,
        child: SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Protocols Options: ",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                radioButtonWidget(),
              ],
            ), //Column
          ), //Padding
        ), //SizedBox
      ),
    );
    //Center
  }

  Widget downPortionn() {
    return Row(
      children: <Widget>[
        TextFormField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.white,
            filled: false,
            hintText: 'Please Enter URL',
            prefixIcon: const Padding(
              padding: EdgeInsets.only(top: 0),
              child: Icon(Icons.help_outline),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          controller: myController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'URL Required';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget downPortion() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
            child: TextFormField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.white,
                filled: false,
                hintText: 'Please Enter URL',
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Icon(Icons.help_outline),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              controller: myController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'URL Required';
                }
                return null;
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(6.0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.lightBlueAccent,
                child: IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _saveURLInPref();
                      gotoWebViewScreen();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                ),
              )),
        ],
      ),
    );
  }

  Widget radioButtonWidget() {
    return Center(
        child: Column(
      children: [
        RadioListTile(
            activeColor: Colors.blue,
            selectedTileColor: Colors.orange,
            title: const Text('Http: Hypertext Transfer Protocol',
                style: TextStyle(fontSize: 14, color: Colors.white)),
            value: 0,
            groupValue: _groupValue,
            onChanged: (value) {
              setState(() {
                _groupValue = value as int;
                myController.text = 'http://';
              });
            }),
        RadioListTile(
            activeColor: Colors.blue,
            selectedTileColor: Colors.orange,
            title: const Text('Https: Hypertext Transfer Protocol Secured',
                style: TextStyle(fontSize: 14, color: Colors.white)),
            value: 1,
            groupValue: _groupValue,
            onChanged: (value) {
              setState(() {
                _groupValue = value as int;
                myController.text = 'https://';
              });
            }),
      ],
    ));
  }

  void onChanged(int value) {
    setState(() {
      _groupValue = value;
    });
    print('Value = $_groupValue');
  }

  Future<void> _saveURLInPref() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedURL = myController.text;
      prefs.setString(URL_KEY, savedURL);
    });
  }

  Future<void> _loadURLFromPref() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedURL = (prefs.getString(URL_KEY) ?? '');
      myController.text = savedURL;
      if (savedURL.isNotEmpty && savedURL != '') {
        gotoWebViewScreen();
      }
    });
  }

  void gotoWebViewScreen() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => WelcomePage(stringurl: savedURL)),
        ModalRoute.withName("/Home"));
  }
}
