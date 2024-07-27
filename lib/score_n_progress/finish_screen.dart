import 'package:flutter/material.dart';
import '../buttons.dart';
import '../app_bar.dart';

class Finish extends StatefulWidget {
  final Widget route;
  const Finish({
    required this.route,
    super.key,
  });

  @override
  State<Finish> createState() => _Finish();
}

class _Finish extends State<Finish> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //print(widget.minutes.toString());

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  const AssetImage("assets/investing/success_background.gif"),
              fit: BoxFit.cover,
              opacity: ((Theme.of(context).brightness == Brightness.dark)
                  ? 0.3
                  : 0.4),
            ),
          ),
          child: Column(
            children: [
              appBar(context, ""),
              Container(
                margin: EdgeInsets.only(
                  left: size.width / 10,
                  right: size.width / 10,
                  top: size.height / 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "CONGRATS",
                      style: TextStyle(fontSize: 0.1 * size.width),
                    ),
                    SizedBox(
                      height: 0.01 * size.height,
                    ),
                    Text("You have just finished",
                        style: TextStyle(fontSize: 0.05 * size.width),),
                    SizedBox(height: 0.01 * size.height),
                    Text("your 30 day",
                        style: TextStyle(fontSize: 0.05 * size.width),),
                    SizedBox(height: 0.01 * size.height),
                    Text("Brain Improvement Program",
                        style: TextStyle(fontSize: 0.05 * size.width),),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: RedirectButton(
                    route: widget.route,
                    text: 'Begin The Final Test',
                    width: size.width,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
