class Question {
  final int? id, answer;
  final String? question;
  final List<String>? options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 2,
    "question": "Which programming language is primarily used for Flutter development?",
    "options": ["Java", "Dart", "Swift", "Python"],
    "answer_index": 1
  },
  {
    "id": 3,
    "question": "In Flutter, what is the purpose of the 'pubspec.yaml' file?",
    "options": [
      "Defining project dependencies",
      "Styling the app",
      "Configuring the device settings",
      "Handling user authentication"
    ],
    "answer_index": 0
  },
  {
    "id": 4,
    "question": "What is the widget in Flutter that represents the structure of the application?",
    "options": ["Layout", "Component", "Container", "Scaffold"],
    "answer_index": 3
  },
  {
    "id": 5,
    "question": "What command is used to run a Flutter app on an emulator or connected device?",
    "options": ["flutter start", "flutter run", "flutter launch", "flutter go"],
    "answer_index": 1
  },
  {
    "id": 6,
    "question": "Which package management tool is used in Flutter for adding external dependencies?",
    "options": ["Gradle", "CocoaPods", "Maven", "Pub"],
    "answer_index": 3
  },
  {
    "id": 7,
    "question": "What is the purpose of the 'setState' method in Flutter?",
    "options": [
      "Update the state of the widget and trigger a rebuild",
      "Define the layout of the widget",
      "Handle user input",
      "Load external data"
    ],
    "answer_index": 0
  },
  {
    "id": 8,
    "question": "Which widget is commonly used for creating a scrollable list of widgets in Flutter?",
    "options": ["ListTile", "ListView", "ScrollView", "Card"],
    "answer_index": 1
  },
  {
    "id": 9,
    "question": "In Dart, what is the purpose of the 'async' and 'await' keywords?",
    "options": [
      "Define constants",
      "Handle exceptions",
      "Create asynchronous code",
      "Perform mathematical calculations"
    ],
    "answer_index": 2
  },
  {
    "id": 10,
    "question": "What is the main function called in a Dart program?",
    "options": ["main()", "start()", "execute()", "begin()"],
    "answer_index": 0
  }
]
;