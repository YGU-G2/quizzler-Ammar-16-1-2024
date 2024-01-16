class MyQuestions {
  MyQuestions(
    this.questionsText,
    this.isTrue,
  );
  String questionsText;
  bool isTrue;
  bool? theAwnser = null;
}

List<MyQuestions> myQuestionsList = [
  MyQuestions("هل صلاح الدين الأيوبي فاتح القدس", true),
  MyQuestions("عدن عاصمة اليمن", false),
  MyQuestions("اليمن اصل العرب", true),
  MyQuestions("توفي النبي عن عمر ناهز 68 عام", false),
  MyQuestions("أبو عبيدة ابن الجراح هو أمين الامة", true),
  MyQuestions("هل الكرة الارضية مسطحة", true),
];
