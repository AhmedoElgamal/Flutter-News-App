import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {

  launchURL() async {
    const url = 'https://ahmedoelgamal.weebly.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchMailMe() async {
    final mailtoLink = Mailto(
      to: ['contactahmedelgamal@gmail.com'],
    );
    await launch('$mailtoLink');
  }

  launchMailApiNews() async {
    final mailtoLink = Mailto(
      to: ['support@newsapi.org'],
    );
    await launch('$mailtoLink');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Information',
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
                    height: 50.0,
                  ),
                  Text(
                    'News App\n'
                        'Developed by: Ahmed Elgamal'
                        '\n\n\n\n\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '\nProvider of News Email: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: ()
                    {
                      launchMailApiNews();
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    child: Text(
                      'support@newsapi.org',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Text(
                    '\nMy Email: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: ()
                    {
                      launchMailMe();
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    child: Text(
                      'contactahmedelgamal@gmail.com\n',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  Text(
                    '(External Link) My Website:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: ()
                    {
                      launchURL();
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    child: Text(
                      'www.ahmedoelgamal.ga',
                      style: TextStyle(fontSize: 22),
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
