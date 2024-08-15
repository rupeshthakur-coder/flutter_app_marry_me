import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool scrolledUnderElevation;
  final String pageName;

  const CustomAppBar({
    Key? key,
    required this.scrolledUnderElevation,
    required this.pageName,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image
        Image.asset(
          'assets/home/app_bg.png',
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              pageName,
              style: GoogleFonts.dmSerifDisplay(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.normal, // Adjust if needed
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                // Handle the click event
              },
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.menu, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications_none, color: Colors.black),
                onPressed: () {},
              ),
            ],
            scrolledUnderElevation: scrolledUnderElevation ? 2.0 : 0,
          ),
        ),
      ],
    );
  }
}
