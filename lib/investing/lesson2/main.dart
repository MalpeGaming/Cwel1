import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Lesson2 extends StatefulWidget {
  const Lesson2({super.key});

  @override
  State<Lesson2> createState() => _Lesson2();
}

class _Lesson2 extends State<Lesson2> {
  int selectedOption = -1;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  Widget keyVocabulary(String text, String definition) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.020,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          definition,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.020,
          ),
        ),
      ],
    );
  }

  GestureDetector createRecipe(BuildContext context, int q_indx, int index) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      child: Container(
        height: 0.6 * size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
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
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              width: 0.6 * size.width,
              height: 0.6 * size.width,
              'assets/investing/lesson2/ex${q_indx}_$index.png',
            ),
          ),
        ),
      ),
    );
  }

  Widget buildQuizScreen({
    required int questionNumber,
    Widget? image,
  }) {
    List<String> answers = questions[questionNumber]["answers"] as List<String>;
    Size size = MediaQuery.of(context).size;
    ListTile createListTitle(int val, String text, Size size) {
      return ListTile(
        dense: true,
        title: Text(
          text,
          style: TextStyle(fontSize: 0.02 * size.height),
        ),
        leading: Radio<int>(
          value: val,
          groupValue: usersAnswers[questionNumber],
          activeColor: Colors.blue,
          onChanged: (value) {
            setState(() {
              usersAnswers[questionNumber] = value!;
            });
          },
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Exercise ${questionNumber + 1}.",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 0.02 * size.height,
          ),
        ),
        Text(
          questions[questionNumber]["question"] as String,
          style:
              TextStyle(fontSize: MediaQuery.of(context).size.height * 0.020),
        ),
        if (image != null) image,
        SizedBox(height: MediaQuery.of(context).size.height / 70),
        Column(
          children: List.generate(answers.length, (index) {
            return Container(
              child: createListTitle(index, answers[index], size),
            );
          }),
        ),
      ],
    );
  }

  var questions = [
    {
      "question":
          "Graph A shows a linear function, and graph B shows an exponential function.",
      "answers": [
        "true",
        "false",
      ],
      "correctAnswer": 0,
    },
    {
      "question":
          "individual A (Wera) - Wera has a small tutoring company and makes every month \$10k. At the beginning of the year 2020, she had \$5k, assuming that on the x-axis we see months after the beginning of 2020, and on the y-axis we see wealth in thousands, which graph represents this situation best ?",
      "answers": [
        "Graph A",
        "Graph B",
        "Graph C",
        "Graph D",
      ],
    },
    {
      "question":
          "What equation describes the wealth (y) agains time in months (x) of Wera.",
      "answers": [
        "y=5x+5",
        "y=5x",
        "y=10x",
        "y=10x+5",
      ],
    },
    {
      "question":
          "- individual B (Alex) - Alex is a crypto kid, who manages to increase his holdings by 20% every month. At the beginning of the year 2020, he had \$5k, assuming that on the x-axis we see months after the beginning of 2020, and on the y-axis we see wealth in thousands, which graph represents this situation best ?",
      "answers": [
        "Graph A",
        "Graph B",
        "Graph C",
        "Graph D",
      ],
    },
    {
      "question":
          "What equation describes the wealth (y) agains time in months (x) of Alex.",
      "answers": [
        "y=5+1.2x",
        "y=5*(2)^x",
        "y=5*(1.8)^x",
        "y=5*(1.2)^x",
      ],
    },
    {
      "question": "Describe what happens.",
      "answers": [
        "after 20.5 months Wera becomes wealthier than Alex",
        "after 20.5 months Alex becomes wealthier than Wera",
        "after 210 months Wera becomes wealthier than Alex",
        "after 210 months Alex becomes wealthier than Wera",
      ],
    },
  ];

  List<int> usersAnswers = List<int>.filled(7, -1);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
            top: size.height / 15,
            bottom: size.height / 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lesson 1",
                style: TextStyle(
                  fontSize: size.width / 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "Why Should You Invest? continued...",
                style: TextStyle(
                  fontSize: size.width / 15,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "During our previous lesson, I explained the first two reasons, as to why it's worth investing (Beat the inflation; Create Assets), and now I will present the next one :)",
                style: TextStyle(
                  fontSize: size.width / 25,
                ),
              ),
              SizedBox(height: size.height / 20),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: size.height / 100,
              ),
              SizedBox(height: size.height / 20),
              Text(
                "1. The Power of Exponential Growth",
                style: TextStyle(
                  fontSize: size.width / 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 40),
              Text(
                "In high school, you most certainly learned about two main types of functions: we had linear functions and exponential ones - let's see how much you remember :)",
                style: TextStyle(fontSize: size.height * 0.020),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 0,
                image: Column(
                  children: [
                    SizedBox(
                      height: 0.75 * size.width,
                      child: PageView.builder(
                        controller: controller,
                        itemCount: 2,
                        itemBuilder: (_, index) {
                          return createRecipe(context, 1, index % 2);
                        },
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 2,
                        effect: const WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          type: WormType.thinUnderground,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height / 20),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: size.height / 100,
              ),
              SizedBox(height: size.height / 20),
              Text(
                "Okay, so what is the difference ? ",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "A linear function is like taking constant steps, where the change in one variable causes a proportional change in another. For example, if you're walking at a constant speed, the distance you cover over time increases steadily, forming a straight line on a graph. If you are employed in a company and get a fixed wage, then a graph of your wealth against time is a linear function. ",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                ),
              ),
              Text(
                "(y=s*x → y=wealth; s=monthly salary; x= time in months)",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "On the other hand, an exponential function is like taking growing steps. Here, the value of one variable increases or decreases at a constantly increasing rate. For instance, if you have an investment that grows at a fixed percentage rate each year, the amount of money you have will increase rapidly over time, forming a curve that gets steeper and steeper on a graph.",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                ),
              ),
              Text(
                "(y=s*(r)^x → y=wealth; s=initial money investment; r=monthly growth rate; x=time in months)",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "In simpler terms, linear functions increase or decrease steadily, while exponential functions grow or shrink increasingly fast.",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                ),
              ),
              SizedBox(height: size.height / 20),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: size.height / 100,
              ),
              SizedBox(height: size.height / 20),
              Text(
                "So let's figure out, what is a better way to become wealthy : )",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "In order to do that let's assume we have two individuals.",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 1,
                image: Column(
                  children: [
                    SizedBox(
                      height: 0.75 * size.width,
                      child: PageView.builder(
                        controller: controller,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return createRecipe(context, 2, index % 2);
                        },
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 4,
                        effect: const WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          type: WormType.thinUnderground,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 2,
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 3,
                image: Column(
                  children: [
                    SizedBox(
                      height: 0.75 * size.width,
                      child: PageView.builder(
                        controller: controller,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return createRecipe(context, 4, index % 4);
                        },
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 4,
                        effect: const WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          type: WormType.thinUnderground,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 4,
              ),
              SizedBox(height: size.height / 20),
              Text(
                "Alright, so let’s plot these lines on one graph, and compare the financial situation of Wera and Alex.",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 5,
                image: Image.asset(
                  'assets/investing/lesson2/ex6.png',
                ),
              ),
              SizedBox(height: size.height / 20),
              Text(
                "And that will be all for today’s class. Hopefully, right now, you know how we can represent the wealth of an investor (exponential growth) and a typical fixed-wage worker (linear growth). As you can see, though at the beginning a fixed-wage worker will outperform an investor, the scale tips very quickly. Of course, that doesn’t mean you should quit your secure job, but rather it shows the potential investing has.",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
