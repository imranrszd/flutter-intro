import 'package:flutter/material.dart';
import 'models.dart';
import 'facts.dart';

class More extends StatefulWidget {
  
  const More({Key? key}) : super(key: key);

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  late Fact? selectedFact = facts[0];
  bool select = false;

  List<Container> funfact(List<Fact> texts) {
    List<Container> containers = [];
    for (var fact in facts) {
      containers.add(
        Container(
          // - not unnecessary -
          child: GestureDetector(
            onTap: () {
              setState(() {
                select = true;

                showModalBottomSheet(
                  context: context, 
                  builder: (BuildContext context){
                    return SizedBox(
                      height: 410,
                      width: double.infinity,
                      child: Column(
                        children: <Widget> [
                          Container(
                            margin: const EdgeInsets.all(25),
                            height: 50,
                            width: 300,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.black),
                              )
                            ),
                            child: Text( // const -
                              fact.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                              ),
                          ),
                          Container(
                            width: 300,
                            margin: const EdgeInsets.all(10),

                            child: Text(
                              textAlign: TextAlign.center,
                              fact.description,
                              style: const TextStyle(
                                fontSize: 18
                              )
                            ),
                          )
                        ],
                      ),
                    );
                  });
                /*
                Navigator.push( // new page
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewFact(
                          id: fact.id,
                          title: fact.title,
                          description: fact.description)),
                );*/
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 100,
              width: 90,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  fact.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return containers;
  }

  @override
  Widget build(BuildContext context) {
    List<Container> funfacts = funfact(facts);

    return Scaffold(
        appBar: AppBar(
          title: const Text("More about me"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              //top box
              height: 350,
              width: 300,
              margin: const EdgeInsets.all(40),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(5, 5), // shadow position
                  ),
                ],
              ),
              child: const Text(
                'Lorem ipsum',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
                // funfact title
                height: 50,
                width: 320,
                margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(5, 5), // shadow position
                    ),
                  ],
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Lorem Ipsum',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                )),
            Container(
                //  funfacts list
                height: 120,
                margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: funfacts,
                )),
            const SizedBox(height: 10),
          ],
        ));
  }
}
