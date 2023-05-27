// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:news_app/layout/news_layout.dart';
//
// class SecondPage extends StatefulWidget {
//   @override
//   _SecondPageState createState() => _SecondPageState();
// }
//
// class _SecondPageState extends State<SecondPage> {
//   InterstitialAd myInterstitial;
//
//   @override
//   void initState() {
//     super.initState();
//     _createInterstitialAd(); // create ad
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       // ignore: missing_return
//       onWillPop: () {
//         Navigator.pop(context); // pops page
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 NewsLayout(), // replace popped page to call init again
//           ),
//         );
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Second Page'),
//           centerTitle: true,
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//             ),
//             onPressed: () {
//               Navigator.pop(context); // pops page
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       NewsLayout(), // replace popped page to call init again
//                 ),
//               );
//             },
//           ),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               _showInterstitialAd(); // show ad
//             },
//             child: Text('Go To First Page'),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // create ad
//   _createInterstitialAd() {
//     InterstitialAd.load(
//       adUnitId: Platform.isAndroid
//           ? 'ca-app-pub-3940256099942544/1033173712'
//           : 'ca-app-pub-3940256099942544/4411468910', // test ad ids for different platforms
//
//       request: AdRequest(),
//
//       adLoadCallback: InterstitialAdLoadCallback(
//         // if ad fails to load
//         onAdFailedToLoad: (LoadAdError error) {
//           print('Ad exited with error: $error'); // print error
//         },
//
//         // else
//         onAdLoaded: (InterstitialAd ad) {
//           setState(() {
//             this.myInterstitial = ad; // set the ad equal to the current ad
//           });
//         },
//       ),
//     );
//   }
//
//   _showInterstitialAd() {
//     // create callbacks for ad
//     myInterstitial.fullScreenContentCallback = FullScreenContentCallback(
//       // when dismsissed
//       onAdDismissedFullScreenContent: (InterstitialAd ad) {
//         Navigator.pop(context); // pop page
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 NewsLayout(), // replace popped page to call init again
//           ),
//         );
//         ad.dispose(); // dispose ad
//       },
//
//       // if ad fails to show
//       onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//         Navigator.pop(context); // pop page
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 NewsLayout(), // replace popped page to call init again
//           ),
//         );
//         print('$ad onAdFailedToShowFullScreenContent: $error'); // print error
//         ad.dispose(); // dispose ad
//       },
//     );
//
//     myInterstitial.show(); // show ad
//   }
// }
