import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
  static const String SERVER_URL = 'https://mizuiku.hoisinhvien.com.vn/api';
  static const String URL_IMAGE = 'https://mizuiku.hoisinhvien.com.vn';
}

const primaryColor = Color(0xFF51c5da);
const defaultLanguage = 'vi';

String test =
    "<!DOCTYPE html>\n <html> \n <head> <style>img{max-width: 100% !important; height: auto !important}</style> \n </head> \n <body> \n <p class=\"t-j\">&aacute;ng 9/12, diễn vi&ecirc;n&nbsp;<a href=\"https://vietnamnet.vn/truc-anh-tag239242.html\">Tr&uacute;c Anh</a>&nbsp;đăng t&acirc;m thư xin lỗi&nbsp;nh&agrave; sản xuất Dung B&igrave;nh Dương sau khi bị tố mắc \"bệnh\" ng&ocirc;i sao, vi phạm hợp đồng. Theo thư n&agrave;y, đ&ocirc;i b&ecirc;n đ&atilde; giải quyết xong m&acirc;u thuẫn, b&agrave; Dung bỏ qua cho sai s&oacute;t của Tr&uacute;c Anh.</p> \n <p class=\"t-j\">Cụ thể,&nbsp;Tr&uacute;c Anh cho hay c&ocirc; nỗ lực l&agrave;m việc, kh&ocirc;ng c&oacute; th&aacute;i độ tự cao nhưng đ&ocirc;i khi kh&ocirc;ng tr&aacute;nh khỏi sơ suất. C&ocirc; nhấn mạnh viết thư xin lỗi sau khi trực tiếp chia sẻ v&agrave; được b&agrave; Dung B&igrave;nh Dương \"thấu hiểu những thiếu s&oacute;t\". V&igrave; khoảng c&aacute;ch thế hệ, c&ocirc; đ&atilde; xử sự v&ocirc; t&acirc;m l&agrave;m b&agrave; buồn l&ograve;ng. C&ocirc; viết: \"C&oacute; lỗi lầm, c&oacute; hiểu lầm nhưng m&igrave;nh tin rằng kh&ocirc;ng l&yacute; lẽ n&agrave;o hơn lời xin lỗi\".</p> \n <p class=\"t-j\">Tr&uacute;c Anh tin đ&atilde; l&agrave;m hết sức để mọi việc kh&eacute;p lại nhẹ nh&agrave;ng, kh&ocirc;ng để ai buồn phiền th&ecirc;m. C&ocirc; nhắn gửi nh&agrave; sản xuất phim&nbsp;<em>Ngốc ơi tuổi 17</em>: \"Cảm ơn c&ocirc; Dung B&igrave;nh Dương đ&atilde; thấu hiểu cho những vụng về v&agrave; hiểu lầm giữa hai c&ocirc; ch&aacute;u. Con xin lỗi c&ocirc; lần nữa\".&nbsp;</p> \n <tbody> \n <tbody> \n <tr> \n <td class=\"FmsArticleBoxStyle-Images image \"><a class=\"slidevnn cboxElement\" title=\"Diễn vi&ecirc;n Tr&uacute;c Anh xin lỗi nh&agrave; sản xuất \" href=\"https://vnn-imgs-f.vgcloud.vn/2021/12/09/13/dien-vien-truc-anh-xin-loi-nha-san-xuat-ngoc-oi-tuoi-17-1.jpeg\"><img src=\"https://vnn-imgs-f.vgcloud.vn/2021/12/09/13/dien-vien-truc-anh-xin-loi-nha-san-xuat-ngoc-oi-tuoi-17-1.jpeg\" alt=\"Diễn vi&ecirc;n Tr&uacute;c Anh xin lỗi nh&agrave; sản xuất 'Ngốc ơi tuổi 17'\" /></a></td> \n </tr> \n <tr> \n <td class=\"FmsArticleBoxStyle-Content image_desc\">Diễn vi&ecirc;n Tr&uacute;c Anh xin lỗi nh&agrave; sản xuất 'Ngốc ơi tuổi 17'.</td> \n </tr> \n </tbody> \n </table> \n <p class=\"t-j\">Li&ecirc;n hệ với nh&agrave; sản xuất Dung B&igrave;nh Dương, b&agrave; chia sẻ với&nbsp;VietNamNet:&nbsp;\"Tr&uacute;c Anh v&agrave; mẹ c&oacute; mang hoa đến c&ocirc;ng ty t&ocirc;i nhưng kh&ocirc;ng hẹn trước, đ&uacute;ng l&uacute;c&nbsp;t&ocirc;i kh&ocirc;ng c&oacute; ở c&ocirc;ng ty. Mẹ Tr&uacute;c Anh c&oacute; dời lịch hẹn để gặp mặt n&oacute;i chuyện cho r&otilde; r&agrave;ng.</p> \n <p class=\"t-j\">Tuy nhi&ecirc;n, h&ocirc;m nay Tr&uacute;c Anh lại đăng d&ograve;ng trạng th&aacute;i như vậy. T&ocirc;i thấy em kh&ocirc;ng ch&uacute;t n&agrave;o thể hiện th&aacute;i độ hối lỗi, kh&aacute;c xa những lời m&agrave; mẹ em đ&atilde; trao đổi với ch&uacute;ng t&ocirc;i. T&ocirc;i khẳng định&nbsp;<strong>chưa nhận được lời xin lỗi trực tiếp</strong>&nbsp;n&agrave;o từ Tr&uacute;c Anh\".</p> \n <p class=\"t-j\">B&agrave; Dung cho biết bộ phận ph&aacute;p chế của c&ocirc;ng ty của b&agrave; đang l&agrave;m hồ sơ kiện diễn vi&ecirc;n Tr&uacute;c Anh.</p> \n <div id=\"ads-zone-63\" class=\"box-taitro clearfix\">&nbsp;</div> \n <p class=\"t-j\">Trước đ&oacute;,&nbsp;nh&agrave; sản xuất Dung B&igrave;nh Dương&nbsp;tố&nbsp;diễn vi&ecirc;n Tr&uacute;c Anh mắc \"bệnh\" ng&ocirc;i sao, vi phạm hợp đồng. Theo hợp đồng k&yacute; th&aacute;ng 9/2017 với c&ocirc;ng ty của b&agrave; Dung, Tr&uacute;c Anh vi phạm điều khoản khi tự &yacute; nhận đ&oacute;ng phim&nbsp;<em>Mắt biếc</em>&nbsp;của đạo diễn Victor Vũ, nhiều hợp đồng quảng c&aacute;o, PR... v&agrave; gần nhất l&agrave; phim&nbsp;<em>Thi&ecirc;n thần hộ mệnh</em>&nbsp;của Victor Vũ m&agrave; kh&ocirc;ng th&ocirc;ng qua b&agrave;.&nbsp;</p> \n <p class=\"t-j\">B&ecirc;n cạnh vi phạm hợp đồng, b&agrave; Dung bức x&uacute;c th&aacute;i độ của diễn vi&ecirc;n Tr&uacute;c Anh. Tại LHP Việt Nam lần thứ 22 ở Huế,&nbsp;Tr&uacute;c Anh đi chung đo&agrave;n phim&nbsp;<em>Ngốc ơi tuổi 17</em>&nbsp;c&oacute; diễn vi&ecirc;n Minh Khải v&agrave; b&agrave; Dung nhưng&nbsp;đến trễ thảm đỏ khiến mọi người đợi hơn&nbsp;1 tiếng. Sau đ&oacute;, c&ocirc;&nbsp;l&ecirc;n nhận giải thưởng B&ocirc;ng sen V&agrave;ng cho phim&nbsp;<em>Mắt biếc</em>&nbsp;v&agrave; bỏ mặc đo&agrave;n phim&nbsp;<em>Ngốc ơi tuổi 17.</em></p> \n </body> \n </html>";
MaterialColor kPrimaryMaterial = const MaterialColor(0xFF51c5da, {
  50: Color(0xFF51c5da),
  100: Color(0xFF51c5da),
  200: Color(0xFF51c5da),
  300: Color(0xFF51c5da),
  400: Color(0xFF51c5da),
  500: Color(0xFF51c5da),
  600: Color(0xFF51c5da),
  700: Color(0xFF51c5da),
  800: Color(0xFF51c5da),
  900: Color(0xFF51c5da)
});

const kGrey1 = Color(0xFF9F9F9F);
const kGrey2 = Color(0xFF6D6D6D);
const kGrey3 = Color(0xFFEAEAEA);
const kBlack = Color(0xFF1C1C1C);
const kBlue1 = Color(0xff339AFF);

const kDarkGrey = Color(0xFF9fa1a6);
const kLightBlue = Color(0xFFe1f5fe);
const kDirtyWhite = Color(0xFFEFEFEF);
var kNonActiveTabStyle = GoogleFonts.roboto(
  textStyle: const TextStyle(fontSize: 14.0, color: kGrey1),
);
var kNonActiveTabStyles = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 16.0,
    color: primaryColor,
    fontWeight: FontWeight.w900,
  ),
);
var kActiveTabStyle = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 16.0,
    color: kBlack,
    fontWeight: FontWeight.bold,
  ),
);

var kCategoryTitle = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 14.0,
    color: kGrey2,
    fontWeight: FontWeight.bold,
  ),
);

var kDetailContent = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 14.0,
    color: kGrey2,
  ),
);

var kTitleCard = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 16.0,
    color: kBlack,
    fontWeight: FontWeight.bold,
  ),
);
var kTitleCard1 = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 16.0,
    color: primaryColor,
    fontWeight: FontWeight.bold,
  ),
);

var descriptionStyle = GoogleFonts.roboto(
    textStyle: const TextStyle(
  fontSize: 15.0,
  height: 2.0,
));

// String a = calculateTimeDifferenceBetween(
//     startDate: tempDate, endDate: DateTime.now());
// pigLatinheight(String words) => words.replaceAllMapped(
//       RegExp(r'(<img[^>]+)(height=\"[^"]*")', caseSensitive: false),
//       (match) => "${match.group(1)}",
//     );

// pigLatinwidth(String words) => words.replaceAllMapped(
//       RegExp(r'(<img[^>]+)(width=\"[^"]*")', caseSensitive: false),
//       (match) => "${match.group(1)}",
//     );
// pigLatinstyle(String words) => words.replaceAllMapped(
//       RegExp(r'(style=\"[^"]*")', caseSensitive: false),
//       (match) => "${match.group(1)}",
//     );
// td(String words) => words.replaceAllMapped(
//       RegExp(r'(<td[^>]+)(style=\"[^"]*")', caseSensitive: false),
//       (match) => "${match.group(1)}",
//     );

String checkhtml(String text) {
  return tableStart(pigLatinheight(pigLatinwidth(text)));
}

pigLatinwidth(String words) => words.replaceAllMapped(
      RegExp(r'((?:height|width):[^;]*;)', caseSensitive: false),
      (match) => "${match.group(1)}",
    );
pigLatinheight(String words) => words.replaceAllMapped(
      RegExp(r'((?:height|width)=\"[^"]*")', caseSensitive: false),
      (match) => "${match.group(1)}",
    );
//(table[^>]+)
tableStart(String words) => words.replaceAllMapped(
      RegExp(r'(<table[^>]*>)', caseSensitive: false),
      (match) => "${match.group(1)}",
    );
tableEnd(String words) => words.replaceAllMapped(
      RegExp(r'(table[>]+)', caseSensitive: false),
      (match) => "${match.group(1)}tbody",
    );

String calculateTimeDifferenceBetween({required String stringTime}) {
  DateTime startDate = DateTime.parse(stringTime);
  DateTime endDate = DateTime.now();

  int seconds = endDate.difference(startDate).inSeconds;
  var outputFormat = DateFormat('dd/MM/yyyy');

  if (seconds < 60) {
    return '$seconds ' + 'second'.tr;
  } else if (seconds >= 60 && seconds < 3600) {
    return '${startDate.difference(endDate).inMinutes.abs()} ' + 'minute'.tr;
  } else if (seconds >= 3600 && seconds < 86400) {
    return '${startDate.difference(endDate).inHours.abs()} ' + 'hour'.tr;
  } else if (seconds >= 86400 && seconds < 2628000) {
    return '${startDate.difference(endDate).inDays.abs()} ' + 'day'.tr;
  } else {
    return outputFormat.format(startDate);
  }
}
