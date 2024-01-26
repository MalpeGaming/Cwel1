import 'package:flutter/material.dart';
import 'create_second_page.dart';
import '../app_bar.dart';

class Flavonoids extends StatefulWidget {
  const Flavonoids({super.key});

  @override
  State<Flavonoids> createState() => _Flavonoids();
}

class _Flavonoids extends State<Flavonoids> {
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
                'FLAVONOIDS',
                doses: true,
                dosesLink:
                    'https://www.health.harvard.edu/mind-and-mood/the-thinking-on-flavonoids',
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
                        text: 'Five to nine servings',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' of fruits andvegetables a day.'),
                    ],
                  ),
                ),
                'https://www.nature.com/articles/nrn2421',
                'https://www.health.harvard.edu/mind-and-mood/the-thinking-on-flavonoids',
                RichText(
                  text: TextSpan(
                    text: 'Ammelioration of cognitive functions.',
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: size.width / 25,
                      height: 1.2,
                    ),
                  ),
                ),
                ['Berries ', 'Coca', 'Herbs', 'Citrus - Fruits'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
