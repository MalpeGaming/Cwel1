var equations = [
  ["13.4 + 7.2", 20.6],
  ["29 + 16", 45.0],
  ["45 + 22", 67.0],
  ["37 + 48", 85.0],
  ["51 + 18", 69.0],
  ["64 + 39", 103.0],
  ["76.5 + 61.2", 137.7],
  ["83 + 47", 130.0],
  ["92 + 56", 148.0],
  ["105 + 92", 197.0],
  ["117 + 83", 200.0],
  ["128 + 105", 233.0],
  ["143 + 76", 219.0],
  ["156 + 92", 248.0],
  ["167 + 111", 278.0],
  ["19 + 128", 147.0],
  ["187 + 144", 331.0],
  ["198 + 17", 215.0],
  ["11 + 185", 196.0],
  ["224 + 19", 243.0],
  ["236 + 222", 458.0],
  ["29 + 238", 267.0],
  ["257 + 257", 514.0],
  ["269 + 25", 294.0],
  ["276 + 302", 578.0],
  ["28 + 331", 359.0],
  ["295 + 39", 334.0],
  ["307 + 402", 709.0],
  ["39 + 441", 480.0],
  ["326 + 486", 812.0],
  ["341 + 527", 868.0],
  ["356 + 53", 409.0],
  ["368 + 617", 985.0],
  ["375 + 666", 1041.0],
  ["391 + 714", 1105.0],
  ["47 + 769", 816.0],
  ["419 + 821", 1240.0],
  ["432 + 86", 518.0],
  ["447 + 928", 1375.0],
  ["49 + 87", 136.0],
  ["473 + 103", 576.0],
  ["488 + 196", 684.0],
  ["501 + 1156", 1657.0],
  ["516 + 1213", 1729.0],
  ["52 + 177", 229.0],
  ["54 + 140", 194.0],
  ["559 + 140", 699.0],
  ["571 + 146", 717.0],
  ["586 + 160", 746.0],
  ["599 + 169", 768.0],
  ["614 + 125", 739.0],
  ["629 + 118", 747.0],
  ["641 + 119", 760.0],
  ["658 + 226", 884.0],
  ["61 + 219", 280.0],
  ["686 + 2252", 2938.0],
  ["699 + 271", 970.0],
  ["75 + 2496", 2571.0],
  ["729 + 227", 956.0],
  ["742 + 274", 1016.0],
  ["32 - 17", 15.0],
  ["42 - 25", 17.0],
  ["58 - 43", 15.0],
  ["76 - 51", 25.0],
  ["89 - 62", 27.0],
  ["95 - 73", 22.0],
  ["68 - 29", 39.0],
  ["88 - 47", 41.0],
  ["79 - 54", 25.0],
  ["94 - 67", 27.0],
  ["47 - 23", 24.0],
  ["59 - 34", 25.0],
  ["85 - 51", 34.0],
  ["97 - 76", 21.0],
  ["73 - 41", 32.0],
  ["81 - 63", 18.0],
  ["69 - 47", 22.0],
  ["56 - 29", 27.0],
  ["38 - 17", 21.0],
  ["66 - 42", 24.0],
  ["72 - 48", 24.0],
  ["89 - 67", 22.0],
  ["94 - 79", 15.0],
  ["57 - 24", 33.0],
  ["82 - 56", 26.0],
  ["99 - 71", 28.0],
  ["64 - 31", 33.0],
  ["53 - 26", 27.0],
  ["76 - 55", 21.0],
  ["88 - 69", 19.0],
  ["47 - 18", 29.0],
  ["68 - 35", 33.0],
  ["75 - 42", 33.0],
  ["89 - 79", 10.0],
  ["63 - 51", 12.0],
  ["72 - 64", 8.0],
  ["96 - 86", 10.0],
  ["59 - 32", 27.0],
  ["81 - 59", 22.0],
  ["95 - 79", 16.0],
  ["78 - 42", 36.0],
  ["86 - 63", 23.0],
  ["94 - 85", 9.0],
  ["66 - 33", 33.0],
  ["53 - 27", 26.0],
  ["77 - 49", 28.0],
  ["84 - 68", 16.0],
  ["98 - 89", 9.0],
  ["63 - 52", 11.0],
  ["75 - 63", 12.0],
  ["91 - 75", 16.0],
  ["67 - 35", 32.0],
  ["57 - 23", 34.0],
  ["89 - 72", 17.0],
  ["95 - 84", 11.0],
  ["76 - 59", 17.0],
  ["83 - 78", 5.0],
  ["98 - 92", 6.0],
  ["64 - 53", 11.0],
  ["78 - 67", 11.0],
  ["5 x 3", 15.0],
  ["8 x 4", 32.0],
  ["12 x 9", 108.0],
  ["7.5 + 6.2", 13.7],
  ["3 x 2", 6.0],
  ["4 / 5", 0.8],
  ["6 x 8", 48.0],
  ["9 x 7/3", 21.0],
  ["13 x 4", 52.0],
  ["6 x 9", 54.0],
  ["2 x 6", 12.0],
  ["5.3 + 7.2", 12.5],
  ["8 / 2", 4.0],
  ["14 x 6", 84.0],
  ["7 x 9", 63.0],
  ["6 x 3 x 2", 36.0],
  ["3 x 7", 21.0],
  ["5 x 14", 70.0],
  ["9 x 6", 54.0],
  ["10 % from 345", 34.5],
  ["4 x 8", 32.0],
  ["2.4 x 3", 7.2],
  ["6 x 7", 42.0],
  ["8 x 6.1", 48.8],
  ["3 x 5", 15.0],
  ["15 % from 600", 90.0],
  ["5 x 9.2", 46.0],
  ["7 x 13", 91.0],
  ["4.7 x 2", 9.4],
  ["20 % from 500", 100.0],
  ["2 x 8", 16.0],
  ["9 x 24/2", 108.0],
  ["3/6", 0.5],
  ["8 x 7", 56.0],
  ["5.3 x 6", 31.8],
  ["7 x 8", 56.0],
  ["4 x 9", 36.0],
  ["2 x 7.2", 14.4],
  ["6 x 4", 24.0],
  ["9 x 5", 45.0],
  ["3 x 3 x 3 x 3", 81.0],
  ["8 x 9", 72.0],
  ["5.4 x 8", 43.2],
  ["7 x 17", 119.0],
  ["4 x 4.5", 18.0],
  ["6 x 6", 36.0],
  ["9 x 18", 162.0],
  ["0.3 x 9", 2.7],
  ["8.2 x 5", 41.0],
  ["x + 5 = 9", 4.0],
  ["3x - 2 = 10", 4.0],
  ["2(x + 3) = 16", 5.0],
  ["9 x 3", 27.0],
  ["4x - 7 = 25", 8.0],
  ["5(x - 4) = 35", 11.0],
  ["6x + 9 = 45", 6.0],
  ["2x + 3 = 15", 6.0],
  ["4(x - 2) = 24", 8.0],
  ["7x - 5 = 33", 7.0],
  ["8(x + 4) = 72", 5.0],
  ["3x + 4 = 19", 5.0],
  ["5(x - 3) = 40", 11.0],
  ["4x - 6 = 22", 7.0],
  ["6(x + 2) = 42", 5.0],
  ["9x + 8 = 62", 6.0],
  ["2x - 3 = 11", 7.0],
  ["7(x + 1) = 42", 6.0],
  ["5x - 4 = 36", 8.0],
  ["6(x - 5) = 30", 10.0],
  ["3x + 7 = 22", 5.0],
  ["8x - 2 = 34", 4.5],
  ["4(x + 3) = 40", 7.0],
  ["2x - 5 = 17", 11.0],
  ["9(x - 2) = 63", 9.0],
  ["6x + 4 = 46", 7.0],
  ["5(x + 2) = 45", 7.0],
  ["3x - 6 = 33", 13.0],
  ["7(x - 3) = 35", 8.0],
  ["4x + 2 = 18", 4.0],
  ["8(x + 1) = 64", 7.0],
];
