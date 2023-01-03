import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:services_app/formulaire.dart';

class maison extends StatelessWidget {
  const maison({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maison"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
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
                                              "maison", "Vidange fonce")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon36.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Vidange fonce")
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
                                              "maison", "Citern eau")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon5.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Citern eau")
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
                                              "maison", "Electricite")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon13.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Electricite")
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
                                          builder: (context) =>
                                              formulaire("maison", "Eau")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon12.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Eau")
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
                                              "maison", "Television")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon33.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Television")
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
                                              "maison", "Peinture")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon27.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Peinture")
                            ],
                          ),
                        ),
                      )),
                ],
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
                                              "maison", "Menuisier")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon19.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Menuisier")
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
                                              "maison", "Nettoyage")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon22.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Nettoyage")
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
                  Card(
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
                                          "maison", "Climatisation")));
                            },
                            child: Container(
                                child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SvgPicture.asset(
                                'assets/icons2/icon8.svg',
                                width: 60,
                                color: Colors.orange,
                              ),
                            )),
                          ),
                          Text("Climatisation")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
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
