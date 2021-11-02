// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:telework_v2/Models/templateList.dart';

class TemplateListScreen extends StatefulWidget {
  const TemplateListScreen({Key? key}) : super(key: key);

  @override
  _TemplateListScreenState createState() => _TemplateListScreenState();
}

class _TemplateListScreenState extends State<TemplateListScreen> {
  @override
  Widget build(BuildContext context) {
    List<MasterTemplate> listMaster = [];
    //  myMasterTemplate: MasterTemplateList.list[i])
    setState(() {
      listMaster = MasterTemplateList.list;
    });
    return Scaffold(
        appBar: AppBar(
          title: const Text("Template list"),
        ),
        body: Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisSpacing: 2),
                itemCount: listMaster.length,
                itemBuilder: (BuildContext context, int i) {
                  return CardMasterTemplate(myMasterTemplate: listMaster[i]);
                } // item builder
                ), // silver grid delegate
          ),
        )); // scaffold
  }
}

// class TemplateListScreen extends StatefulWidget {
//   const TemplateListScreen({Key? key}) : super(key: key);

//   @override
//   _TemplateListScreenState createState() => _TemplateListScreenState();
// }

// class _TemplateListScreenState extends State<TemplateListScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//             appBar: AppBar(
//               title: Text(MasterTemplateList.list.length.toString()),
//             ),
//             body: Container(
//               color: Colors.red,
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2, mainAxisSpacing: 2),
//                     itemCount: MasterTemplateList.list.length,
//                     itemBuilder: (BuildContext, i) {
//                       return CardMasterTemplate(
//                                myMasterTemplate : MasterTemplateList.list[i]);
//                     }// item builder
//                     ),// silver grid delegate
//               ),// grid builder
//             )// pading
// )// container
// ); // scaffold
//   }
// }

class CardMasterTemplate extends StatelessWidget {
  const CardMasterTemplate({
    required this.myMasterTemplate,
    Key? key,
  }) : super(key: key);
  final MasterTemplate myMasterTemplate;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: IntrinsicHeight(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  color: Colors.cyan[100],
                  child: Container(
                      width: double.infinity,
                      //    child: Padding(
                      // padding: const EdgeInsets.all(1.0),
                      // ),

                      height: 10 //* (2/3),
                      ),
                ),

                // Text('Id :${myMasterTemplate.id.toString()}'),
                // Text('Template name :${myMasterTemplate.templateName}'),
                // Text('Detail :${myMasterTemplate.detail}')

                //  Text(myMasterTemplate.id.toString()),
                // Text(
                //   myMasterTemplate.templateName,
                //   style: TextStyle(color: Colors.grey[800]),
                // ),
                Text(
                  myMasterTemplate.templateName,
                  // textAlign: TextAlign.,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(),
                ),
                Text(myMasterTemplate.detail,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[600]))
              ]),
        ),
      ),
    ));
  }
}
