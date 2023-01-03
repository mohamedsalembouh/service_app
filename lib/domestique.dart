import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:services_app/formulaire.dart';

class domestique extends StatelessWidget {
  const domestique({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main d'oeuvre"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Container(
          child: ListView(
            children: [
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white.withOpacity(1),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 30) / 2,
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => formulaire(
                                              "domestique", "Chauffeur")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon7.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Chauffeur")
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white.withOpacity(1),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 30) / 2,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => formulaire(
                                              "domestique", "Gardien")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon16.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Gardien")
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white.withOpacity(1),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 30) / 2,
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => formulaire(
                                              "domestique",
                                              "Employe de maison")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon14.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Employe de maison")
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white.withOpacity(1),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 30) / 2,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => formulaire(
                                              "domestique",
                                              "Femme de menage")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon15.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Femme de menage")
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white.withOpacity(1),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 30) / 2,
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => formulaire(
                                              "domestique", "Nounou")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon26.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Nounou")
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 30,
                  ),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white.withOpacity(1),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 30) / 2,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => formulaire(
                                              "domestique", "Serveur")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon31.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Serveur")
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
