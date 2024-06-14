import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'language_level_selection.dart';
import 'package:shared_preferences/shared_preferences.dart';

void nuthin() {}

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
  late SharedPreferences prefs;

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
              style: TextStyle(
                fontSize: widget.width / 16,
                color: const Color.fromARGB(255, 224, 246, 255),
              ),
            ),
          ),
        ),
      ).animate(target: hovered ? 1 : 0).scaleXY(end: 1.1),
    );
  }
}

class RedirectButton extends StatefulWidget {
  final String text;
  final String? tooltip;
  final double width;
  final Widget? route;
  final bool requirement;
  final void Function() onClick;

  const RedirectButton({
    super.key,
    required this.text,
    required this.width,
    this.tooltip,
    this.route,
    this.requirement = true,
    this.onClick = nuthin,
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
          //
          widget.onClick();
          //
          if (widget.route != null) {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => widget.route!,
              ),
            );
          }
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
          color: toRed
              ? Theme.of(context).colorScheme.error
              : hovered
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
        child: widget.tooltip != null
            ? Tooltip(
                message: widget.tooltip!,
                child: Center(
                  child: Text(
                    widget.text,
                    style: TextStyle(fontSize: widget.width / 16),
                  ),
                ),
              )
            : Center(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: widget.width / 16,
                    color: Colors.white,
                  ),
                ),
              ),
      )
          .animate(target: hovered ? 1 : 0)
          .scaleXY(end: 1.05)
          .animate(target: accesible ? 0 : 1)
          .shake(
            hz: 4,
            rotation: 0.15,
            duration: const Duration(milliseconds: 250),
          )
          .scaleXY(end: 1.2),
    );
  }
}

class ImprovementButton extends StatefulWidget {
  final String text;
  final double width;
  final Widget route;
  final String img;

  const ImprovementButton({
    super.key,
    required this.text,
    required this.width,
    required this.route,
    required this.img,
  });

  @override
  State<ImprovementButton> createState() => _ImprovementButtonState();
}

class _ImprovementButtonState extends State<ImprovementButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    //initMemory();
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          Image.asset(
            widget.img,
            height: widget.width / 7.5,
            width: widget.width / 7.5,
          ),
          SizedBox(
            width: widget.width / 16,
          ),
          InkWell(
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
              width: widget.width * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.onPrimary,
                  ],
                  tileMode: TileMode.decal,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow.withOpacity(1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: widget.width / 16,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
