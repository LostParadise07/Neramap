import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spider_chart_extended/spider_chart_extended.dart';

class SpiderChartPage extends StatefulWidget {
  SpiderChartPage({
    Key? key,
  }) : super(key: key);

  @override
  _SpiderChartPageState createState() => _SpiderChartPageState();
}

class _SpiderChartPageState extends State<SpiderChartPage> {
  List<num> data = [5, 5, 5, 5, 5, 5, 5];

  final ticks = [1, 2, 3, 4, 5, 6, 7];
  final colorList = [
    const Color(0xff62ACD6),
    const Color(0xffE69138),
    const Color.fromARGB(255, 88, 36, 2),
    const Color(0xff38761D),
    const Color.fromARGB(255, 9, 6, 164),
    const Color.fromARGB(255, 187, 160, 255),
    const Color.fromARGB(255, 165, 245, 181),
  ];
  final features = [
    'Dummy 1',
    'Dummy 2',
    'Dummy 3',
    'Dummy 4',
    'Dummy 5',
    'Anxiety',
    'Depression',
  ];

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final uid = currentUser.uid;

        final anxietyData = await fetchAnxietyData(uid);
        final depressionData = await fetchDepressionData(uid);

        setState(() {
          // push the fetched data to the data list
          data[5] = anxietyData / 45 * 3;
          data[6] = depressionData / 60 * 3;
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<int> fetchAnxietyData(String uid) async {
    var anxietyOptions = 0;

    final querySnapshot = await FirebaseFirestore.instance
        .collection("Questions")
        .doc(uid)
        .collection("AnxietyQuestions")
        .get();

    for (var doc in querySnapshot.docs) {
      int optionSelected =
          doc["optionSelected"] ?? 0; // Replace with your field name
      // add optionSelected in anxietydata
      anxietyOptions += optionSelected;
    }

    return anxietyOptions;
  }

  Future<int> fetchDepressionData(String uid) async {
    var depressionOptions = 0;

    final querySnapshot = await FirebaseFirestore.instance
        .collection("Questions")
        .doc(uid)
        .collection("DepressionQuestions")
        .get();

    for (var doc in querySnapshot.docs) {
      int optionSelected =
          doc["optionSelected"] ?? 0; // Replace with your field name
      // add optionSelected in anxietydata
      depressionOptions += optionSelected;
    }

    return depressionOptions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const BackButton(),
        title: const Text("Overall Results"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SpiderChart(
                tickColor: colorList,
                axisColor: Colors.black,
                ticks: ticks,
                features: features,
                data: [data],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(50.0),
            color: Colors.white,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 0, // Set the mainAxisSpacing to 0
                crossAxisSpacing: 60, // Set the crossAxisSpacing to 0
              ),
              itemCount: features.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      color: colorList[index],
                    ),
                    const SizedBox(
                        width:
                            1), // Add some spacing between the color box and text
                    Text(features[index], textScaleFactor: 0.7),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
