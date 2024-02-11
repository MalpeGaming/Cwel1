import 'package:brain_train_app/buttons.dart';
import 'package:flutter/material.dart';
import 'improvement_selection.dart';
import 'dart:io';
import 'package:xml/xml.dart';
import 'package:path_provider/path_provider.dart';

class LangCheckList extends StatefulWidget {
  const LangCheckList({
    super.key,
    required this.size,
    required this.onOptionSelected,
  });

  final Size size;
  final Function(int?) onOptionSelected;

  @override
  State<LangCheckList> createState() => _LangCheckList();
}

class _LangCheckList extends State<LangCheckList> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        createListTitle(1, 'B1 - Intermediate'),
        createListTitle(2, 'B2 - Upper-Intermediate'),
        createListTitle(3, 'C1 - Advanced'),
        createListTitle(4, 'Native Speaker'),
      ],
    );
  }

  ListTile createListTitle(int val, String text) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(fontSize: 0.025 * widget.size.height),
      ),
      leading: Radio<int>(
        value: val,
        groupValue: selectedOption,
        activeColor: Colors.blue,
        onChanged: (value) {
          setState(() {
            selectedOption = value;
          });
          widget.onOptionSelected(value);
        },
      ),
    );
  }
}

class LanguageLevelSelection extends StatefulWidget {
  const LanguageLevelSelection(this.title, {super.key});

  final String title;

  @override
  State<LanguageLevelSelection> createState() => _LanguageLevelSelectionState();
}

class _LanguageLevelSelectionState extends State<LanguageLevelSelection> {
  int? selectedOption;

  void writeXML(int selectedOption) async {
    String level;
    switch (selectedOption) {
      case 1:
        level = "pet";
        break;

      case 2:
        level = "fce";
        break;

      case 3:
        level = "cae";
        break;

      case 4:
        level = "cpe";
        break;

      default:
        level = "pet";
    }
    var builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    builder.element(
      'root',
      nest: () {
        builder.element(
          "level",
          nest: () {
            builder.text(level);
          },
        );
      },
    );

    var document =
        XmlDocument.parse(builder.buildDocument().toXmlString(pretty: true));

    var xmlString = document.toXmlString(pretty: true);
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;

    String filePath = '$appDocumentsPath/lang_lev.xml';

    var file = File(filePath);
    file.writeAsStringSync(xmlString);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 40,
          right: size.width / 40,
          top: size.height / 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: size.width / 10,
                right: size.width / 10,
              ),
              child: Text(
                "WHAT IS YOUR CURRENT ENGLISH LEVEL?",
                style: TextStyle(
                  fontSize: size.width / 13,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 0.05 * size.height),
            LangCheckList(
              size: size,
              onOptionSelected: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            const Spacer(flex: 10),
            Center(
              child: SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: RedirectButton(
                  route: const ImprovementSelection(),
                  text: 'Continue',
                  width: size.width,
                  requirement: selectedOption != null,
                  onClick: () {
                    writeXML(selectedOption!);
                  },
                ),
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
