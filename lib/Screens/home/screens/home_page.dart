import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuramap/Screens/Graph/spider_graph.dart';
import '../bloc/home_bloc.dart';
import '../screens/category_page.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/bottom_sheet_header_title.dart';
import '../widgets/date.dart';
import '../widgets/emoticon_card.dart';
import '../widgets/exercise_tile.dart';
import '../widgets/greet.dart';
import '../widgets/search_field.dart';
import '../../Questions/Depression/Depression_Question_page.dart';
import '../../Questions/Anxiety/Anxiety_question_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) =>
          previous.status != current.status || previous.index != current.index,
      listener: (context, state) {
        if (state.status == HomeStatus.loaded) {
          String snackBarContent = 'Progress icon Clicked';
          if (state.index == 0) {
            snackBarContent = 'Mood Changed to ${state.mood}';
          } else if (state.index == 2) {
            snackBarContent = 'More icon clicked';
          }

          if (snackBarContent.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  snackBarContent,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.yellow,
                  ),
                ),
              ),
            );
          }
        }
      },
      builder: (context, state) {
        Widget bodyWidget;

        if (state.index == 0) {
          bodyWidget = const _HomeBody();
        } else if (state.index == 1) {
          bodyWidget = const CategoryPage(); // Add your menu widget here
        } else {
          bodyWidget = const _HomeBody();
        }

        return Scaffold(
          bottomNavigationBar: BottomNavBar(
            currentIndex: state.index,
          ),
          body: bodyWidget,
        );
      },
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Text(
              state.mood,
              style: const TextStyle(fontSize: 35),
            );
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 102, 5, 144),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Greet(),
                  Date(),
                  SizedBox(
                    height: 5.0,
                  ),
                  SearchField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'How do you feel?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.more_horiz,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EmoticonCard(
                        emoticonFace: '😔',
                        mood: 'Badly',
                      ),
                      EmoticonCard(
                        emoticonFace: '😊',
                        mood: 'Fine',
                      ),
                      EmoticonCard(
                        emoticonFace: '😁',
                        mood: 'Well',
                      ),
                      EmoticonCard(
                        emoticonFace: '😃',
                        mood: 'Excellent',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.blueAccent,
                      blurRadius: 0,
                      //offset: Offset.infinite,
                    ),
                  ],
                  color: Colors.grey.shade500,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                      25.0,
                    ),
                    topRight: Radius.circular(
                      25.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BottomSheetHeaderTitle(
                        titleText: 'Medical Care',
                      ),
                      Expanded(
                        child: ListView(
                          //how to use ListView.builder in this?
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigate to the QuestionScreen
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const DepressionQuestionWidget(),
                                  ),
                                );
                              },
                              child: const ExerciseTile(
                                exercise: 'I am Feeling Depressed',
                                subExercise: '19 Questions',
                                icon: Icons.umbrella,
                                color: Colors.red,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AnxietyQuestionWidget(),
                                  ),
                                );
                              },
                              child: const ExerciseTile(
                                exercise: 'I am Feeling Anxious',
                                subExercise: '15 Questions',
                                icon: Icons.dock,
                                color: Colors.orange,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SpiderChartPage()));
                              },
                              child: const ExerciseTile(
                                exercise: 'Overall Progress',
                                subExercise: 'Check Results',
                                icon: Icons.person,
                                color: Colors.pink,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
