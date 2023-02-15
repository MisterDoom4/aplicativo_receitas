import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:receitas/presentation/controllers/validator.dart';
import 'package:receitas/util/constants.dart';
import 'package:receitas/util/globals.dart' as globals;

import '../controllers/fire_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  User? user = FirebaseAuth.instance.currentUser;

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
                padding: EdgeInsetsDirectional.only(top: 200, bottom: 20),
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            controller: _emailController,
                            focusNode: _focusEmail,
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
                              start: 20, end: 20),
                          child: TextFormField(
                            controller: _passwordController,
                            focusNode: _focusPassword,
                            obscureText: true,
                            validator: (value) => Validator.validatePassword(
                              password: value,
                            ),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Senha",
                              hintText: "Digite sua senha",
                            ),
                          ),
                        ),
                        _isProcessing
                            ? const Padding(
                                padding: EdgeInsets.all(20),
                                child: CircularProgressIndicator(),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      _isProcessing = true;
                                    });
                                    if (_formKey.currentState!.validate()) {
                                      user = await FireAuth
                                          .signInUsingEmailPassword(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                              context: context);
                                      setState(() {
                                        _isProcessing = false;
                                      });
                                      if (user != null) {
                                        globals.userLogin = user;
                                        if (await FireAuth.isEmailVerified()) {
                                        } else {
                                          //TODO: Implementar verificação de email
                                        }
                                        if (context.mounted) {
                                          Navigator.pushNamed(context, '/');
                                        }
                                      } else {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text(
                                                "Erro ao fazer login, tente novamente"),
                                          ));
                                        }
                                      }
                                    }
                                  },
                                  child: const Text(
                                    "ENTRAR",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/register'),
                          child: RichText(
                            text: const TextSpan(
                                text: 'Sou um novo usuario,',
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: " cadatre aqui",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                ]),
                          ),
                        )
                      ],
                    ),
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
