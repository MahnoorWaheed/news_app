import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_app/src/helper/model/circui_digest_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';


class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
Future? interviewsFuture;

@override
  void initState() {
    super.initState();

    interviewsFuture = getInterviews();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      body: SafeArea(
        child: FutureBuilder<List<Cicuitdigest>>(
          future: getInterviews(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done
             && snapshot.hasData){
              return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return HtmlWidget(snapshot.data![index].body!.
                replaceAll("/sites/", "https://circuitdigest.com/sites/"));
              },
            );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }


Future<List<Cicuitdigest>> getInterviews() async {
    final reponse = await http.get(
      Uri.parse('http://45.33.23.205/circuitdigest_9/api-interviews'));

    List<Cicuitdigest> circuitDetailList = List<Cicuitdigest>.from(
      jsonDecode(reponse.body).map((x) => Cicuitdigest.fromJson(x)));

    return circuitDetailList;
  }

}