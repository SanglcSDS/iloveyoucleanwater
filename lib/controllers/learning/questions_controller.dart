import 'package:get/get.dart';
import 'package:iloveyoucleanwater/models/learning/question.dart';

class QuestionController extends GetxController {
  List<Question> questions = [
    Question(
      text: 'A. MỤC TIÊU',
      answers: [
        Answer(
            index: 0,
            text:
                'Mục tiêu của khóa học đã đạt được qua hoạt động của khóa học.')
      ],
      hasOther: false,
    ),
    Question(
      text: 'B. NỘI DUNG VÀ THỜI LƯỢNG',
      answers: [
        Answer(
          index: 0,
          text: 'Thời lượng của khoá học e-learning là phù hợp với nội dung.',
        ),
        Answer(
          index: 1,
          text:
              'Các chủ đề chính của khoá học đã được trình bày với bố cục tốt, cụ thể và có trọng tâm.',
        ),
        Answer(
          index: 2,
          text: 'Các bài giảng gần gũi, dễ hiểu.',
        ),
        Answer(
          index: 3,
          text: 'Khác',
        ),
      ],
      hasOther: true,
    ),
    Question(
      text: 'C. PHƯƠNG PHÁP GIẢNG DẠY VÀ GIẢNG VIÊN',
      answers: [
        Answer(
          index: 0,
          text:
              'Phương pháp giảng dạy là phù hợp để truyền tải nội dung khoá học.',
        ),
        Answer(
          index: 1,
          text: 'Giảng viên có các kỹ năng cần thiết để thu hút học viên.',
        ),
        Answer(
          index: 2,
          text: 'Khác',
        ),
      ],
      hasOther: false,
    )
  ];

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
