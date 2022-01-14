import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class ExamBuilderServices {
  final CollectionReference _user =
      FirebaseFirestore.instance.collection('Exam');
  Future saveExamNameAndDescription(
      {String uid, String examTitle, String examDescription}) async {
    return await _user
        .doc(uid)
        .collection('Exam')
        .doc(examTitle)
        .set({'examDescription': examDescription});
  }

  Future saveExamQuestionAndOptions(
      {int questionNumber,
      questionData,
      String uid,
      String examTitle,
      @required String answerOption,
      @required int answerOptionValue}) async {
    return await _user.doc(uid).collection('Exam').doc(examTitle).update(
      {
        'question$questionNumber': questionData,
        '$answerOption': answerOptionValue
      },
    );
  }
}
