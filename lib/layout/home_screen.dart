// import 'package:flutter/material.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:news_app/layout/provider_model.dart';
// import 'package:provider/provider.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;
//   @override
//   void initState() {
//     var provider = Provider.of<ProviderModel>(context, listen: false);
//     provider.verifyPurchase();
//     super.initState();
//   }
//
//   void _buyProduct(ProductDetails prod) {
//     final PurchaseParam purchaseParam = PurchaseParam(productDetails: prod);
//     _iap.buyNonConsumable(purchaseParam: purchaseParam);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<ProviderModel>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("In App Purchase"),
//       ),
//       body: Center(
//         child: Container(
//           //height: 500,
//           //width: 200,
//           color: Colors.grey[300],
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     //color: Colors.grey.withOpacity(0.2),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image(
//                       image: provider.available ? AssetImage('assets/images/NoAds.png') : AssetImage('assets/images/thumbUp.png'),
//                       height: 200.0,
//                       width: 160.0,
//                         ),
//                         Text(
//                           provider.available
//                               ? "Would You Like To Remove All Ads ?"
//                               : " ",
//                           style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold,),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               provider.isPurchased
//                   ? Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                         Text("All Ads Removed ",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.green[700],),),
//                         Icon(Icons.lock_open)
//                       ],
//                     )
//                   : Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [Text("You will also support the app \nto get more future updates ",style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),
//                         SizedBox(width: 5.0,),
//                         Icon(Icons.lock)],
//                     ),
//               for (var prod in provider.products)
//                 if (provider.hasPurchased(prod.id) != null) ...[
//                   SizedBox(height: 10.0,),
//                   Center(
//                     child: FittedBox(
//                       child: Text(
//                         'THANK YOU!',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 60, color: Colors.black),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 50,
//                   ),
//                 ] else ...[
//                   Container(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 18.0,),
//                         Text(
//                           "Price: ${prod.price}\n",
//                           style: TextStyle(fontSize: 22, color: Colors.black54),
//                           textAlign: TextAlign.center,
//                         ),
//                         FlatButton(
//                           onPressed: () => _buyProduct(prod),
//                           child: Text('Pay'),
//                           color: Colors.green,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ]
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
