import 'package:flutter/material.dart';
import 'package:kbn_test/utilities/colors.dart';
import 'package:kbn_test/utilities/text_style.dart';
import 'package:kbn_test/utilities/widgets/bg_widg.dart';
import 'package:kbn_test/utilities/widgets/next_button.dart';
import 'package:kbn_test/utilities/widgets/signup_education_card.dart';
import 'package:kbn_test/utilities/widgets/signup_stage_info.dart';
import 'package:kbn_test/veiw/auth/signup_skill.dart';

class SignupEducation extends StatefulWidget {
  const SignupEducation({super.key});

  @override
  _SignupEducationState createState() => _SignupEducationState();
}

class _SignupEducationState extends State<SignupEducation> {
  List<Widget> educationCards = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    educationCards.add(EducationCard(context, educt: "SSLC"));
    educationCards.add(EducationCard(context, educt: "Higher Secondary"));
  }

  void _addEducationCard() {
    setState(() {
      educationCards.add(EducationCard(context, educt: "New Education"));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          BgWIdget(),
          SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: size.width * 0.5,
              child: Center(
                child: SizedBox(
                  height: size.height,
                  width: size.width * 0.425,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "SIGN UP",
                            style: AppTextStyle.headertext,
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                StageInfoCircle(
                                    infocolor: tealblue, bordercolor: none),
                                const Text(" - - - - "),
                                StageInfoCircle(
                                    infocolor: tealblue, bordercolor: none),
                                const Text(" - - - - "),
                                StageInfoCircle(
                                    infocolor: none, bordercolor: black)
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Educational details",
                        style: AppTextStyle.subheadertext,
                      ),
                      ...educationCards,
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: NextButton(
                          context,
                          buttoncolor: logintextbox,
                          text: "Add",
                          onPressed: _addEducationCard, 
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: NextButton(
                            context,
                            buttoncolor: logintextbox,
                            text: "Next",
                            nextpage: const SignupSkill(), 
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
