import 'package:flutter/material.dart';
import 'package:receitas/util/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.only(top: 150, bottom: 20),
                child: logo,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("Cadastro",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Nome",
                            hintText: "Digite seu nome",
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 20, end: 20, bottom: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email",
                            hintText: "Digite seu email",
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 20, end: 20, bottom: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Senha",
                            hintText: "Digite sua senha",
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.only(start: 20, end: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Confirmar Senha",
                            hintText: "Digite sua senha",
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 20, end: 20),
                          child: Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                activeColor: Colors.black,
                                onChanged: (newBool) {
                                  setState(() {
                                    isChecked = newBool;
                                  });
                                },
                              ),
                              const Text(
                                "Aceito os termos de uso",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "CADASTRAR",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
