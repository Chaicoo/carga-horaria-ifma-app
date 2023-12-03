// screens/login.dart
import 'package:carga_horaria_ifma/screens/classes_available.dart';
import 'package:carga_horaria_ifma/screens/general_schedule.dart';
import 'package:carga_horaria_ifma/screens/login.dart';
import 'package:carga_horaria_ifma/screens/my_absences.dart';
import 'package:carga_horaria_ifma/screens/my_progress.dart';
import 'package:carga_horaria_ifma/screens/my_schedule.dart';
import 'package:flutter/material.dart';
import '../components/card.dart';
import '../components/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 13.0), // Set the top margin
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'SIS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'CAX',
                      style: TextStyle(
                        color: Color(0x9E00D808),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' 3.2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        centerTitle: true, // Center the title
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color(0xFF1B896E), // Set the background color here
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Centered circle with image
            Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: appBarHeight),
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    // child: Image.network('../assets/if_logo.png'),
                  ),
                  const SizedBox(
                    height: 58,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Nome',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        Text(
                          'email@email.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Container with specified decoration
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(43),
                    topRight: Radius.circular(43),
                  ),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20), // Adjust the spacing as needed
                  //cards seram chamados aqui
                  NavigationCard(
                    label: 'Horários por turma',
                    icon: Icons.calendar_month_outlined,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GeneralScheduleScreen(
                                useWhiteAppBar: true)),
                      );
                    },
                  ),
                  NavigationCard(
                    label: 'Meus horários',
                    icon: Icons.calendar_month_outlined,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyScheduleScreen(
                                useWhiteAppBar: true)),
                      );
                    },
                  ),
                  NavigationCard(
                    label: 'Meus Progressos',
                    icon: Icons.trending_up,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MyProgressScreen(useWhiteAppBar: true)),
                      );
                    },
                  ),
                  NavigationCard(
                    label: 'Meus afastamentos',
                    icon: Icons.event_busy,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MyAbsencesScreen(useWhiteAppBar: true)),
                      );
                    },
                  ),
                  NavigationCard(
                    label: 'Aulas disponíveis',
                    icon: Icons.class_outlined,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClassesAvailableScreen(
                                useWhiteAppBar: true)),
                      );
                    },
                  ),
                  const SizedBox(height: 15), // Adjust the spacing as needed
                  Button(
                    label: 'SAIR',
                    width: 100,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen(useWhiteAppBar: false,)),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
