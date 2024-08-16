import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Events')
            .doc('FoodTasting')
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var document = snapshot.data!.data() as Map<String, dynamic>;
          String date = document['Date'] ?? 'No Date';
          String venue = document['Venue'] ?? 'No Venue';
          String time = document['time'] ?? 'No Time';
          String title = document['title'] ?? 'No Title';

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/home/card_one.png'), // Path to your image
                  fit:
                      BoxFit.contain, // Adjust the image to cover the container
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upcoming",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E2742),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle View All Tasks click
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "View All Tasks",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF9A2143),
                              decoration: TextDecoration
                                  .underline, // Add underline decoration
                              decorationColor: const Color(
                                  0xFF9A2143), // Set the underline color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    title,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF1E2742),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "$date",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF1E2742),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$time",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF1E2742),
                        ),
                      ),
                      Text(
                        venue,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF1E2742),
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.comment,
                                color: Colors.white,
                                size: 25.sp,
                              ),
                              12.horizontalSpace,
                              Icon(
                                Icons.notifications,
                                size: 25.sp,
                                color: Colors.white,
                              ),
                              12.horizontalSpace,
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
