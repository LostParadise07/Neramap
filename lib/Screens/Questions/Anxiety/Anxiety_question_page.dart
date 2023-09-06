import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:neuramap/Screens/home/mainpage.dart';
import 'package:neuramap/services/database.dart';
import 'AnxietyQuestions.dart';

class AnxietyQuestionWidget extends StatefulWidget {
  const AnxietyQuestionWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DepressionQuestionWidgetState createState() =>
      _DepressionQuestionWidgetState();
}

class _DepressionQuestionWidgetState extends State<AnxietyQuestionWidget> {
  List<bool> selectedOptions = List<bool>.filled(6, false);
  int currentQuestionIndex = 0;
  EmojiParser emojiParser = EmojiParser();
  bool isOptionSelected = false;
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final question = AnxietyQuestions.questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 161, 193, 243),
      appBar: AppBar(
        title: const Text('Anxiety Test'),
        backgroundColor: const Color.fromARGB(255, 102, 5, 144),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 5.0,
                    right: 10.0,
                    child: Container(
                      width: 70.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(150, 13, 13, 13),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: LinearProgressIndicator(
                          value: (currentQuestionIndex + 1) /
                              AnxietyQuestions.questions.length,
                          backgroundColor: Colors.transparent,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(255, 102, 5, 144)),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        question.questionText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: question.options.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOptions = List<bool>.filled(
                                    question.options.length, false);
                                selectedOptions[index] = true;
                                isOptionSelected = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedOptions[index]
                                    ? Colors.green
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    emojiParser.emojify(getEmoji(index)),
                                    style: const TextStyle(fontSize: 30),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(question.options[index],
                                      style: const TextStyle(fontSize: 14),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 161, 193, 243),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (currentQuestionIndex > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentQuestionIndex--;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 102, 5, 144), // Custom background color
                    ),
                    child: const Text('Prev'),
                  ),
                if (currentQuestionIndex <
                    AnxietyQuestions.questions.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      if (!selectedOptions.contains(true)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please select an option before proceeding.'),
                          ),
                        );
                        return;
                      }
                      DataBaseServices(uid: currentUser!.uid).updateAnxietyData(
                        currentQuestionIndex,
                        selectedOptions.indexOf(true),
                      );
                      setState(() {
                        currentQuestionIndex++;
                        selectedOptions =
                            List<bool>.filled(question.options.length, false);
                        isOptionSelected = false;
                      });
                    }, // Disable the button if no option is selected
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 102, 5, 144), // Custom background color
                    ),

                    child: const Text('Next'),
                  ),
                if (currentQuestionIndex ==
                    AnxietyQuestions.questions.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      if (!selectedOptions.contains(true)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please select an option before proceeding.'),
                          ),
                        );
                        return;
                      }
                      DataBaseServices(uid: currentUser!.uid).updateAnxietyData(
                        currentQuestionIndex,
                        selectedOptions.indexOf(true),
                      );
                      setState(() {
                        currentQuestionIndex++;
                        selectedOptions =
                            List<bool>.filled(question.options.length, false);
                        isOptionSelected = false;
                      });
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homepage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 102, 5, 144), // Custom background color
                    ),
                    child: const Text('Submit'),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  String getEmoji(int index) {
    switch (index) {
      case 0:
        return ':smile:';
      case 1:
        return '\u{1F622}';
      case 2:
        return '\u{1F625}';
      case 3:
        return ':sob:';
      case 4:
        return ':angry:';
      default:
        return '';
    }
  }
}
