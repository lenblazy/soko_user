import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:soko_user/consts/validator.dart';
import 'package:soko_user/widgets/app_name_text.dart';
import 'package:soko_user/widgets/auth/google_btn.dart';
import 'package:soko_user/widgets/subtitle_text.dart';
import 'package:soko_user/widgets/title_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "/registerScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _emailController,
      _passwordController,
      _nameController,
      _repeatPwdController;

  late final FocusNode _emailFocusNode,
      _passwordFocusNode,
      _nameFocusNode,
      _repeatPwdFocusNode;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _repeatPwdController = TextEditingController();

    _nameFocusNode = FocusNode();
    _repeatPwdFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    if (mounted) {
      _emailController.dispose();
      _passwordController.dispose();
      _nameController.dispose();
      _repeatPwdController.dispose();

      _emailFocusNode.dispose();
      _passwordFocusNode.dispose();
      _nameFocusNode.dispose();
      _repeatPwdFocusNode.dispose();
    }

    super.dispose();
  }

  Future<void> _registerFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const AppNameTextWidget(),
              const SizedBox(height: 16),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TitleTextWidget(label: "Welcome Back"),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _nameController,
                          focusNode: _nameFocusNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: "Name",
                            prefixIcon: Icon(IconlyLight.user2),
                          ),
                          validator: (value) {
                            return Validator.nameValidator(value);
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            prefixIcon: Icon(IconlyLight.message),
                          ),
                          validator: (value) {
                            return Validator.emailValidator(value);
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(IconlyLight.lock),
                          ),
                          validator: (value) {
                            return Validator.passwordValidator(value);
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _repeatPwdController,
                          focusNode: _repeatPwdFocusNode,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: "Repeat Password",
                            prefixIcon: Icon(IconlyLight.lock),
                          ),
                          onFieldSubmitted: (value) async {
                            await _registerFct();
                          },
                          validator: (value) {
                            return Validator.passwordValidator(value);
                          },
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.login),
                            label: Text("Sign Up"),
                            onPressed: () async {
                              await _registerFct();
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        const SubtitleTextWidget(
                          label: "Or connect using",
                        ),
                        const SizedBox(height: 16),
                        Row(children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: kBottomNavigationBarHeight,
                              child: GoogleBtn(),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: SizedBox(
                              height: kBottomNavigationBarHeight,
                              child: ElevatedButton(
                                child: Text("Guest?"),
                                onPressed: () async {
                                  await _registerFct();
                                },
                              ),
                            ),
                          ),
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SubtitleTextWidget(
                                label: "Don't have an account?",
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const SubtitleTextWidget(
                                  label: "Sign up",
                                  textDecoration: TextDecoration.underline,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ]),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
