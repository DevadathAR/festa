import 'package:flutter/material.dart';
import 'package:kbn_test/utilities/colors.dart';
import 'package:kbn_test/utilities/const.dart';
import 'package:kbn_test/utilities/text_style.dart';
import 'package:kbn_test/utilities/widgets/bg_widg.dart';
import 'package:kbn_test/utilities/widgets/error.dart';
import 'package:kbn_test/utilities/widgets/logintextformfiled.dart';
import 'package:kbn_test/veiw/auth/signup_personal.dart';
import 'package:kbn_test/veiw/screen/home.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _isChecked = false;
  void _login() {
    if (_isChecked) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please check the box to proceed.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(children: [
      BgWIdget(),
      Container(
          width: size.width * 0.5,
          height: size.height * 1,
          child: Center(
            child: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Image(image: AssetImage("assets/kbn.png")),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    firmName,
                    style: AppTextStyle.companyName,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    welcome,
                    style: AppTextStyle.headertext,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ErrorPage("Google");
                    },));
                  },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          border: Border.all(color: Colors.black),
                          color: logintextbox),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage("assets/google.png")),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Google",
                            style: AppTextStyle.googletext,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: .5,
                        width: 102,
                        color: black,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          useMail,
                          style: AppTextStyle.bodytext,
                        ),
                      ),
                      Container(
                        height: .5,
                        width: 102,
                        color: black,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  LoginTextForm(label: "username", hintlabel: "user_name"),
                  LoginTextForm(label: "password", hintlabel: "* * * * *"),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ErrorPage("Forget");
                            },
                          ));
                        },
                        child: const Text(
                          forget,
                          style: AppTextStyle.bodytext,
                        ),
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: white,
                        checkColor: black,
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        },
                      ),
                      const Text(
                        "Remember me",
                        style: AppTextStyle.bodytext,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: _isChecked ? _login : null,
                    child: Container(
                      height: 50,
                      width: 400,
                      decoration: BoxDecoration(
                          border: Border.all(color: black),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: black,
                          gradient: LinearGradient(
                              colors: _isChecked
                                  ? loginbutton
                                  : InnactiveLoginbutton)),
                      child: const Center(
                          child: Text(
                        "LOGIN",
                        style: AppTextStyle.logintext,
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        noacc,
                        style: AppTextStyle.bodytext,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const SignupPersonal();
                              },
                            ));
                          },
                          child: const Text("SignUp"))
                    ],
                  )
                ],
              ),
            ),
          ))
    ]));
  }
}
