import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'language_level_selection.dart';

class StartButton extends StatefulWidget {
  final String text;
  final String tooltip;
  final double width;

  const StartButton({
    super.key,
    required this.text,
    required this.width,
    required this.tooltip,
  });

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  bool hovered = false; 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LanguageLevelSelection(
              widget.text,
            ),
          ),
        );
      },

      onHover: (value) {
        setState(() {
          hovered = value;
        });
      },

      child: Container(
        decoration: BoxDecoration(
          color: hovered
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Tooltip(
          message: widget.tooltip,
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(fontSize: widget.width / 16),
            ),
          ),
        ),
      ).animate(
      ),
    );
  }
}
