import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSumbit,
  Function onChange,
  Function onTap,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool isClickable = true,
  bool readOnly = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      readOnly: readOnly,
      onFieldSubmitted: onSumbit,
      onTap: onTap,
      onChanged: onChange,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        fillColor: Colors.white54,
        filled: true,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

int count = 3;

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        count--;
        if (count == 1) NewsCubit.get(context).createInterstitialAd();
        if (count == 0) {
          count = 4;
          NewsCubit.get(context).showInterstitialAd();
        }
        navigateTo(
          context,
          WebViewScreen(article['url']),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 140.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: NewsCubit.get(context).country == 'eg' ? 148.0 : 130.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      article['source']['name'] == null ? '' : '${article['source']['name']}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      article['author'] == null ? '' : '${article['author']}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
        end: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
