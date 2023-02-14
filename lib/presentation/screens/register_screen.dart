import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:receitas/util/constants.dart';

import '../controllers/fire_auth.dart';
import '../controllers/validator.dart';
import 'home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();
  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  final _focusConfirmPassword = FocusNode();

  bool _isProcessing = false;

  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 310, top: 40),
                child: BackButton(
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.only(top: 90, bottom: 20),
                    child: logo,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 5, top: 5),
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
                      child: Form(
                        key: _registerFormKey,
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
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                controller: _nameController,
                                focusNode: _focusName,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                validator: (value) => Validator.validateName(
                                  name: value,
                                ),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Nome",
                                  hintText: "Digite seu nome",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 20, end: 20, bottom: 20),
                              child: TextFormField(
                                controller: _emailController,
                                focusNode: _focusEmail,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                validator: (value) => Validator.validateEmail(
                                  email: value,
                                ),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Email",
                                  hintText: "Digite seu email",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 20, end: 20, bottom: 20),
                              child: TextFormField(
                                controller: _passwordController,
                                focusNode: _focusPassword,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                textInputAction: TextInputAction.next,
                                validator: (value) =>
                                    Validator.validatePassword(
                                  password: value,
                                ),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Senha",
                                  hintText: "Digite sua senha",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 20, end: 20),
                              child: TextFormField(
                                controller: _confirmPasswordController,
                                focusNode: _focusConfirmPassword,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                textInputAction: TextInputAction.done,
                                validator: (value) =>
                                    Validator.validateConfirmPassword(
                                  confirmPassword: value,
                                  password: _passwordController.text,
                                ),
                                decoration: const InputDecoration(
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
                            _isProcessing
                                ? const Padding(
                                    padding: EdgeInsets.all(20),
                                    child: CircularProgressIndicator(),
                                  )
                                : SizedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 20),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          setState(() {
                                            _isProcessing = true;
                                          });
                                          if (_registerFormKey.currentState!
                                              .validate()) {
                                            User? user = await FireAuth
                                                .registerUsingEmailPassword(
                                                    name: _nameController.text,
                                                    email:
                                                        _emailController.text,
                                                    password:
                                                        _passwordController
                                                            .text);
                                            setState(() {
                                              _isProcessing = false;
                                            });
                                            if (user != null) {
                                              if (context.mounted) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        "Cadastro realizado com sucesso!"),
                                                  ),
                                                );
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Home(),
                                                  ),
                                                  ModalRoute.withName('/'),
                                                );
                                              }
                                            }
                                          } else {
                                            setState(() {
                                              _isProcessing = false;
                                            });
                                          }
                                        },
                                        child: const Text(
                                          "CADASTRAR",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
