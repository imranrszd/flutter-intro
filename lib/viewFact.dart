import 'package:flutter/material.dart';

class ViewFact extends  StatelessWidget {
    const ViewFact ({super.key, required this.id, required this.title, required this.description});

    final int id;
    final String title, description;

    @override
    Widget  build(BuildContext context){
      return  Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          height: 300,
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(40, 30, 40, 30),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(5, 5), // shadow position
                    ),
            ],
          ),
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 18,
              
            ),
          ),
        ),);
    }
}