import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool fromShared})
  {
    if(fromShared != null)
      isDark = fromShared;
    else
      isDark = !isDark;
    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeModeState());
    });
  }

  bool isEgy = false;

  TextDirection changeTextDirection({fromTextDirectionShared})
  {
    //emit(AppChangeTextDirectionState());

    if (fromTextDirectionShared != null)
      isEgy = fromTextDirectionShared;

    CacheHelper.putEgy(key: 'isEgy', value: isEgy).then((value)
    {
      emit(AppChangeTextDirectionState());
    });

    if (isEgy == true)
      return TextDirection.rtl;
    else
      return TextDirection.ltr;



  }
}