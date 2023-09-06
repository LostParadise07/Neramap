import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseServices {
  final String uid;
  DataBaseServices({required this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');


  final CollectionReference QuestionsCollection =
      FirebaseFirestore.instance.collection('Questions');

  // name Gender Birthdate
  Future<void> updateUserData(
      String name, String gender, String birthdate) async {
    try {
      await userCollection.doc(uid).set({
        'name': name,
        'gender': gender,
        'birthdate': birthdate,
      });
      print('User data updated successfully');
    } catch (e) {
      print('Error updating user data: $e');
    }
  }

  // store question number with the option selected in databse
    Future<void> updateDepressionQuestions(int questionNumber, int optionSelected) async {
    try {
      // Check if the document exists with the specified question number.
      bool docExists = await QuestionsCollection.doc(uid)
          .collection('DepressionQuestions')
          .doc(questionNumber.toString())
          .get()
          .then((doc) => doc.exists);

      // If the document does not exist, then add the question.
      if (!docExists) {
        await QuestionsCollection.doc(uid)
            .collection('DepressionQuestions')
            .doc(questionNumber.toString())
            .set({
          'questionNumber': questionNumber,
          'optionSelected': optionSelected,
        });
        print('Question data added successfully');
      } else {
        // If the document does exist, then update the question.
        await QuestionsCollection.doc(uid)
            .collection('DepressionQuestions')
            .doc(questionNumber.toString())
            .update({
          'optionSelected': optionSelected,
        });
        print('Question data updated successfully');
      }
    } catch (e) {
      print('Error updating question data: $e');
    }
  }

  // store question number with the option selected in databse
  Future<void> updateAnxietyData(int questionNumber, int optionSelected) async {
    try {
      // Check if the document exists with the specified question number.
      bool docExists = await QuestionsCollection.doc(uid)
          .collection('AnxietyQuestions')
          .doc(questionNumber.toString())
          .get()
          .then((doc) => doc.exists);

      // If the document does not exist, then add the question.
      if (!docExists) {
        await QuestionsCollection.doc(uid)
            .collection('AnxietyQuestions')
            .doc(questionNumber.toString())
            .set({
          'questionNumber': questionNumber,
          'optionSelected': optionSelected,
        });
        print('Question data added successfully');
      } else {
        // If the document does exist, then update the question.
        await QuestionsCollection.doc(uid)
            .collection('AnxietyQuestions')
            .doc(questionNumber.toString())
            .update({
          'optionSelected': optionSelected,
        });
        print('Question data updated successfully');
      }
    } catch (e) {
      print('Error updating question data: $e');
    }
  }
}
