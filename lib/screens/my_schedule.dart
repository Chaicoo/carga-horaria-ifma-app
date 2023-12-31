import 'package:flutter/material.dart';
import '../components/card_progress.dart';
import '../components/card_schedule.dart';

class MyScheduleScreen extends StatelessWidget {
  final bool useWhiteAppBar;
  const MyScheduleScreen({Key? key, this.useWhiteAppBar = false})
      : super(key: key);

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
              margin: const EdgeInsets.only(top: 0.0),
              child: const Text.rich(
                TextSpan(
                  text: 'Meus horários',
                  style: TextStyle(
                    color: Color(0xFF686565),
                    fontSize: 21,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 0.42,
                  ),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: useWhiteAppBar ? Colors.white : null,
        iconTheme: const IconThemeData(color: Color(0xFF686565)),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Horários',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 0.46,
                ),
              ),
              const SizedBox(height: 26),
              ExpandableCardSchedule(
                title: 'Segunda - 09/10',
                morningSchedule: const [
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Vago',
                  'Vago'
                ],
                afternoonSchedule: const [
                  'Vago',
                  'Vago',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                ],
              ),
              ExpandableCardSchedule(
                title: 'Segunda - 09/10',
                morningSchedule: const [
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Vago',
                  'Vago'
                ],
                afternoonSchedule: const [
                  'Vago',
                  'Vago',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                ],
              ),
              ExpandableCardSchedule(
                title: 'Terça - 10/10',
                morningSchedule: const [
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Vago',
                  'Vago'
                ],
                afternoonSchedule: const [
                  'Vago',
                  'Vago',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                ],
              ),
              ExpandableCardSchedule(
                title: 'Quarta - 11/10',
                morningSchedule: const [
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Vago',
                  'Vago'
                ],
                afternoonSchedule: const [
                  'Vago',
                  'Vago',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                ],
              ),
              ExpandableCardSchedule(
                title: 'Quinta - 12/10',
                morningSchedule: const [
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Vago',
                  'Vago'
                ],
                afternoonSchedule: const [
                  'Vago',
                  'Vago',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                ],
              ),
              ExpandableCardSchedule(
                title: 'Sexta - 13/10',
                morningSchedule: const [
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Vago',
                  'Vago'
                ],
                afternoonSchedule: const [
                  'Vago',
                  'Vago',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Direitos humanos, 30h (Carlos Eduardo)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                  'Criptografia, 60h (Danilo Rodrigues)',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
