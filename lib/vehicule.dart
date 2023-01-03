import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:services_app/formVehicule.dart';
import 'package:services_app/formulaire.dart';

class vehicule extends StatelessWidget {
  const vehicule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicule"),
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
                                          builder: (context) =>
                                              formVehicule("Pneu")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon28.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Pneu")
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
                                              formVehicule("Carburant")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon6.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Carburant")
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
                                          builder: (context) =>
                                              formVehicule("Batterie")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon3.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Batterie")
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
                                              formVehicule("Remorquage")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon30.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Remorquage")
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
                                          builder: (context) =>
                                              formVehicule("Assurance")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon34.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Assurance")
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
                                              formVehicule("Netoyage")));
                                },
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SvgPicture.asset(
                                    'assets/icons2/icon25.svg',
                                    width: 60,
                                    color: Colors.orange,
                                  ),
                                )),
                              ),
                              Text("Netoyage")
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
                                      builder: (context) =>
                                          formVehicule("Vidange")));
                            },
                            child: Container(
                                child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SvgPicture.asset(
                                'assets/icons2/emptying.svg',
                                width: 60,
                                color: Colors.orange,
                              ),
                            )),
                          ),
                          Text("Viidange")
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
