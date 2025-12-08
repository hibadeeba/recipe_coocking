import 'package:flutter/material.dart';
class RecipeDetailsPage extends StatefulWidget {
  final String title;
  final String ingredients;     // ← مهم جداً هذا السطر
  final String image;
  final String details;
  final bool isFavorite;

  const RecipeDetailsPage({super.key, 
    required this.title,
    required this.ingredients,   // ← لازم يكون هنا أيضاً
    required this.image,
    required this.details,
    required this.isFavorite,
  });


  @override
  _RecipeDetailsPageState createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  late bool favorite;

  @override
  void initState() {
    super.initState();
    favorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(fontFamily: "Cairo")),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(
              favorite ? Icons.favorite : Icons.favorite_border,
              color: favorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                favorite = !favorite;
              });
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              child: Image.asset(
                widget.image,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.title,
                    
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Cairo",
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    widget.details,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Cairo",
                    ),
                  ),

                  SizedBox(height: 30),

                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, favorite);
                      },
                      icon: Icon(Icons.check),
                      label: Text(
                        "حفظ التغيير",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Cairo",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
