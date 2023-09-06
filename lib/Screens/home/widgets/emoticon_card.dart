import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';

class EmoticonCard extends StatelessWidget {
  const EmoticonCard({Key? key, required this.emoticonFace, required this.mood})
      : super(key: key);

  final String emoticonFace;
  final String mood;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeBloc>().add(
              MoodChangedEvent(mood: emoticonFace),
            );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 10,
              left: 17,
              right: 17,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              color: const Color.fromARGB(255, 242, 239, 243),
            ),
            child: Text(
              emoticonFace,
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            mood,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
