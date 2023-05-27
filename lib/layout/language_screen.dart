import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/modules/info_page.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class LanguageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Country Selection',
        ),
        leading: IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
              Text(
              'Choose Your Country:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black,
              ),
              ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 170.0,
                  color: Colors.indigo,
                  child: TextButton(
                  onPressed: ()
            {
              NewsCubit.get(context).Country(country: 'us',);
              AppCubit.get(context).isEgy = false;
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(
              'News will display for US',
                textAlign: TextAlign.center,
              )));
            },
                  child: Text(
                    'US News',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 170.0,
                  color: Colors.indigo,
                  child: TextButton(
                    onPressed: ()
                    {
                      NewsCubit.get(context).Country(country: 'gb',);
                      AppCubit.get(context).isEgy = false;

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(
                        'News will display for UK',
                        textAlign: TextAlign.center,
                      )));
                    },
                    child: Text(
                      'UK News',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 170.0,
                  color: Colors.indigo,
                  child: TextButton(
                    onPressed: ()
                    {
                      NewsCubit.get(context).Country(country: 'fr',);
                      AppCubit.get(context).isEgy = false;

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(
                        'Les nouvelles s\'afficheront pour la France',
                        textAlign: TextAlign.center,
                      )));
                    },
                    child: Text(
                      'France News',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 170.0,
                  color: Colors.indigo,
                  child: TextButton(
                    onPressed: ()
                    {
                      NewsCubit.get(context).Country(country: 'cn',);
                      AppCubit.get(context).isEgy = false;

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(
                        '新闻将显示在中国',
                        textAlign: TextAlign.center,
                      )));
                    },
                    child: Text(
                      'China News',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 170.0,
                  color: Colors.indigo,
                  child: TextButton(
                    onPressed: ()
                    {
                      NewsCubit.get(context).Country(country: 'jp',);
                      AppCubit.get(context).isEgy = false;

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(
                        '日本向けのニュースが表示されます',
                        textAlign: TextAlign.center,
                      )));
                    },
                    child: Text(
                      'Japan News',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 170.0,
                  color: Colors.indigo,
                  child: TextButton(
                    onPressed: ()
                    {
                      NewsCubit.get(context).Country(country: 'it',);
                      AppCubit.get(context).isEgy = false;

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(
                        'Le novità verranno visualizzate per l\'Italia',
                        textAlign: TextAlign.center,
                      )));
                    },
                    child: Text(
                      'Italy News',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 170.0,
                  color: Colors.indigo,
                  child: TextButton(
                    onPressed: ()
                    {
                      NewsCubit.get(context).Country(country: 'tr',);
                      AppCubit.get(context).isEgy = false;

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(
                        'Türkiye için haberler gösterilecek',
                        textAlign: TextAlign.center,
                      )));
                    },
                    child: Text(
                      'Turkey News',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 170.0,
                  color: Colors.indigo,
                  child: TextButton(
                    onPressed: ()
                    {
                      NewsCubit.get(context).Country(country: 'de',);
                      AppCubit.get(context).isEgy = false;

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(
                        'Nachrichten für Deutschland werden angezeigt',
                        textAlign: TextAlign.center,
                      )));
                    },
                    child: Text(
                      'Germany News',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 170.0,
                  color: Colors.indigo,
                  child: TextButton(
                    onPressed: ()
                    {
                      NewsCubit.get(context).Country(country: 'eg',);
                      AppCubit.get(context).isEgy = true;

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(
                        'سيتم عرض الأخبار لمصر',
                        textAlign: TextAlign.center,
                      )));
                    },
                    child: Text(
                      'Egypt News',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
/*                  Text(
                      'News App\nDeveloped by: Ahmed Elgamal',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),*/
                Container(
                  width: 200.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: TextButton(
                    onPressed: ()
                    {
                      navigateTo(
                        context,
                        InfoPage(),
                      );
                    },
                    child: Text(
                      'Website / Contact',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
