import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_marry/dash_board/core/colors/home_color.dart';
import 'package:flutter_ui_marry/dash_board/core/utils/widgets/costum_appbar.dart';
import 'package:flutter_ui_marry/dash_board/features/widget/Tasks_card.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widget/event_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: homeColorConstant.FFFFFF,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(
            scrolledUnderElevation: false,
            pageName: 'Welcome',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Image.asset(
                      'assets/home/top_bg.png',
                      fit: BoxFit.contain,
                      width: 375.w,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 110),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello, Divya!",
                              style: GoogleFonts.comforter(
                                fontSize: 36.sp,
                                fontWeight: FontWeight.normal,
                                color: const Color(0xFF1E2742),
                              ),
                            ),
                            // SizedBox(height: 5.h),
                            Text(
                              "Add a detailed profile to get ",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFF1E2742),
                              ),
                            ),
                            Text(
                              "personalized suggestions",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFF1E2742),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            ElevatedButton(
                              onPressed: () {
                                // Handle "Set up Profile" button click
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF9A2143),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        12.r), // Top-left corner radius
                                    bottomRight: Radius.circular(
                                        12.r), // Bottom-right corner radius
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 8.h),
                              ),
                              child: Text(
                                "Set up Profile",
                                style: GoogleFonts.dmSerifDisplay(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            // const SizedBox(
                            // //   height: 150,
                            // // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Upcoming Event Section

              EventCard(),

              SizedBox(height: 15.h),

              // Tasks Section
              TasksCard(),
              SizedBox(height: 20.h),

              // StreamBuilder<EventModel>(
              //   stream: _firebaseService.eventStream(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return Center(child: CircularProgressIndicator());
              //     } else if (snapshot.hasError) {
              //       debugPrint('Error: ${snapshot.error}');
              //       return Center(child: Text('Error: ${snapshot.error}'));
              //     } else if (snapshot.hasData) {
              //       debugPrint('Data: ${snapshot.data}');
              //       // debugPrint('Venue: ${snapshot.data?.foodFasting?.f1?.venue}');
              //       return EventCard(event: snapshot.data!);
              //     } else {
              //       return Center(child: Text('No Data Available'));
              //     }
              //   },
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 16.w),
              //   child: Container(
              //     padding: EdgeInsets.all(16.w),
              //     decoration: BoxDecoration(
              //       image: const DecorationImage(
              //         image: AssetImage('assets/home/card_one.png'), // Path to your image
              //         fit: BoxFit.contain, // Adjust the image to cover the container
              //       ),
              //       borderRadius: BorderRadius.circular(12.r),
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               "Upcoming",
              //               style: TextStyle(
              //                 fontSize: 12.sp,
              //                 fontWeight: FontWeight.bold,
              //                 color: const Color(0xFF1E2742),
              //               ),
              //             ),
              //             TextButton(
              //               onPressed: () {
              //                 // Handle View All Tasks click
              //               },
              //               child: RichText(
              //                 text: TextSpan(
              //                   text: "View All Tasks",
              //                   style: TextStyle(
              //                     fontSize: 12.sp,
              //                     color: const Color(0xFF9A2143),
              //                     decoration: TextDecoration.underline, // Add underline decoration
              //                     decorationColor: const Color(0xFF9A2143), // Set the underline color
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         Text(
              //           "Food Tasting",
              //           style: GoogleFonts.dmSerifDisplay(
              //             fontSize: 20.sp,
              //             fontWeight: FontWeight.normal,
              //             color: const Color(0xFF1E2742),
              //           ),
              //         ),
              //         SizedBox(height: 4.h),
              //         Text(
              //           "12 June, Monday",
              //           style: TextStyle(
              //             fontSize: 14.sp,
              //             color: const Color(0xFF1E2742),
              //           ),
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               "12:30 pm",
              //               style: TextStyle(
              //                 fontSize: 14.sp,
              //                 color: const Color(0xFF1E2742),
              //               ),
              //             ),
              //             Text(
              //               " F9 Caterers",
              //               style: TextStyle(
              //                 fontSize: 14.sp,
              //                 color: const Color(0xFF1E2742),
              //               ),
              //             ),
              //             Row(
              //               children: [
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.end,
              //                   children: [
              //                     Icon(
              //                       Icons.comment,
              //                       color: Colors.white,
              //                       size: 25.sp,
              //                     ),
              //                     12.horizontalSpace,
              //                     Icon(
              //                       Icons.notifications,
              //                       size: 25.sp,
              //                       color: Colors.white,
              //                     ),
              //                     12.horizontalSpace,
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              // Vendors Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vendors",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildVendorItem(
                            image: 'assets/home/vender_one.png',
                            title: 'Decor'),
                        _buildVendorItem(
                            image: 'assets/home/vender_two.png',
                            title: 'Makeup'),
                        _buildVendorItem(
                            image: 'assets/home/vender_three.png',
                            title: 'Caterer'),
                        _buildVendorItem(
                            image: 'assets/home/vender_four.png',
                            title: 'Clothing'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              // Custom Package Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Stack(
                  clipBehavior:
                      Clip.none, // Allow the image to overflow the container
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: homeColorConstant.FBF8F2,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 100
                                  .h), // Adjust for text and button placement
                          Text(
                            "Are you tired?",
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1E2742),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Tired of looking through every single vendor of each service type? We will select a tailored package that best fits your interests.",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color(0xFF1E2742),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          ElevatedButton(
                            onPressed: () {
                              // Handle "Custom Package" button click
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8B1C1C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(8.r), // Top left corner
                                  bottomRight: Radius.circular(
                                      8.r), // Bottom right corner
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 8.h),
                            ),
                            child: Text(
                              "Custom Package",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -30
                          .h, // Adjust this value to control how much the image overlaps the container
                      right: 0,
                      child: Image.asset(
                        'assets/home/vasket.png',
                        width: 170.w,
                        height: 140.h,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              // Trending Today Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trending Today",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF1E2742),
                      ),
                    ),

                    // Trending Images Row
                    SingleChildScrollView(
                      scrollDirection:
                          Axis.horizontal, // Enable horizontal scrolling
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.start, // Align items to the start
                        children: [
                          _buildTrendingItem(
                            image: 'assets/home/trend_one.png',
                            title: '#goldlehenga',
                          ),
                          SizedBox(
                              width: 4.w), // Space between items (optional)
                          _buildTrendingItem(
                            image: 'assets/home/trend_two.png',
                            title: '#tropicalflower',
                          ),
                          SizedBox(
                              width: 4.w), // Space between items (optional)
                          _buildTrendingItem(
                            image: 'assets/home/trend_one.png',
                            title: '#pastelcolors',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, -2), // shadow direction: bottom right
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: const Color(0xFF8B1C1C),
              unselectedItemColor: const Color(0xFF5A6472),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 30), // Home icon
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard, size: 30), // Dashboard icon
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.camera, size: 30), // Inspire icon
                  label: 'Inspire',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.store, size: 30), // Vendors icon
                  label: 'Vendors',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group, size: 30), // Collab icon
                  label: 'Collab',
                ),
              ],
              onTap: (index) {
                print("Selected Index: $index");
              },
            ),
          ),
        ));
  }

// Build Task Item Widget

  // Build Vendor Item Widget
  Widget _buildVendorItem({required String image, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image, width: 76.w, height: 76.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: homeColorConstant.ff1E2742,
          ),
        ),
      ],
    );
  }

  // Build Trending Item Widget
  Widget _buildTrendingItem({required String image, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF9A2143),
            decoration: TextDecoration.underline,
          ),
        ),
        Image.asset(image, width: 176.w, height: 259.h),
      ],
    );
  }
}
