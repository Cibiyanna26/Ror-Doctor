import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String doctor;
  final String time;
  final String imageUrl;
  final Color backgroundColor;

  DoctorCard({
    required this.name,
    required this.doctor,
    required this.time,
    required this.imageUrl,
    required this.backgroundColor,
  });

  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Profile Image
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imageUrl),
            ),
            SizedBox(width: 16.0),
            // Doctor Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Patients: $doctor',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16, color: Colors.black54),
                      SizedBox(width: 4),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Consult Button
            ElevatedButton(
              onPressed: () {
                // Consult Action
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                backgroundColor: Colors.black,
              ),
              child: Text('Consult', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
