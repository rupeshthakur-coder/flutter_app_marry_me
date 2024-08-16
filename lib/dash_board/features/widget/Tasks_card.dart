import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TasksCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Task')
            .doc('vendors')
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var document = snapshot.data!.data() as Map<String, dynamic>;
          String image = document['image'];
          String menuname = document['vendors'];
          String status = document['status'];

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tasks",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF1E2742),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildTaskItem(
                        image: image,
                        title: menuname,
                        status: "status",
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
              ],
            ),
          );
        });
  }
}

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
      Image.network(image, width: 128.w, height: 128.h),
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
