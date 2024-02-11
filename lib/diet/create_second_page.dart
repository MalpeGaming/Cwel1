import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bulleted_list/bulleted_list.dart';

createSecondPage(BuildContext context, String title, String link, String link2,
    RichText text, List<String> list,
    {bool doses = false,
    String dosesLink = 'https://www.our_future_page.com',
    RichText? txt,
    String? funcText,}) {
  if (funcText != null) {
    funcText = 'FUNCTION $funcText';
  } else {
    funcText = 'FUNCTION';
  }
  Size size = MediaQuery.of(context).size;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: size.width / 9,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              "SHORT GUIDE",
              style: TextStyle(fontSize: size.width / 20),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      SizedBox(height: 0.04 * size.height),
      if (doses)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('RECOMMENDED DOSES',
                style: TextStyle(fontSize: size.width / 22),),
            Text(
              'Data Source: ',
              style: TextStyle(
                  fontSize: size.width / 30, fontWeight: FontWeight.bold,),
            ),
            InkWell(
              child: Text(
                dosesLink,
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: 0.01 * size.height,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onTap: () => launchUrl(Uri.parse(link2)),
            ),
            SizedBox(height: 0.03 * size.height),
            txt!,
            SizedBox(height: 0.03 * size.height),
          ],
        ),
      Text(
        funcText,
        style: TextStyle(fontSize: size.width / 22),
      ),
      Text(
        'Data Source: ',
        style:
            TextStyle(fontSize: size.width / 30, fontWeight: FontWeight.bold),
      ),
      InkWell(
        child: Text(
          link,
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            fontSize: 0.01 * size.height,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
        ),
        onTap: () => launchUrl(Uri.parse(link)),
      ),
      SizedBox(height: 0.03 * size.height),
      text,
      SizedBox(height: 0.05 * size.height),
      Text(
        'NATURAL SOURCES',
        style: TextStyle(fontSize: size.width / 22),
      ),
      Text(
        'Data Source: ',
        style:
            TextStyle(fontSize: size.width / 30, fontWeight: FontWeight.bold),
      ),
      InkWell(
        child: Text(
          link2,
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            fontSize: 0.01 * size.height,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
        ),
        onTap: () => launchUrl(Uri.parse(link2)),
      ),
      SizedBox(height: 0.03 * size.height),
      BulletedList(
        bullet: Icon(
          Icons.check_circle,
          color: Theme.of(context).colorScheme.primary,
        ),
        listItems: list,
        style: TextStyle(
          fontSize: 0.025 * size.height,
          color: Colors.black,
        ),
      ),
    ],
  );
}
