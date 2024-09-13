import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reach_out_rural/widgets/custom_top_navbar.dart';
import 'package:reach_out_rural/widgets/doctor_card.dart';

class DoctorAppointmentScreen extends StatefulWidget {
  const DoctorAppointmentScreen({super.key});

  @override
  State<DoctorAppointmentScreen> createState() =>
      _DoctorAppointmentScreenState();
}

class _DoctorAppointmentScreenState extends State<DoctorAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomTopNavbar(
          title: 'Today Appointments', // Center text
          onProfile: () {
            context.go('/profile'); // Navigate to profile page
          },
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            DoctorCard(
              name: 'Loki Bright',
              doctor: 'Kelly Williams',
              time: 'Today 10:30 am',
              imageUrl: 'assets/images/prescription-4.jpg',
              backgroundColor: Colors.lightBlue[100]!,
            ),
            DoctorCard(
              name: 'Lori Bryson',
              doctor: 'Katherine Moss',
              time: 'Today 11:30 am',
              imageUrl: 'assets/images/prescription-4.jpg',
              backgroundColor: Colors.amber[100]!,
            ),
            DoctorCard(
              name: 'Orlando Diggs',
              doctor: 'Kelly Williams',
              time: 'Today 12:30 pm',
              imageUrl: 'assets/images/prescription-4.jpg',
              backgroundColor: Colors.yellow[100]!,
            ),
          ],
        ));
  }
}
