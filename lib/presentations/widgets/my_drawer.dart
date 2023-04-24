// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps/constant/strings.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bussniss_logic/phone_auth/phone_auth_cubit.dart';
import '../../constant/colors_app.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  PhoneAuthCubit phoneauthCubit = PhoneAuthCubit();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 350,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: buildDrawerHedr(context),
            ),
          ),
          const SizedBox(height: 30),
          buildDrawerListItem(leadingIcon: Icons.person, title: 'My profiles'),
          buildDrawerListItemDivider(),
          buildDrawerListItem(
              leadingIcon: Icons.history,
              title: 'palses History',
              onTap: () {}),
          buildDrawerListItemDivider(),
          buildDrawerListItem(leadingIcon: Icons.settings, title: 'Settings'),
          buildDrawerListItemDivider(),
          buildDrawerListItem(leadingIcon: Icons.help, title: 'Help'),
          buildDrawerListItemDivider(),
          BlocProvider<PhoneAuthCubit>(
            create: (context) => phoneauthCubit,
            child: buildDrawerListItem(
              leadingIcon: Icons.logout,
              title: 'Logout',
              onTap: () async {
                await phoneauthCubit.logOut();
                Navigator.of(context).pushReplacementNamed(loginScreen);
              },
              color: Colors.red,
              trailling: const SizedBox(),
            ),
          ),
          const SizedBox(height: 50),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Follow us ',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
          buildSocialMediaIcon(),
        ],
      ),
    );
  }

  Widget buildDrawerHedr(context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Image.asset(
            'assets/images/img.jpg',
            fit: BoxFit.cover,
          ),
        ),
        const Text(
          'Hazem Hamdy',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Text(
          '01152672868',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

Widget buildDrawerListItemDivider() {
  return const Divider(
    height: 0,
    thickness: 1,
    indent: 18,
    endIndent: 24,
  );
}

Widget buildDrawerListItem(
    {required IconData leadingIcon,
    required String title,
    Widget? trailling,
    Function()? onTap,
    Color? color}) {
  return ListTile(
    leading: Icon(
      leadingIcon,
      color: color ?? AppColors.blue,
    ),
    title: Text(title),
    trailing: trailling ??= const Icon(
      Icons.arrow_right,
      color: AppColors.blue,
    ),
    onTap: onTap,
  );
}

Widget buildIcon(IconData icon, String url) {
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(url as Uri)) {
      throw Exception('Could not launch $url');
    }
  }

  return InkWell(
    onTap: () => _launchUrl(url),
    child: Icon(
      icon,
      color: AppColors.blue,
      size: 35,
    ),
  );
}

Widget buildSocialMediaIcon() {
  return Padding(
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 60),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildIcon(
          FontAwesomeIcons.facebook,
          'https://www.facebook.com/hazem.hamdy.710',
        ),
        const SizedBox(width: 20),
        buildIcon(
          FontAwesomeIcons.youtube,
          'https://www.youtube.com/channel/UC_3swikJ9wk39Saymm5LvAA',
        ),
        const SizedBox(width: 20),
        buildIcon(
          FontAwesomeIcons.telegram,
          'https://telegram.org/dl',
        ),
      ],
    ),
  );
}
