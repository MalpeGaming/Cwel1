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
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
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
      ).animate(target: hovered ? 1 : 0)
        .scaleXY(end: 1.1)
    );
  }
}

class RedirectButton extends StatefulWidget {
  final String text;
  final String? tooltip;
  final double width;
  final Widget route;
  final bool requirement;

  const RedirectButton({
    super.key,
    required this.text,
    required this.width,
    this.tooltip,
    required this.route,
    this.requirement = true,
  });

  @override
  State<RedirectButton> createState() => _RedirectButtonState();
}

class _RedirectButtonState extends State<RedirectButton> {
  bool hovered = false; 
  bool accesible = true;
  bool toRed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        if (widget.requirement) {
          setState(() {
            hovered = value;
          });
        }
      },

      onTap: () {
        if (widget.requirement) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget.route,
            ),
          );
        } else if (!toRed) {
          setState(() {
            accesible = false;
            toRed = true;
          });
          Future.delayed(const Duration(milliseconds: 250), () {
            setState(() {
              accesible = true;
            });
          });

          Future.delayed(const Duration(milliseconds: 650), () {
            setState(() {
              toRed = false;
            });
          });
        }
      },

      child: Container(
        decoration: BoxDecoration(
          color: toRed ? 
            Theme.of(context).colorScheme.error :
            hovered
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.primary,
            
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: widget.tooltip != null ? Tooltip(
          message: widget.tooltip,
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(fontSize: widget.width / 16),
            ),
          ),
        ) : Center(
            child: Text(
              widget.text,
              style: TextStyle(fontSize: widget.width / 16),
            ),
          ),
      ).animate(target: hovered ? 1 : 0)
        .scaleXY(end: 1.05)
      .animate(target: accesible ? 0 : 1)
        .shake(hz: 4, rotation: 0.15, duration: const Duration(milliseconds: 250))
        .scaleXY(end: 1.2)
    );
  }
}


class ImprovementButton extends StatefulWidget {
  final String text;
  final double width;
  final Widget route;
  final String imagePath;
  final double height;

  const ImprovementButton({
    super.key,
    required this.text,
    required this.width,
    required this.route,
    required this.imagePath,
    required this.height,
  });

  @override
  State<ImprovementButton> createState() => _ImprovementButtonState();
}

class _ImprovementButtonState extends State<ImprovementButton> {
  bool hovered = false; 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          hovered = value;
        });
      },

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget.route,
          ),
        );
      },

      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('path_to_your_image'),
            fit: BoxFit.cover,
          ),
          color: hovered
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(widget.width * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                widget.imagePath,
                width: widget.width / 10,
                height: widget.height / 10,
              ),
              const Spacer(),
              RichText(
                text: TextSpan(
                  text: widget.text,
                  style: TextStyle(
                    fontSize: widget.width / 16,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ).animate(target: hovered ? 1 : 0)
        .scaleXY(end: 1.05)
    );
  }
}