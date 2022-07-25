
// //old code
// Widget mainWidget() {
//   return Center(
//     child: Container(
//       decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [
//               Colors.blue,
//               Colors.greenAccent,
//             ],
//           )),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(18.0),
//             child: Text("Please Select Protocol",
//                 style: TextStyle(fontSize: 16, color: Colors.white)),
//           ),
//           radioButtonWidget(),
//           Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: TextFormField(
//                     cursorColor: Colors.white,
//                     decoration: InputDecoration(
//                       fillColor: Colors.white,
//                       focusColor: Colors.white,
//                       filled: false,
//                       hintText: 'Please Enter URL',
//                       prefixIcon: const Padding(
//                         padding: EdgeInsets.only(top: 0),
//                         child: Icon(Icons.help_outline),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(100),
//                       ),
//                     ),
//                     controller: myController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'URL Required';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: CircleAvatar(
//                       radius: 30,
//                       backgroundColor: Colors.lightBlueAccent,
//                       child: IconButton(
//                         color: Colors.white,
//                         icon: const Icon(Icons.arrow_forward),
//                         onPressed: () async {
//                           if (_formKey.currentState!.validate()) {
//                             _saveURLInPref();
//                             gotoWebViewScreen();
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                   content: Text('Processing Data')),
//                             );
//                           }
//                         },
//                       ),
//                     )),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// Widget inputWindow() {
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           child: const Text("Please Select Protocol"),
//         ),
//         Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   RadioListTile(
//                       activeColor: Colors.blue,
//                       selectedTileColor: Colors.orange,
//                       title: const Text('Http: Hypertext Transfer Protocol'),
//                       value: 0,
//                       groupValue: _groupValue,
//                       onChanged: (value) {
//                         setState(() {
//                           _groupValue = value as int;
//                         });
//                       }),
//                   RadioListTile(
//                       activeColor: Colors.blue,
//                       selectedTileColor: Colors.orange,
//                       title: const Text(
//                           'Https: Hypertext Transfer Protocol Secured'),
//                       value: 1,
//                       groupValue: _groupValue,
//                       onChanged: (value) {
//                         setState(() {
//                           _groupValue = value as int;
//                         });
//                       }),
//                 ],
//               ),
//               Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       child: Padding(
//                         padding: const EdgeInsets.all(28.0),
//                         child: Text(
//                           'Enter URL',
//                           style: Theme.of(context).textTheme.headline4,
//                         ),
//                       ),
//                       decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(15)),
//                           color: Colors.white),
//                       padding: EdgeInsets.all(16.0),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                     controller: myController,
//                     // The validator receives the text that the user has entered.
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter url';
//                       }
//                       return null;
//                     }),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate()) {
//                       _saveURLInPref();
//                       gotoWebViewScreen();
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Processing Data')),
//                       );
//                     }
//                   },
//                   child: const Text('Enter URL'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
// Widget loginWidget() {
//   return Container(
//     decoration: const BoxDecoration(
//       image: DecorationImage(
//           image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
//     ),
//     child: Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Stack(children: [
//         Container(
//           padding: const EdgeInsets.only(left: 35, top: 80),
//           child: const Text(
//             "Welcome\nBack",
//             style: TextStyle(color: Colors.white, fontSize: 33),
//           ),
//         ),
//         SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.only(
//                 right: 35,
//                 left: 35,
//                 top: MediaQuery.of(context).size.height * 0.5),
//             child: Column(children: [
//               TextField(
//                 decoration: InputDecoration(
//                   fillColor: Colors.grey.shade100,
//                   filled: true,
//                   hintText: 'Email',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   fillColor: Colors.grey.shade100,
//                   filled: true,
//                   hintText: 'Password',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Sign In',
//                     style: TextStyle(
//                       color: Color(0xff4c505b),
//                       fontSize: 27,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundColor: const Color(0xff4c505b),
//                     child: IconButton(
//                       color: Colors.white,
//                       onPressed: () {},
//                       icon: const Icon(Icons.arrow_forward),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, 'register');
//                 },
//                 child: const Text(
//                   'Sign Up',
//                   style: TextStyle(
//                     decoration: TextDecoration.underline,
//                     fontSize: 18,
//                     color: Color(0xff4c505b),
//                   ),
//                 ),
//               ),
//             ]),
//           ),
//         ),
//       ]),
//     ),
//   );
// }
// Widget firstRow() {
//   return Row(
//     children: const [
//       Padding(
//         padding: EdgeInsets.only(right: 8.0),
//         child: Icon(
//           Icons.favorite,
//           color: Colors.green,
//         ),
//       ),
//       Text(
//         'BEAMS',
//         style: TextStyle(
//           color: Colors.black,
//         ),
//       ),
//     ],
//   );
// }
//
// Widget helloWorldCenterText() {
//   return const Align(
//     alignment: Alignment.topCenter,
//     child: Text(
//       "Hello",
//       style: TextStyle(fontSize: 30),
//     ),
//   );
// }
//
// Widget webViewWidget() {
//   // return Text("Hello world!");
//   return const Padding(
//     padding: EdgeInsets.all(8.0),
//     child: WebView(
//       initialUrl: 'https://flutter.dev',
//     ),
//   );
// }
//
// Widget myLayoutWidget2() {
//   // return Text("Hello world!");
//   return const Center(
//     child: Text(
//       "Hello world!",
//       style: TextStyle(fontSize: 30),
//     ),
//   );
// }