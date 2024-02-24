import 'package:flutter/material.dart';
import 'package:sudoku_dart/sudoku_dart.dart';
import 'dart:math';
import '../app_bar.dart';
import '../your_activities.dart';

class SudokuGame extends StatefulWidget {
  const SudokuGame({super.key});

  @override
  State<SudokuGame> createState() => _SudokuGame();
}

class _SudokuGame extends State<SudokuGame> {
  Sudoku sudoku = Sudoku.generate(Level.expert);

  int? tappedCol, tappedRow;
  List<int> sudoku2 = List<int>.generate(100, (index) => -1);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tappedCol = tappedRow = null;
    sudoku = Sudoku.generate(Level.easy);
  }

  BorderRadius _getBorderRadius(int rowIndex, int colIndex) {
    if (rowIndex == 0 && colIndex == 0) {
      return const BorderRadius.only(topLeft: Radius.circular(15));
    } else if (rowIndex == 0 && colIndex == 8) {
      return const BorderRadius.only(topRight: Radius.circular(15));
    } else if (rowIndex == 8 && colIndex == 0) {
      return const BorderRadius.only(bottomLeft: Radius.circular(15));
    } else if (rowIndex == 8 && colIndex == 8) {
      return const BorderRadius.only(bottomRight: Radius.circular(15));
    } else {
      return BorderRadius.zero;
    }
  }

  GestureDetector buildNumerButton(
      BuildContext context, int indx, int? tappedRow, int? tappedCol) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (tappedRow != null && tappedCol != null) {
          setState(() {
            sudoku2[9 * tappedRow + tappedCol] = indx;
            int cnt = 0;
            for (int i = 0; i < 81; ++i) {
              if (sudoku2[i] != -1 || sudoku.puzzle[i] != -1) {
                ++cnt;
              }
            }
            if (cnt == 81) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const YourActivities(),
                ),
              );
            }
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Colors.white,
              Color.fromARGB(255, 214, 245, 255),
            ],
            tileMode: TileMode.decal,
          ),
          border: Border.all(color: const Color.fromARGB(255, 101, 186, 255)),
        ),
        height: 0.15 * size.width,
        width: 0.15 * size.width,
        child: Center(
          child: Text(
            indx.toString(),
            style: TextStyle(
              fontSize: 0.07 * size.width,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Color color = Theme.of(context).colorScheme.onPrimary;

    return Scaffold(
      appBar: appBar(context, ""),
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 15,
          right: size.width / 15,
          bottom: size.height / 10,
        ),
        child: Column(
          children: [
            SizedBox(height: 0.03 * size.height),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (tappedRow != null && tappedCol != null) {
                        sudoku2[9 * tappedRow! + tappedCol!] = -1;
                      }
                    });
                  },
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        width: 0.1 * min(size.width, size.height),
                        height: 0.1 * min(size.width, size.height),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue[400],
                        ),
                      ),
                      Icon(
                        size: 0.06 * min(size.width, size.height),
                        Icons.backspace,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: 0.1 * min(size.width, size.height),
                      height: 0.1 * min(size.width, size.height),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[400],
                      ),
                    ),
                    Text(
                      "0",
                      style: TextStyle(
                        fontSize: 0.06 * min(size.width, size.height),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 0.03 * size.width),
                Text(
                  "Points",
                  style: TextStyle(
                    fontSize: 0.05 * min(size.width, size.height),
                  ),
                )
              ],
            ),
            Text(
              "Level 1",
              style: TextStyle(
                fontSize: 0.05 * size.width,
              ),
            ),
            SizedBox(height: 0.01 * size.height),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(4, 8),
                  ),
                ],
              ),
              child: Table(
                border: TableBorder.all(
                  width: 0.5,
                  color: const Color.fromARGB(255, 0, 109, 199),
                  borderRadius: BorderRadius.circular(15),
                ),
                children: List.generate(
                  9,
                  (rowIndex) => TableRow(
                    children: List.generate(
                      9,
                      (colIndex) => InkWell(
                        onTap: () {
                          setState(() {
                            tappedCol = colIndex;
                            tappedRow = rowIndex;
                          });
                        },
                        child: Container(
                          height: 0.1 * size.width,
                          width: 0.1 * size.width,
                          decoration: BoxDecoration(
                            color: (tappedCol == colIndex ||
                                    tappedRow == rowIndex)
                                ? (tappedCol == colIndex &&
                                        tappedRow == rowIndex)
                                    ? const Color.fromARGB(255, 177, 232, 250)
                                    : const Color.fromARGB(255, 214, 245, 255)
                                : Theme.of(context).colorScheme.background,
                            borderRadius: _getBorderRadius(rowIndex, colIndex),
                            border: Border(
                              bottom: BorderSide(
                                color: const Color.fromARGB(255, 0, 109, 199),
                                width: (rowIndex == 2 || rowIndex == 5)
                                    ? 2.0
                                    : 0.5,
                              ),
                              right: BorderSide(
                                color: const Color.fromARGB(255, 0, 109, 199),
                                width: (colIndex == 2 || colIndex == 5)
                                    ? 2.0
                                    : 0.5,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              (sudoku.puzzle[9 * rowIndex + colIndex] == -1)
                                  ? (sudoku2[9 * rowIndex + colIndex] == -1)
                                      ? ' '
                                      : '${sudoku2[9 * rowIndex + colIndex]}'
                                  : '${sudoku.puzzle[9 * rowIndex + colIndex]}',
                              style: TextStyle(
                                fontSize: 0.05 * size.width,
                                fontWeight:
                                    (sudoku2[9 * rowIndex + colIndex] == -1)
                                        ? FontWeight.w900
                                        : FontWeight.w300,
                                color: color,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 0.05 * size.height),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                5,
                (index) =>
                    buildNumerButton(context, index + 1, tappedRow, tappedCol),
              ),
            ),
            SizedBox(height: 0.02 * size.height),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 0.07 * size.width),
                ...List.generate(
                  4,
                  (index) => buildNumerButton(
                      context, index + 6, tappedRow, tappedCol),
                ),
                SizedBox(width: 0.07 * size.width),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
