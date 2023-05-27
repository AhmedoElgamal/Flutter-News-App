
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';
import 'package:news_app/shared/cubit/app_states.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:provider/provider.dart';
import 'layout/home_screen.dart';
import 'layout/news_layout.dart';
import 'layout/provider_model.dart';
import 'layout/purchase_api.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  //InAppPurchaseConnection.enablePendingPurchases();
  // await PurchaseApi.init();

  await MobileAds.initialize();
  // MobileAds.setTestDeviceIds(['9345804C1555408KGF9C250758896']); //TEST
  // final AppOpenAd appOpenAd = AppOpenAd();
  // if (!appOpenAd.isAvailable)
  //   //await appOpenAd.load(unitId: 'ca-app-pub-5775840589825547/7700651881');
  //   await appOpenAd.load(unitId: MobileAds.appOpenAdTestUnitId); //TEST
  // if (appOpenAd.isAvailable) {
  //   await appOpenAd.show();
  // }

  //final initFuture = MobileAds.instance.initialize();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getBoolean(key: 'isDark');

  String country=CacheHelper.getCountry(key: 'country');

  bool isEgy = CacheHelper.getBoolean(key: 'isEgy');

  // runApp(ChangeNotifierProvider(
  //   create:(context) => ProviderModel(),
  //     child: MyApp(isDark,country,isEgy)));

  runApp(MyApp(isDark,country,isEgy));
}

class MyApp extends StatefulWidget {

  final bool isDark;
  final String country;
  final bool isEgy;

  MyApp(this.isDark, this.country, this.isEgy);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // @override
  // void dispose() {
  //   var provider = Provider.of<ProviderModel>(context, listen: false);
  //   provider.subscription.cancel();
  //   super.dispose();
  // }
  //
  // @override
  // void initState() {
  //   var provider = Provider.of<ProviderModel>(context, listen: false);
  //   provider.initialize();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => NewsCubit()..countrySelection(countryFromShared: widget.country,)..getBusiness()),
        BlocProvider(create: (BuildContext context) => AppCubit()..changeAppMode(fromShared: widget.isDark,)..changeTextDirection(fromTextDirectionShared: widget.isEgy)),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: Colors.white,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                bodyText2: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                bodyText2: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            themeMode: AppCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
            home: Directionality(
              textDirection: AppCubit.get(context).changeTextDirection(),
              child: NewsLayout(),
            ),
          );
        },
      ),
    );
  }
}
