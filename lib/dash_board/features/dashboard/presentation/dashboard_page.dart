import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_marry/dash_board/core/colors/home_color.dart';
import 'package:flutter_ui_marry/dash_board/features/dashboard/widgets/dashboard_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:table_calendar/table_calendar.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeColorConstant.FFFFFF,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBarForDashboard(
          scrolledUnderElevation: false,
          pageName: 'Welcome',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTasksCompletedCard(),
            _buildThisWeekCalendar(),
            _buildTodaysEvents(),
            _buildDueThisWeek(),
            _buildMenuSection(),
            _buildCollaboratorsSection(),
            _buildBudgetSection(),
            _buildGuestsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTasksCompletedCard() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // Background image with decorative border
        Image.asset(
          'assets/dashboard/Mask group.png', // Replace with your image path
          fit: BoxFit.fitWidth,
          width: double.infinity,
          height: 180, // Adjust height as needed
        ),
        // Main content
        Padding(
          padding:
              EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0), // Adjust top padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '81/164',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFFBFA054), // Adjusted color
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Tasks Completed',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 14,
                  color: Color(0xFFBFA054), // Adjusted color
                ),
              ),
              SizedBox(height: 12),
              SizedBox(
                width: 140,
                child: LinearProgressIndicator(
                  value: 60 / 140,
                  backgroundColor:
                      Color(0xFFD5C39C), // Adjusted background color
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF800020)), // Adjusted progress color
                  minHeight: 8.0, // Adjust height of the progress bar
                  borderRadius: BorderRadius.circular(14), // Add border radius
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildThisWeekCalendar() {
    DateTime now = DateTime.now();
    DateTime firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime lastDayOfWeek = firstDayOfWeek.add(Duration(days: 6));

    // Example event data
    Map<DateTime, List<Color>> events = {
      now.subtract(Duration(days: 1)): [Colors.blue, Colors.green],
      now: [Colors.blue, Colors.red],
      now.add(Duration(days: 1)): [Colors.green, Colors.red],
    };

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'This Week',
                style: GoogleFonts.kantumruyPro(
                  color: Color(0xFF1E2742),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Action for View Calendar
                },
                child: Row(
                  children: [
                    Text(
                      'View Calendar',
                      style: TextStyle(
                        color: Color(0xFF9A2143),
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF9A2143),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color(0xFF9A2143),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          TableCalendar(
            firstDay: firstDayOfWeek,
            lastDay: lastDayOfWeek,
            focusedDay: now,
            calendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerVisible: false,
            daysOfWeekVisible: false,
            onDaySelected: (selectedDay, focusedDay) {},
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Color(0xFFFBF8F2),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
              ),
              selectedDecoration: BoxDecoration(
                color: Color(0xFFBFA054),
                shape: BoxShape.circle,
              ),
              outsideDaysVisible: false,
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        day.day.toString(),
                        style: GoogleFonts.kantumruyPro(
                          color: Color(0xFF1E2742),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        _getWeekdayInitial(day.weekday),
                        style: TextStyle(
                          color: Color(0xFF1E2742),
                          fontSize: 12,
                        ),
                      ),
                      _buildEventMarkers(day, events), // Show event markers
                    ],
                  ),
                );
              },
              todayBuilder: (context, day, focusedDay) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFBF8F2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          day.day.toString(),
                          style: GoogleFonts.daiBannaSil(
                            color: Color(0xFFBFA054),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _getWeekdayInitial(day.weekday),
                          style: TextStyle(
                            color: Color(0xFF1E2742),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getWeekdayInitial(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thur';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }

  Widget _buildEventMarkers(DateTime day, Map<DateTime, List<Color>> events) {
    if (events.containsKey(day)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: events[day]!.map((color) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.5),
            child: Icon(
              Icons.circle,
              color: color,
              size: 6,
            ),
          );
        }).toList(),
      );
    }
    return SizedBox.shrink();
  }

  Widget _buildTodaysEvents() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFBF8F2),
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
              16.0), // Increased padding for better spacing
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Wed Nov 19 (Today)',
                style: GoogleFonts.kantumruyPro(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Color(
                      0xFFA3A3A3), // Adjusted color to match the screenshot
                ),
              ),
              SizedBox(height: 20), // Increased space between date and events
              _buildEventItem(
                  '15 : 30', 'Meeting with Caterer', Colors.redAccent),
              SizedBox(height: 10), // Space between event items
              _buildEventItem(
                  '15 : 30', 'Payment due to Florist', Colors.green),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventItem(String time, String title, Color dotColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          time,
          style: GoogleFonts.kantumruyPro(
            fontSize: 16,
            color: Color(0xFF1E2742), // Time color
            fontWeight: FontWeight.normal, // Bolder text for time
          ),
        ),
        SizedBox(width: 20), // Space between time and dot
        Icon(Icons.circle, size: 10, color: dotColor),
        SizedBox(width: 16), // Space between dot and title
        Text(
          title,
          style: GoogleFonts.kantumruyPro(
            fontSize: 16,
            color: Color(0xFF1E2742), // Title color
            fontWeight: FontWeight.normal, // Bolder text for title
          ),
        ),
      ],
    );
  }

  Widget _buildDueThisWeek() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Due this week (5)',
                style: GoogleFonts.dmSerifDisplay(
                  color: Color(0xff1E2742),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Action for View Calendar
                },
                child: Row(
                  children: [
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xFF9A2143),
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF9A2143),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color(0xFF9A2143),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          _buildDueItem('Finalise Caterer', '18 Nov, Friday', 'profile1.png'),
          _buildDueItem('Book Florist', '21 Nov, Monday', 'profile2.png'),
          _buildDueItem('Finalise Venue', '30 Nov, Friday', 'profile3.png'),
        ],
      ),
    );
  }

  Widget _buildDueItem(String title, String date, String profileImage) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Icon(Icons.radio_button_unchecked, color: Colors.grey[600], size: 24),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/$profileImage'),
                radius: 16,
              ),
              SizedBox(width: 16),
              Icon(Icons.chat_bubble_outline,
                  color: Colors.grey[600], size: 18),
              SizedBox(width: 16),
              Icon(Icons.notifications_none, color: Colors.grey[600], size: 18),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          children: [
            _buildTaskItem(
              image: 'assets/home/task_one.png',
              title: 'Food Menu',
              status: 'Pending',
              statusColor: const Color(0xFFFE7A15),
            ),
            SizedBox(width: 16.w),
            _buildTaskItem(
              image: 'assets/home/task_two.png',
              title: 'Guest List',
              status: 'Completed',
              statusColor: const Color(0xFF008000),
            ),
            SizedBox(width: 16.w),
            _buildTaskItem(
              image: 'assets/home/task_three.png',
              title: 'Vendors',
              status: 'Pending',
              statusColor: const Color(0xFFFE7A15),
            ),
          ],
        ),
      ),
    );
  }

// Build Task Item Widget
  Widget _buildTaskItem({
    required String image,
    required String title,
    required String status,
    required Color statusColor,
  }) {
    // Determine the icon to display based on the status
    IconData statusIcon;
    switch (status) {
      case 'Pending':
        statusIcon = Icons.pending; // Icon for pending tasks
        break;
      case 'Completed':
        statusIcon = Icons.check_circle; // Icon for completed tasks
        break;
      case 'In Progress':
        statusIcon = Icons.hourglass_empty; // Icon for tasks in progress
        break;
      case 'Cancelled':
        statusIcon = Icons.cancel; // Icon for cancelled tasks
        break;
      default:
        statusIcon = Icons.info; // Default icon for unknown status
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image, width: 128.w, height: 128.h),
        // SizedBox(height: 8.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E2742),
          ),
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            Icon(
              statusIcon,
              color: statusColor,
            ),
            SizedBox(width: 4.w),
            Text(
              status,
              style: TextStyle(
                fontSize: 12.sp,
                color: statusColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuItem(
      String title, String status, String image, Color statusColor) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage('assets/$image'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(title, style: GoogleFonts.dmSerifDisplay()),
        Row(
          children: [
            Icon(Icons.circle, color: statusColor, size: 10),
            SizedBox(width: 4),
            Text(status, style: TextStyle(color: statusColor)),
          ],
        ),
      ],
    );
  }

  Widget _buildCollaboratorsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Level A Collaborators',
              style: GoogleFonts.dmSerifDisplay(color: Colors.black),
            ),
            TextButton(
              onPressed: () {},
              child: Text('View All'),
              // style: TextButton.styleFrom(primary: Colors.redAccent),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCollaboratorItem('Mom', '988820011', 'mom.png'),
            _buildCollaboratorItem('Dad', '988820011', 'dad.png'),
            _buildCollaboratorItem('Shrey', '988820011', 'shrey.png'),
            _buildCollaboratorItem('Noor', '988820011', 'noor.png'),
          ],
        ),
      ],
    );
  }

  Widget _buildCollaboratorItem(String name, String phone, String image) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/$image'),
          radius: 30,
        ),
        SizedBox(height: 8),
        Text(name, style: GoogleFonts.dmSerifDisplay()),
        Text(phone, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildBudgetSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Budget',
              style: GoogleFonts.dmSerifDisplay(color: Colors.black),
            ),
            TextButton(
              onPressed: () {},
              child: Text('View More'),
              // style: TextButton.styleFrom(primary: Colors.redAccent),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBudgetItem(
                      'Estimated Cost', '20,00,00 Rs', Colors.grey),
                  _buildBudgetItem('Final Cost', '10,00,00 Rs', Colors.black),
                ],
              ),
              SizedBox(height: 12),
              Text('Paid - 6,00,000', style: TextStyle(color: Colors.black)),
              Text('Pending - 4,00,000', style: TextStyle(color: Colors.black)),
              SizedBox(height: 12),
              LinearProgressIndicator(
                value: 0.6,
                backgroundColor: Colors.amber[200],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildLegendItem('Total Cost', Colors.red),
                  _buildLegendItem('Paid', Colors.amber),
                  _buildLegendItem('Pending', Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBudgetItem(String title, String amount, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.grey)),
        Text(
          amount,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildLegendItem(String title, Color color) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 10),
        SizedBox(width: 4),
        Text(title, style: TextStyle(color: Colors.black)),
      ],
    );
  }

  Widget _buildGuestsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Guests',
          style: GoogleFonts.dmSerifDisplay(color: Colors.black),
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPieChart(),
              Column(
                children: [
                  Text(
                    'Total Guests',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('558', style: TextStyle(fontSize: 24)),
                  _buildLegendItem('Confirmed', Colors.red),
                  _buildLegendItem('Pending', Colors.amber),
                  _buildLegendItem('Not attending', Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPieChart() {
    return Container(
      width: 150,
      height: 150,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 223,
              title: 'Confirmed',
              color: Colors.red,
              radius: 60,
            ),
            PieChartSectionData(
              value: 211,
              title: 'Pending',
              color: Colors.amber,
              radius: 60,
            ),
            PieChartSectionData(
              value: 124,
              title: 'Not attending',
              color: Colors.grey,
              radius: 60,
            ),
          ],
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          centerSpaceRadius: 40,
        ),
      ),
    );
  }
}
