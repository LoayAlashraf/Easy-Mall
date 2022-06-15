import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {

  var SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
                controller: SearchController,
                decoration: InputDecoration(
                    labelText:'What Are You Searshing for ? ',
                    suffixIcon:Icon(
                        Icons.search
                    )  ,

                    )
                )
            ),

        ],
      ),
    );
  }
}
