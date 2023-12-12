import 'package:flutter/material.dart';
import '../components/card_progress.dart';
import '../routes/api_client_get.dart';

class MyProgressScreen extends StatefulWidget {
  final bool useWhiteAppBar;
  final String token;

  const MyProgressScreen({
    Key? key,
    required this.useWhiteAppBar,
    required this.token,
  }) : super(key: key);

  @override
  _MyProgressScreenState createState() => _MyProgressScreenState();
}

class _MyProgressScreenState extends State<MyProgressScreen> {
  List<Map<String, dynamic>> progressData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final apiClient = ApiClient(token: widget.token);
      final dynamic data = await apiClient
          .getData('/api/cargahoraria/relatorio/progresso-ch/professor-logado');

      if (data is List) {
        final List<Map<String, dynamic>> dataList =
            data.cast<Map<String, dynamic>>();
        setState(() {
          progressData = dataList;
        });
      } else {
        print('Unexpected data format: $data');
      }

      print(data);
    } catch (e) {
      print('Erro ao carregar dados: $e');
    }
  }

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
                  text: 'Meus progressos',
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
        backgroundColor: widget.useWhiteAppBar ? Colors.white : null,
        iconTheme: const IconThemeData(color: Color(0xFF686565)),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Progressos de carga horária',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 0.46,
                ),
              ),
              SizedBox(height: 26),
              // Exibir um card para cada item na lista de dados
              for (var item in progressData)
                ExpandingCardProgress(
                  title: item['toStringDisciplina'],
                  workload: item['cargaHorariaDisciplina'].toString(),
                  workloadCompleted: item['cargaHorariaMinistrada'].toString(),
                  progressPercent: item['porcentagemMinistrada'] / 100,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
