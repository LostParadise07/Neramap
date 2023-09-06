import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          iconSize: 24,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(
                          IndexChangedEvent(
                            selectedIndex: 0,
                          ),
                        );
                  },
                  icon: const Icon(
                    Icons.home,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Progress',
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: IconButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(
                          IndexChangedEvent(
                            selectedIndex: 1,
                          ),
                        );
                  },
                  icon: const Icon(
                    Icons.mediation,
                    size: 20,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: 'More',
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: IconButton(
                  onPressed: () {
                    // context.read<HomeBloc>().add(
                    //       IndexChangedEvent(
                    //         selectedIndex: 2,
                    //       ),
                    //     );
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: 15,
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
