// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';

// import 'package:iloveyoucleanwater/utils/language/Localization_Service.dart';
// import 'package:iloveyoucleanwater/views/home/home_tabbar_view.dart';

// class DropdownLanguage extends StatefulWidget {
//   @override
//   _DropdownLanguageState createState() => _DropdownLanguageState();
// }

// class _DropdownLanguageState extends State<DropdownLanguage> {
//   final controller = Get.put(HomeController());
//   bool _selectedLang = LocalizationService.langs.first;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton(
//             icon: Container(width: 12),
//             value: _selectedLang,
//             items: LocalizationService.langs.map((String lang) {
//               return DropdownMenuItem(
//                   value: lang,
//                   child: Center(
//                     child: Text(
//                       lang,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 30.0),
//                     ),
//                   ));
//             }).toList(),
//             onChanged: ( value) {
//               // updates dropdown selected value
//               setState(() => _selectedLang = value!);
//               LocalizationService().changeLocale(value!);
//             }),
//       ),
//     );
//   }
// }
