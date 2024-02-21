import 'package:flutter/material.dart';
import 'package:sudoku_dart/sudoku_dart.dart';
import '../app_bar.dart';

class SudokuGame extends StatefulWidget {
  const SudokuGame({super.key});

  //static Sudoku sudoku = Sudoku.generate(Level.expert);

  @override
  State<SudokuGame> createState() => _SudokuGame();
}

int? tappedCol, tappedRow;

class _SudokuGame extends State<SudokuGame> {
  Sudoku sudoku = Sudoku.generate(Level.expert);

  @override
  void initState() {
    super.initState();
    //sudoku2 = SudokuGame.sudoku;
    sudoku = Sudoku.generate(Level.expert);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Place the logic to refresh the widget here
    sudoku = Sudoku.generate(Level.expert);
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
            SizedBox(height: 0.05 * size.height),
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
                                  ? ' '
                                  : '${sudoku.puzzle[9 * rowIndex + colIndex]}',
                              style: TextStyle(
                                fontSize: 0.05 * size.width,
                                fontWeight: FontWeight.bold,
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
          ],
        ),
      ),
    );
  }
}
