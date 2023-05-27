import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:news_app/layout/language_screen.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/main.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/health/health_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/settings_screen/settings_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/modules/technology/technology_screen.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.devices_rounded,
      ),
      label: 'Technology',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.health_and_safety,
      ),
      label: 'Health',
    ),
  ];

  List<BottomNavigationBarItem> bottomItemsEgypt =
  [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'اقتصاد',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'رياضة',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'علوم',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.devices_rounded,
      ),
      label: 'تكنولوجيا',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.health_and_safety,
      ),
      label: 'صحة',
    ),
  ];

  List<BottomNavigationBarItem> bottomItemsFrance =
  [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Entreprise',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'sport',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.devices_rounded,
      ),
      label: 'technologie',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.health_and_safety,
      ),
      label: 'Santé',
    ),
  ];

  List<BottomNavigationBarItem> bottomItemsChinese =
  [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: '商业',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: '运动',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: '科学',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.devices_rounded,
      ),
      label: '技术',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.health_and_safety,
      ),
      label: '健康',
    ),

  ];

  List<BottomNavigationBarItem> bottomItemsJapanese =
  [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: '仕事',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'スポーツ',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: '化学',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.devices_rounded,
      ),
      label: 'テクノロジー',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.health_and_safety,
      ),
      label: '健康',
    ),
  ];

  List<BottomNavigationBarItem> bottomItemsItalian =
  [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Affare',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sport',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Scienza',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.devices_rounded,
      ),
      label: 'Tecnologia',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.health_and_safety,
      ),
      label: 'Salute',
    ),
  ];

  List<BottomNavigationBarItem> bottomItemsTurkish =
  [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'İşletme',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Spor',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Bilim',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.devices_rounded,
      ),
      label: 'teknoloji',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.health_and_safety,
      ),
      label: 'sağlık',
    ),
  ];

  List<BottomNavigationBarItem> bottomItemsGerman =
  [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Geschäft',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sport',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Wissenschaft',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.devices_rounded,
      ),
      label: 'Technologie',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.health_and_safety,
      ),
      label: 'Gesundheit',
    ),
  ];

  List<Widget> screens =
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    TechnologyScreen(),
    HealthScreen(),
    //SettingsScreen(),
  ];

  List<dynamic> business = [];

  int key = 0;
  String country;
  String api;

  void countrySelection({String countryFromShared})
  {
    if(countryFromShared != null)
      country = countryFromShared;
    else if (country != null)
      country = country;
    else
      country = 'us';
  }



  String randomAPI()
  {
    List<String> api = ['e7b893a08281484a97275deffb4e1bc9',
      '3c18a6bcd65f4f8089940e4ac9fece40',
      'e4cedce1a0214b49bad139073f35bac3',
    'f5d2bea2697e4c758b9e31fd0dcfc0ad',
    'c5eff88e1f53499892e99cd527d3d6f0',
    '01373be6bd6f42678aad8fb6dade6f8b',
    '51e6cc1c980d443bb6200339c4502a9f',
    'babb4a2c6d804dcb9cf66ce536e10bcb',
    'cb09b21d2a3d45758c377bb56ee80297',
    'dd74932364ec467ca693c419f081e52d',
    '9c43871c22f148f08ffd6648224af284',
      '8b9ff4c3ad044deaa53aa001c764e390',
      '6e21dd8475d24baa8c9cda393d19814e',

    'efe851f516e443aea9512fb5915cf13a',
    'bf31e1641c424956b5bc3a9e18c3769c',
    '507a4f2654004501b4314a873a657d74',
    'df9536cbb33341b19839f0092dffe3f2',
    '9fe1110b674d42a8b0dd6845bb21a7c9',
      '3068921055f04676b39556942ad3d9e5',
      '657e7e5e1a8049c485a9828c3d3959f0',
      '6f3360f901f14c38b30c84edc420b538',
      'd69371b3a4a44127aa0b0c9289ad937d',
      '30a28f49c92f450d84313c8a3d7697c0',
    ];

    final random = new Random();
    var i = random.nextInt(api.length);
    print(api[i]);

    return api[i];
  }


  void getBusiness()
  {
    api=randomAPI();
    countrySelection();

    callBusiness(
        api: api,
      country: country,
    );

  }

  void callBusiness({
  @required String api,
    @required String country,
})
  {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'source': 'source',
          'author':'author',
          'country':'$country',
          'category':'business',
          'apiKey': '$api',
        }
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
      api=randomAPI();
      getBusiness();
    });
  }

  List<dynamic> sports = [];

  void getSports()
  {
    callSports(
        api: api,
        country: country,
    );
  }

  void callSports({
  @required String api,
    @required String country,
})
  {
    emit(NewsGetSportsLoadingState());

      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'source': 'source',
            'author':'author',
            'country':'$country',
            'category':'sports',
            'apiKey':'$api',
          }
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);

        emit(NewsGetSportsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
  }

  List<dynamic> science = [];

  void getScience()
  {
    callScience(
        api: api,
        country: country,
    );
  }

  void callScience({
  @required String api,
    @required String country,
})
  {
    emit(NewsGetScienceLoadingState());

      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'source': 'source',
            'author':'author',
            'country':'$country',
            'category':'science',
            'apiKey':'$api',
          }
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
  }

  List<dynamic> technology = [];

  void getTechnology()
  {
    callTechnology(
        api: api,
        country: country,
    );
  }

  void callTechnology({
  @required String api,
    @required String country,
})
  {
    emit(NewsGetTechnologyLoadingState());

      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'source': 'source',
            'author':'author',
            'country':'$country',
            'category':'technology',
            'apiKey':'$api',
          }
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        technology = value.data['articles'];
        print(technology[0]['title']);

        emit(NewsGetTechnologySuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetTechnologyErrorState(error.toString()));
      });

  }

  List<dynamic> health = [];

  void getHealth()
  {
    callHealth(
      api: api,
      country: country,
    );
  }

  void callHealth({
    @required String api,
    @required String country,
  })
  {
    emit(NewsGetHealthLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'source': 'source',
          'author':'author',
          'country':'$country',
          'category':'health',
          'apiKey':'$api',
        }
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      health = value.data['articles'];
      print(health[0]['title']);

      emit(NewsGetHealthSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetHealthErrorState(error.toString()));
    });

  }

  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'$value',
          'apiKey':'$api',
        }
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);

      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  void Country({
  @required String country,
})
  {
    this.country = country;

    CacheHelper.saveCountry(key: 'country', value: this.country).then((value)
    {
      emit(NewsChangeCountryState());
    });

    //countrySelection();

    callBusiness(api: '$api', country: '${this.country}',);
    callSports(api: '$api', country: '${this.country}',);
    callScience(api: '$api', country: '${this.country}',);
    callTechnology(api: '$api', country: '${this.country}',);
    callHealth(api: '$api', country: '${this.country}',);

    print(api);


  }


  void changeBottomNavBar (int index)
  {
    currentIndex = index;
    if (index == 1)
      getSports();
    if (index == 2)
      getScience();
    if (index == 3)
      getTechnology();
    if (index == 4)
      getHealth();
    emit(NewsBottomNavState());
  }




  InterstitialAd myInterstitial;

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
          emit(NewsOnAdLoaded());
          this.myInterstitial = ad; // set the ad equal to the current ad
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
}

