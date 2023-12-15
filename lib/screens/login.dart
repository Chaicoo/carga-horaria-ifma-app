import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../components/input.dart';
import '../components/button.dart';
import '../components/input_password.dart';
import '../routes/api_client_login.dart';
import './home.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController matriculaController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  LoginScreen({Key? key, required bool useWhiteAppBar}) : super(key: key);

  void _showErrorToast() {
    Fluttertoast.showToast(
      msg: "Falha no login, usuário ou senha errados",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
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
              margin: const EdgeInsets.only(top: 13.0),
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
                  ],
                ),
              ),
            ),
            const SizedBox(
              child: Text(
                'Sistema Integrado IFMA Campus Caxias',
                style: TextStyle(
                  color: Color(0xFFD3D5D6),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true, // Center the title
        elevation: 0.0, // Set elevation to 0.0 to remove the shadow
      ),
      body: Container(
        color: const Color(0xFF1B896E), // Set the background color here
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Centered circle with image
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: appBarHeight + 18.0),
                      width: 100, // Adjust the width of the circle
                      height: 100, // Adjust the height of the circle
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white, // Set the circle color
                      ),
                      child: Image.asset('assets/image/if_logo.png'),
                    ),
                  ),
                  // Container with specified decoration
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
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
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 36,
                          child: Stack(
                            children: [
                              const Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                child: Text(
                                  'LOGIN',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF1B896E),
                                    fontSize: 24,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 14,
                                top: 12,
                                child: Container(
                                  width: 112,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 0.5,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: Color(0xFFC4C4C4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 14,
                                top: 12,
                                child: Container(
                                  width: 112,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 0.5,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: Color(0xFFC4C4C4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Input(
                          labelText: 'Matricula SIAPE',
                          controller: matriculaController,
                        ),
                        const SizedBox(height: 20),
                        InputPassword(
                          labelText: 'Senha',
                          controller: senhaController,
                        ),
                        const SizedBox(height: 20),
                        Button(
                          label: 'LOGIN',
                          width: 200,
                          onPressed: () async {
                            final apiClient =
                                ApiClientLogin('http://192.168.1.107:31009');

                            try {
                              final String matricula = matriculaController.text;
                              final String senha = senhaController.text;

                              final response =
                                  await apiClient.login(matricula, senha);

                              final String token = response['token'];
                              final String nomeUsuario =
                                  response['nomeUsuario'];
                              final String fotoBase64 = response['fotoBase64'];

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(
                                    nomeUsuario: nomeUsuario,
                                    fotoBase64: fotoBase64,
                                    token: token,
                                  ),
                                ),
                              );
                            } catch (e) {
                              print('Erro durante o login: $e');
                              _showErrorToast();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
