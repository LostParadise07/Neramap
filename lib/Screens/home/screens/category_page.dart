import 'package:flutter/material.dart';
import '../widgets/bottom_sheet_header_title.dart';
import '../widgets/category_grid.dart';
import '../widgets/date.dart';
// import '../widgets/exercise_tile.dart';
import '../widgets/greet.dart';
import '../widgets/search_field.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const BottomNavBar(
      //   currentIndex: 1,
      // ),
      backgroundColor: const Color.fromARGB(255, 102, 5, 144),
      body: SafeArea(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(
              16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Greet(),
                Date(),
                SizedBox(
                  height: 25.0,
                ),
                SearchField(),
                SizedBox(
                  height: 25.0,
                ),
              ],
            ),
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
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(
                    35.0,
                  ),
                  topRight: Radius.circular(
                    35.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BottomSheetHeaderTitle(
                      titleText: 'Previous Test Result',
                    ),
                    Expanded(
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(5),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: [
                          CategoryGrid(
                            onTap: () {
                              // Navigate to the Hy() page when pressed
                            },
                            category: 'Depression',
                            color: Colors.purple.shade500,
                          ),
                          CategoryGrid(
                            onTap: () {
                              // Navigate to the Hy() page when pressed
                            },
                            category: 'Anxiety',
                            color: Colors.blue.shade300,
                          ),
                          CategoryGrid(
                            onTap: () {
                              
                            },
                            category: 'Overall Progress',
                            color: Colors.yellow.shade900,
                          ),
                          CategoryGrid(
                            onTap: () {},
                            category: 'Item4 ',
                            color: Colors.pink.shade700,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // const BottomSheetHeaderTitle(
                    //   titleText: 'Consultant',
                    // ),
                    // Expanded(
                    //   child: ListView(
                    //     //how to use ListView.builder in this?
                    //     children: const [
                    //       ExerciseTile(
                    //         exercise: 'Bobby Singer',
                    //         subExercise: 'Education',
                    //         icon: Icons.my_library_music,
                    //         color: Colors.green,
                    //       ),
                    //       ExerciseTile(
                    //         exercise: 'Dean Winchester',
                    //         subExercise: 'Career',
                    //         icon: Icons.badge_outlined,
                    //         color: Colors.red,
                    //       ),
                    //       ExerciseTile(
                    //         exercise: 'Speaking Skills',
                    //         subExercise: '16 Exercises',
                    //         icon: Icons.umbrella,
                    //         color: Colors.red,
                    //       ),
                    //       ExerciseTile(
                    //         exercise: 'Speaking Skills',
                    //         subExercise: '16 Exercises',
                    //         icon: Icons.book,
                    //         color: Colors.yellow,
                    //       ),
                    //       ExerciseTile(
                    //         exercise: 'Speaking Skills',
                    //         subExercise: '16 Exercises',
                    //         icon: Icons.music_note,
                    //         color: Colors.pink,
                    //       ),
                    //       ExerciseTile(
                    //         exercise: 'Speaking Skills',
                    //         subExercise: '16 Exercises',
                    //         icon: Icons.mobile_friendly,
                    //         color: Colors.green,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
