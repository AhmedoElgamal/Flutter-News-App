import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:news_app/layout/language_screen.dart';
import 'package:news_app/layout/provider_model.dart';
import 'package:news_app/layout/purchase_api.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';
import 'package:news_app/shared/cubit/app_states.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:provider/provider.dart';
import 'ad_screen.dart';
import 'home_screen.dart';

class NewsLayout extends StatefulWidget {
  @override
  _NewsLayoutState createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
  final BannerAd myBanner = BannerAd(
    //adUnitId: Platform.isAndroid ? 'ca-app-pub-3940256099942544/6300978111' : 'ca-app-pub-3940256099942544/2934735716', //TEST
    adUnitId: Platform.isAndroid ? 'ca-app-pub-5775840589825547/4567060387' : 'ca-app-pub-5775840589825547/8120466045',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  InterstitialAd myInterstitial;
  Timer timer;
  // var scaffoldKey = GlobalKey<ScaffoldState>();
  // var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // var provider = Provider.of<ProviderModel>(context, listen: false);
    // provider.initialize();
    super.initState();
    myBanner.load();
    createInterstitialAd();
    timer = Timer.periodic(Duration(seconds: 15), (Timer t) => showInterstitialAd());
  }

  createInterstitialAd() {
    InterstitialAd.load(
      //adUnitId: Platform.isAndroid ? 'ca-app-pub-3940256099942544/1033173712' : 'ca-app-pub-3940256099942544/4411468910', //TEST
      adUnitId: Platform.isAndroid ? 'ca-app-pub-5775840589825547/7644294641' : 'ca-app-pub-5775840589825547/7063175872',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        // if ad fails to load
        onAdFailedToLoad: (LoadAdError error) {
          print('Ad exited with error: $error');
        },

        // else
        onAdLoaded: (InterstitialAd ad) {
          setState(() {
            this.myInterstitial = ad; // set the ad equal to the current ad
          });
        },
      ),
    );
  }
  showInterstitialAd() {
    // create callbacks for ad
    myInterstitial.fullScreenContentCallback = FullScreenContentCallback(
      // when dismissed
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(), // go to next page
          ),
        );*/
        ad.dispose(); // dispose of ad
      },

      // if ad fails to show content
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(), // go to next page
          ),
        );*/
        print('$ad onAdFailedToShowFullScreenContent: $error'); // print error
        ad.dispose(); // dispose ad
      },
    );

    myInterstitial.show();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                if (NewsCubit
                    .get(context)
                    .country == 'eg') Text('أخبار اليوم'),
                if (NewsCubit
                    .get(context)
                    .country == 'us')
                  Text('News of the Day'),
                if (NewsCubit
                    .get(context)
                    .country == 'gb')
                  Text('News of the Day'),
                if (NewsCubit
                    .get(context)
                    .country == 'fr')
                  Text('Nouvelles du jour'),
                if (NewsCubit
                    .get(context)
                    .country == 'cn') Text('今日新闻'),
                if (NewsCubit
                    .get(context)
                    .country == 'jp') Text('今日のニュース'),
                if (NewsCubit
                    .get(context)
                    .country == 'it')
                  Text('Novità del giorno'),
                if (NewsCubit
                    .get(context)
                    .country == 'tr')
                  Text('günün haberleri'),
                if (NewsCubit
                    .get(context)
                    .country == 'de')
                  Text('Neuigkeiten des Tages'),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(
                    context,
                    SeacrhScreen(),
                  );
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).changeAppMode();
                },
                icon: Icon(Icons.brightness_4_outlined),
              ),
              IconButton(
                onPressed: () {
                  navigateTo(
                    context,
                    LanguageScreen(),
                  );
                },
                icon: Icon(Icons.language),
              ),
              // IconButton(
              //   onPressed: () {
              //     //navigateTo(context, HomeLayout(),);
              //     fetchOffers();
              //   },
              //   icon: Icon(Icons.shopping_cart_outlined),
              // ),
            ],
          ),
          body: Stack(
            children: [
              cubit.screens[cubit.currentIndex],
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 48.0,
                    child: AdWidget(
                      ad: myBanner,
                    ),
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
              children: [
              if (NewsCubit
                  .get(context)
                  .country == 'us' ||
                  NewsCubit
                      .get(context)
                      .country == 'gb')
                BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  items: cubit.bottomItems,
                  onTap: (index) {
                    cubit.changeBottomNavBar(index);
                  },
                ),
              if (NewsCubit
                  .get(context)
                  .country == 'eg')
                BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  items: cubit.bottomItemsEgypt,
                  onTap: (index) {
                    cubit.changeBottomNavBar(index);
                  },
                ),
              if (NewsCubit
                  .get(context)
                  .country == 'fr')
                BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  items: cubit.bottomItemsFrance,
                  onTap: (index) {
                    cubit.changeBottomNavBar(index);
                  },
                ),
              if (NewsCubit
                  .get(context)
                  .country == 'cn')
                BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  items: cubit.bottomItemsChinese,
                  onTap: (index) {
                    cubit.changeBottomNavBar(index);
                  },
                ),
              if (NewsCubit
                  .get(context)
                  .country == 'jp')
                BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  items: cubit.bottomItemsJapanese,
                  onTap: (index) {
                    cubit.changeBottomNavBar(index);
                  },
                ),
              if (NewsCubit
                  .get(context)
                  .country == 'it')
                BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  items: cubit.bottomItemsItalian,
                  onTap: (index) {
                    cubit.changeBottomNavBar(index);
                  },
                ),
              if (NewsCubit
                  .get(context)
                  .country == 'tr')
                BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  items: cubit.bottomItemsTurkish,
                  onTap: (index) {
                    cubit.changeBottomNavBar(index);
                  },
                ),
              if (NewsCubit
                  .get(context)
                  .country == 'de')
                BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  items: cubit.bottomItemsGerman,
                  onTap: (index) {
                    cubit.changeBottomNavBar(index);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

//   Future fetchOffers() async {
//     final offerings = await PurchaseApi.fetchOffers();
//
//     if (offerings.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('No Plans Found'),
//       ));
//     } else {
//       final offer = offerings.first;
//       print('Offer: $offer');
//       return PurchaseButton(package: offer.lifetime,);
//     }
//   }
// }
//
// class PurchaseButton extends StatelessWidget {
//   final Package package;
//
//   PurchaseButton({Key key, @required this.package}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return RaisedButton(
//       onPressed: () async {
//         try {
//           PurchaserInfo purchaserInfo =
//           await Purchases.purchasePackage(package);
//           var isPro = purchaserInfo.entitlements.all["in_app_payment_test"].isActive;
//           if (isPro) {
//             return HomeScreen();
//           }
//         } on PlatformException catch (e) {
//           var errorCode = PurchasesErrorHelper.getErrorCode(e);
//           if (errorCode == PurchasesErrorCode.purchaseCancelledError) {
//             print("User cancelled");
//           } else if (errorCode == PurchasesErrorCode.purchaseNotAllowedError) {
//             print("User not allowed to purchase");
//           }
//         }
//         return NewsLayout();
//       },
//       child: Text("Buy - (${package.product.priceString})"),
//     );
//   }
// }