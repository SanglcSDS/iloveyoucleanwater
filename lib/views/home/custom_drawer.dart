import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloveyoucleanwater/controllers/home/home_binding.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/utils/language/Localization_Service.dart';
import 'package:iloveyoucleanwater/views/account/forgot_password.dart';
import 'package:iloveyoucleanwater/views/account/sign_up.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:iloveyoucleanwater/views/home/home_tabbar_view.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final box = GetStorage();
  final _Controller = Get.put(HomeController());
  bool _selectedLang = LocalizationService.islangs;

  _buildDrawerOption(Icon icon, String title, onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Center(
                  // bottom: 30.0,
                  //left: 60.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 50,
                        child: const Image(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: 200,
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.language),
                    title: Text(
                      'language'.tr,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  )),
              FlutterSwitch(
                activeText: "VI",
                inactiveText: "EN",
                activeColor: primaryColor,
                inactiveColor: primaryColor,
                width: 55.0,
                height: 20.0,
                valueFontSize: 12.0,
                toggleSize: 15.0,
                value: _selectedLang,
                borderRadius: 30.0,
                // padding: 8.0,
                showOnOff: true,
                onToggle: (val) {
                  setState(() => _selectedLang = val);
                  // if (GetStorage().hasData("language"))
                  //   GetStorage().remove("language");
                  // GetStorage().write("language", val ? 'vi' : 'en');

                  LocalizationService.islangs = val;
                  LocalizationService().changeLocale(val);
                  _Controller.onRefreshHome();
                },
              ),
            ],
          ),
          // DropdownLanguage(),

          _buildDrawerOption(
            Icon(Icons.lock),
            'changePassword'.tr,
            () => Get.to(SignUpView()),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                Icon(Icons.exit_to_app),
                'logout'.tr,
                () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    ),
                  ),
                  box.remove('token'),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
