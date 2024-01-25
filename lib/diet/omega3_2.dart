import 'package:flutter/material.dart';
import '../app_bar.dart';
import 'create_second_page.dart';

class Omega3V2 extends StatefulWidget {
  const Omega3V2({super.key});

  @override
  State<Omega3V2> createState() => _Omega3V2();
}

class _Omega3V2 extends State<Omega3V2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ''),
      body: Container(
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
              'OMEGA-3',
              doses: false,
              'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9641984/#:~:text=Ingestion%20of%20omega%2D3%20fatty,from%20an%20omega%2D3%20supplement',
              'https://ods.od.nih.gov/factsheets/Omega3FattyAcids-HealthProfessional/#h2',
              RichText(
                text: TextSpan(
                  text: 'Consuming omega-3 fatty acids has been linked to ',
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: size.width / 25,
                    height: 1.2,
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text:
                          'improvements in learning, memory, cognitive well-being, and increased blood flow to the brain',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text:
                            '; furthermore, omega-3 treatments are beneficial, well-tolerated, and pose minimal risks.'),
                  ],
                ),
              ),
              ['Fish and Other Seafood ', 'Nuts and Seeds', 'Plant Oils'],
            ),
          ],
        ),
      ),
    );
  }
}
