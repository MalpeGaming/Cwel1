import 'package:flutter/material.dart';
import 'create_second_page.dart';
import '../app_bar.dart';

class Antioxidants extends StatefulWidget {
  const Antioxidants({super.key});

  @override
  State<Antioxidants> createState() => _Antioxidants();
}

class _Antioxidants extends State<Antioxidants> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ''),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
            bottom: size.height / 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createSecondPage(
                context,
                'ANTIOXIDANTS',
                doses: true,
                dosesLink:
                    'https://nutritionfacts.org/blog/how-to-get-enough-antioxidants-each-day/#:~:text=We%20need%20to%20get%20a,of%20fruits%20and%20vegetables%2C%20right%3F',
                txt: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: size.width / 20,
                      height: 1.2,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Minimum 8-11 000 units / day.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                'https://www.nature.com/articles/nrn2421',
                'https://www.healthline.com/nutrition/foods-high-in-antioxidants',
                RichText(
                  text: TextSpan(
                    text: 'Delays cognitive decline.',
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: size.width / 25,
                      height: 1.2,
                    ),
                  ),
                ),
                ['Berries ', 'Coca', 'Kale', 'Citrus - Fruits'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
