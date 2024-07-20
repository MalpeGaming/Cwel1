import 'package:brain_train_app/attention/long_term_concentration_video.dart';
import 'package:brain_train_app/attention/strong_concentration_desc.dart';
import 'package:brain_train_app/investing/intro.dart';
import 'package:brain_train_app/linguistic/correct_a_word.dart';
import 'package:brain_train_app/linguistic/hangman.dart';
import 'package:brain_train_app/linguistic/listening_comprehension_video.dart';
import 'package:brain_train_app/linguistic/wordly.dart';
import 'package:brain_train_app/memory/faces.dart';
import 'package:brain_train_app/memory/memory_game1.dart';
import 'package:brain_train_app/memory/working_memory.dart';
import 'package:brain_train_app/attention/reading/reading.dart';
import 'package:brain_train_app/linguistic/scrabble.dart';
import 'package:brain_train_app/logical_thinking/sudoku_info.dart';
import 'package:brain_train_app/logical_thinking/2048/game_2048.dart';
import 'package:brain_train_app/well_being/memes.dart';
import 'package:brain_train_app/well_being/meditation/meditation.dart';
import 'package:brain_train_app/well_being/sport.dart';
import 'package:brain_train_app/well_being/yoga.dart';
import 'package:brain_train_app/attention/short_term_concentration.dart';
import 'package:brain_train_app/attention/find_the_number.dart';
import 'package:brain_train_app/linguistic/poems_reading/info.dart';
import 'package:brain_train_app/linguistic/reading_comprehension_info.dart';
import 'package:brain_train_app/linguistic/spelling_mistakes.dart';
import 'package:brain_train_app/linguistic/grammar_mcq_test.dart';
import 'package:brain_train_app/linguistic/choose_best_word.dart';
import 'package:brain_train_app/linguistic/idioms.dart';
import 'package:brain_train_app/logical_thinking/riddles_info.dart';
import 'package:brain_train_app/memory/learning_words/memory.dart';

var memoryList = [
  [
    {const Memory(), 10},
    {const WorkingMemory(), 5},
    {const MemoryGame1(), 5},
    {const Faces(), 5},
    {const LongTermConcentrationVideo(), 10},
  ],
  [
    const Intro(),
    const Reading(),
    const Scrabble(iteration: 1, allPoints: 0),
    const Hangman(),
    const SudokuInfo(),
    const Wordly(),
    const Game2048(),
    const Meditation(),
    const Meme(),
    const Sport(),
    const Yoga(),
  ],
  [
    'Memory',
    'WorkingMemory',
    'MemoryGame1',
    'Faces',
    'LongTermConcentrationVideo',
    'Intro',
    'Reading',
    'Scrabble',
    'Hangman',
    'SudokuInfo',
    'Wordly',
    'Game2048',
    'Meditation',
    'Meme',
    'Sport',
    'Yoga',
  ]
];

var attentionList = [
  [
    {const StrongConcentrationDesc(), 5},
    {const ShortTermConcentration(), 5},
    {const LongTermConcentrationVideo(), 10},
    {const Memory(), 10},
    {const MemoryGame1(), 5},
    {const FindTheNumber(), 5},
  ],
  [
    const Reading(),
    const Scrabble(iteration: 1, allPoints: 0),
    const Hangman(),
    const SudokuInfo(),
    const Wordly(),
    const Game2048(),
    const Intro(),
    const Meditation(),
    const Meme(),
    const Sport(),
    const Yoga(),
  ],
  [
    'StrongConcentrationDesc',
    'ShortTermConcentration',
    'LongTermConcentrationVideo',
    'Memory',
    'MemoryGame1',
    'FindTheNumber',
    'Reading',
    'Scrabble',
    'Hangman',
    'SudokuInfo',
    'Wordly',
    'Game2048',
    'Intro',
    'Meditation',
    'Meme',
    'Sport',
    'Yoga',
  ]
];

var linguisticList = [
  [
    {const Memory(), 10},
    {const Info(), 5},
    {const ReadingComprehensionInfo(), 10},
    {const ListeningComprehensionVideo(), 10},
    {const SpellingMistakes(exerciseId: 0), 5},
    {const CorrectAWord(), 5},
    {const Grammar(exerciseId: 0), 5},
    {const SpellingMistakes(exerciseId: 0), 5},
    {const ChooseBestWord(), 5},
    {const Idioms(), 5},
    {const Scrabble(iteration: 1, allPoints: 0), 5},
    {const Hangman(), 5},
    {const Wordly(), 5},
  ],
  [
    const Reading(),
    const SudokuInfo(),
    const Game2048(),
    const Intro(),
    const Meditation(),
    const Meme(),
    const Sport(),
    const Yoga(),
  ],
  [
    'Memory',
    'Info',
    'ReadingComprehensionInfo',
    'ListeningComprehensionVideo',
    'SpellingMistakes',
    'CorrectAWord',
    'Grammar',
    'SpellingMistakes',
    'ChooseBestWord',
    'Idioms',
    'Scrabble',
    'Hangman',
    'Wordly',
    'Reading',
    'SudokuInfo',
    'Game2048',
    'Intro',
    'Meditation',
    'Meme',
    'Sport',
    'Yoga',
  ]
];

var logicalList = [
  [
    {const StrongConcentrationDesc(), 5},
    {const Riddles(), 10},
    {const Game2048(), 5},
    {const SudokuInfo(), 10},
    {const Info(), 15},
  ],
  [
    const Scrabble(iteration: 1, allPoints: 0),
    const Hangman(),
    const Wordly(),
    const MemoryGame1(),
    const Reading(),
    const Meditation(),
    const Meme(),
    const Sport(),
    const Yoga(),
  ],
  [
    'StrongConcentrationDesc',
    'Riddles',
    'Game2048',
    'SudokuInfo',
    'Info',
    'Scrabble',
    'Hangman',
    'Wordly',
    'MemoryGame1',
    'Reading',
    'Meditation',
    'Meme',
    'Sport',
    'Yoga',
  ]
];

var gamesList = [
  [
    {const Scrabble(iteration: 1, allPoints: 0), 5},
    {const Hangman(), 5},
    {const Wordly(), 5},
    {const Game2048(), 5},
    {const SudokuInfo(), 5},
    {const FindTheNumber(), 5},
    {const MemoryGame1(), 5},
  ],
  [
    const Reading(),
    const Info(),
    const Meditation(),
    const Meme(),
    const Sport(),
    const Yoga(),
  ],
  [
    'Scrabble',
    'Hangman',
    'Wordly',
    'Game2048',
    'SudokuInfo',
    'FindTheNumber',
    'MemoryGame1',
    'Reading',
    'Info',
    'Meditation',
    'Meme',
    'Sport',
    'Yoga',
  ]
];

var skillLists = {
  'memory': memoryList[2],
  'attention': attentionList[2],
  'linguistic': linguisticList[2],
  'logical': logicalList[2],
  'games': gamesList[2],
};
