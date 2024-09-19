import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reach_out_rural/constants/constants.dart';
import 'package:reach_out_rural/models/community.dart';
import 'package:reach_out_rural/models/doctor.dart';
import 'package:reach_out_rural/repository/storage/storage_repository.dart';

class CommunityItem extends StatelessWidget {
  final Community community;

  const CommunityItem({super.key, required this.community});

  @override
  Widget build(BuildContext context) {
    void navigate() async {
      // final SharedPreferencesHelper prefs = SharedPreferencesHelper();
      // final doctors = await prefs.getString("doctors");
      // if (doctors != null) {
      //   final List<dynamic> nearbyDoctors0 = jsonDecode(doctors);
      //   if (nearbyDoctors0.isNotEmpty) {
      //     final nearbyDoctors = nearbyDoctors0
      //         .map((doctor) => Doctor.fromJson(doctor as Map<String, dynamic>))
      //         .where((doctor) =>
      //             doctor.specialization!.toLowerCase() ==
      //             community.specialization.toLowerCase())
      //         .toList();

      final List<Map<String, dynamic>> doctors = [
        {
          'id': 1,
          'name': 'Dr. John Doe',
          'phoneNumber': '01234567890',
          'specialization': 'cardiologist',
          'experienceYears': 15,
          'locationName': 'Cairo',
          'latitude': 30.0444,
          'longitude': 31.2357,
        },
        {
          'id': 2,
          'name': 'Dr. Mohamed',
          'phoneNumber': '01111111111',
          'specialization': 'dermatologist',
          'experienceYears': 10,
          'locationName': 'Giza',
          'latitude': 30.0131,
          'longitude': 31.2089,
        },
        {
          'id': 3,
          'name': 'Dr. Sarah Lee',
          'phoneNumber': '01223344556',
          'specialization': 'pediatrics',
          'experienceYears': 8,
          'locationName': 'Alexandria',
          'latitude': 31.2001,
          'longitude': 29.9187,
        },
        {
          'id': 4,
          'name': 'Dr. Ahmed Ali',
          'phoneNumber': '01098765432',
          'specialization': 'Orthopedic',
          'experienceYears': 12,
          'locationName': 'Luxor',
          'latitude': 25.6872,
          'longitude': 32.6396,
        },
        {
          'id': 5,
          'name': 'Dr. Emily Clark',
          'phoneNumber': '01555555555',
          'specialization': 'ent',
          'experienceYears': 20,
          'locationName': 'Aswan',
          'latitude': 24.0889,
          'longitude': 32.8998,
        },
        {
          'id': 6,
          'name': 'Dr. Michael Brown',
          'phoneNumber': '01666666666',
          'specialization': 'ent',
          'experienceYears': 5,
          'locationName': 'Sharm El Sheikh',
          'latitude': 27.9158,
          'longitude': 34.3299,
        },
        {
          'id': 7,
          'name': 'Dr. Fatima Hassan',
          'phoneNumber': '01777777777',
          'specialization': 'oncology',
          'experienceYears': 18,
          'locationName': 'Hurghada',
          'latitude': 27.2579,
          'longitude': 33.8116,
        },
      ];

      final nearbyDoctors = doctors
          .map((doctor) => Doctor.fromJson(doctor))
          .where((doctor) =>
              doctor.specialization!.toLowerCase() ==
              community.name.toLowerCase())
          .toList();
      final extra = {"community": community, "doctors": nearbyDoctors};
      if (!context.mounted) return;
      context.push("/specialized-community", extra: extra);
      //   }
      // }
    }

    return Card(
      color: community.color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: kWhiteColor,
                  radius: 24, // You can adjust the size
                  child: community.icon,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        community.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: kWhiteColor),
                      ),
                      Text('${community.memberCount} members',
                          style: const TextStyle(color: kWhiteColor)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              community.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: kWhiteColor),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: navigate,
              style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor, // Change button color,
                  foregroundColor: kWhiteColor),
              child: const Text('Join'),
            ),
          ],
        ),
      ),
    );
  }
}
