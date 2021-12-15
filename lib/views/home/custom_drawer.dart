import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloveyoucleanwater/routes/app_pages.dart';
import 'package:iloveyoucleanwater/views/account/forgot_password.dart';
import 'package:iloveyoucleanwater/views/account/sign_up.dart';
import 'package:iloveyoucleanwater/views/home/home_tab_view.dart';

class CustomDrawer extends StatelessWidget {
  final box = GetStorage();

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
              // Image(
              //   height: 50.0,
              //   width: double.infinity,
              //   image: AssetImage("assets/images/login_background.jpg"
              //       // currentUser.backgroundImageUrl,
              //       ),
              //   fit: BoxFit.cover,
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              //   child: Text(
              //     "Lê Công Sang",
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 24.0,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
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
          _buildDrawerOption(
            Icon(FontAwesomeIcons.language),
            'Ngôn ngữ',
            () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => HomeTabView(),
                ),
              ),
            },
          ),
          _buildDrawerOption(Icon(Icons.settings), 'Cài đặt', () {}),
          _buildDrawerOption(
            Icon(Icons.lock),
            'Đổi mật khẩu',
            () => Get.to(SignUpView()),
          ),
          _buildDrawerOption(
            Icon(Icons.exit_to_app),
            'Đăn nhập',
            () => {
              Get.toNamed(Routes.LOGIN),
              //  box.remove('token'),
            },
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                Icon(Icons.exit_to_app),
                'Đăng Xuất',
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
