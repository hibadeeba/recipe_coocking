import 'package:flutter/material.dart';
import 'recipe_details.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Map<String, dynamic>> favorites = [];

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      homeContent(),
      favoritesContent(),
      ProfilePage(username: widget.username,), // ← هنا تم ربط صفحة البروفايل
    ];

    return Scaffold(
      appBar: AppBar(
        title:Row(
           mainAxisAlignment:MainAxisAlignment.end,
           children: [
            Text("وصفات الطبخ" ,
            style: const TextStyle( fontWeight: FontWeight.bold),
            ),
             
           ]
       
        ) ,
        backgroundColor: Colors.orange,
      ),

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "المفضلة"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "حسابي"),
        ],
      ),
    );
  }

  Widget homeContent() {
    List<Map<String, String>> recipes = [
      {
        "title": "كبسة دجاج",
        "ingredients": "أرز - دجاج - بهارات",
        "image": "images/kabsa.jpg",
        "details":
            "١- نغسل الأرز.\n٢- نقلي البصل ونضيف الدجاج.\n٣- نضيف البهارات والمرق.\n٤- نتركه حتى ينضج.\n٥- يُقدم مع السلطة."
      },
      {
        "title": "باستا كريمي",
        "ingredients": "مكرونة - كريمة - جبن",
        "image": "images/pasta.jpg",
        "details":
            "١- نسلق المكرونة.\n٢- نسوي صوص الكريمة والجبن.\n٣- نخلط المكرونة مع الصوص.\n٤- نتركها تتماسك قليلاً.\n٥- تُقدم ساخنة."
      },
      {
        "title": "بيتزا مارغريتا",
        "ingredients": "عجين - جبن - صلصة",
        "image": "images/pizza.jpg",
        "details":
            "١- نجهز العجينة.\n٢- نضيف الصلصة والجبن.\n٣- ندخلها الفرن ١٢ دقيقة.\n٤- نزينها بالريحان.\n٥- تُقدم مباشرة."
      },
      {
        "title": "شوربة العدس",
        "ingredients": "عدس – جزر – بصل – ثوم – كمون",
        "image": "images/soap.jpg",
        "details": "١- نغسل العدس.\n٢- نحمس البصل والجزر.\n٣- نضيف العدس والماء والبهارات.\n٤- نتركه حتى ينضج.\n٥- نخلطه بالخلاط ويقدم ساخناً."
      },
      {
        "title": "مندي اللحم",
        "ingredients": "لحم – أرز – بهارات – فحم",
        "image": "images/mandy.jpg",
        "details": "١- نتبل اللحم بالبهارات.\n٢- نطبخه حتى ينضج.\n٣- نطبخ الأرز بمرق اللحم.\n٤- نضيف الفحم لإعطاء نكهة.\n٥- يقدم مع الدقوس."
      },
      {
        "title": "شكشوكة",
        "ingredients": "بيض – طماطم – بصل – فلفل",
        "image": "images/shakshoka.jpg",
        "details": "١- نقلي البصل والفلفل.\n٢- نضيف الطماطم والبهارات حتى تتسبك.\n٣- نضيف البيض.\n٤- نتركه حتى يتماسك.\n٥- يقدم مع الخبز."
      },
      {
        "title": "فطائر السبانخ",
        "ingredients": "عجين – سبانخ – بصل – سماق",
        "image": "images/sapankh.jpg",
        "details": "١- نجهز الحشوة بالسبانخ والبصل.\n٢- نرق العجين.\n٣- نضيف الحشوة.\n٤- نغلق الفطائر.\n٥- نخبز حتى تتحمر."
      },
      {
        "title": "مسقعة باذنجان",
        "ingredients": "باذنجان – لحم مفروم – طماطم – بشاميل",
        "image": "images/pathingan.jpg",
        "details": "١- نقلي الباذنجان.\n٢- نطبخ اللحم مع الطماطم.\n٣- نرتب الطبقات.\n٤- نضيف البشاميل.\n٥- ندخلها الفرن حتى تتحمر."
      },
      {
        "title": "كريم كراميل",
        "ingredients": "بيض – حليب – سكر – فانيليا",
        "image": "images/karamel.jpg",
        "details": "١- نذيب السكر على النار.\n٢- نخلط البيض والحليب والفانيليا.\n٣- نضيف الكراميل.\n٤- نخبز بحمام مائي.\n٥- نتركه يبرد جيداً."
      },
      {
        "title": "سلطة سيزر",
        "ingredients": "خس – دجاج – صوص سيزر – جبن بارميزان",
        "image": "images/salata.jpg",
        "details": "١- نجهز الدجاج المشوي.\n٢- نقطع الخس.\n٣- نضيف الصوص.\n٤- نخلط جيداً.\n٥- نرش الجبن."
      },
      {
        "title": "برياني دجاج",
        "ingredients": "دجاج – أرز بسمتي – زعفران – بهارات برياني",
        "image": "images/pryany.jpg",
        "details": "١- نتبل الدجاج.\n٢- نقلي البصل ونضيف البهارات.\n٣- نضيف الأرز ونصفّيه.\n٤- نرتب طبقات الأرز والدجاج.\n٥- نطهو على نار هادئة."
      },
      {
        "title": "ورق عنب باللحم",
        "ingredients": "ورق عنب – لحم مفروم – أرز – بصل – بهارات",
        "image": "images/yalangi.jpg",
        "details":
           "١- نخلط الأرز مع اللحم والبصل والبهارات.\n٢- نلف ورق العنب بإحكام.\n٣- نرتبه في القدر ونضيف مرق.\n٤- نطهو على نار هادئة ساعة.\n٥- يقدم مع الليمون.",
      },
      {
        "title": "مكرونة فرن",
        "ingredients": "مكرونة – صلصة – جبن – لحم مفروم",
        "image": "images/pashamile.jpg",
        "details":
            "١- نسلق المكرونة.\n٢- نطبخ اللحم مع الصلصة.\n٣- نخلط المكرونة مع الصلصة.\n٤- نضيف الجبن.\n٥- نخبز ٢٠ دقيقة حتى تذوب."
      },
      {
        "title": "صينية الدجاج بالخضار",
        "ingredients": "دجاج – بطاطس – جزر – كريمة – بهارات",
        "image": "images/vegtable.jpg",
        "details":
            "١- نقطع الدجاج والخضار.\n٢- نخلطهم مع البهارات.\n٣- نضيف كريمة الطبخ.\n٤- نغطي الصينية وندخلها الفرن.\n٥- نتركها تتحمر ثم تُقدّم."
      },
      {
        "title": "كفتة بالطحينية",
        "ingredients": "لحم – بصل – طحينية – طماطم – بقدونس",
        "image": "images/kofta.jpg",
        "details":
            "١- نشكل الكفتة.\n٢- نطبخها نصف استواء.\n٣- نخلط الطحينية مع الماء والليمون.\n٤- نضيفها فوق الكفتة.\n٥- نخبز نصف ساعة."
      },
      {
        "title": "فتة حمص",
        "ingredients": "حمص – خبز – لبن – طحينية – ثوم",
        "image": "images/fata.jpg",
        "details":
            "١- نحمص الخبز.\n٢- نخلط اللبن مع الطحينية والثوم.\n٣- نرتب الطبقات: خبز – حمص – صوص.\n٤- نزين بالصنوبر.\n٥- تقدم مباشرة."
      },
      {
        "title": "كريب شوكولاتة",
        "ingredients": "دقيق – حليب – بيض – شوكولاتة",
        "image": "images/crip.jpg",
        "details":
            "١- نخلط المقادير.\n٢- نسخن المقلاة ونسكب الخليط.\n٣- نطهو كل جهة.\n٤- نضيف الشوكولاتة داخل الكريب.\n٥- نلفه ويقدم."
      },
      {
        "title": "تيراميسو",
        "ingredients": "بسكويت – قهوة – كريمة – كاكاو",
        "image": "images/teramiso.jpg",
        "details":
            "١- نغمس البسكويت بالقهوة.\n٢- نخلط الكريمة.\n٣- نرتب طبقات: بسكويت – كريمة.\n٤- نكرر الطبقات.\n٥- نرش الكاكاو ونبرده ساعتين."
      },

          
          ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "مرحبا  ${widget.username} ",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            ":افضل الوصفات",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: ListView(
              children: recipes.map((recipe) => recipeCard(recipe)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget favoritesContent() {
    if (favorites.isEmpty) {
      return const Center(
        child: Text(
          "لا توجد وصفات مفضلة بعد",
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: favorites.map((recipe) => recipeCard(recipe)).toList(),
    );
  }

  Widget recipeCard(Map<String, dynamic> recipe) {
    bool isFav = favorites.contains(recipe);

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            recipe["image"],
            width: 60,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        title:
            Text(recipe["title"], style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(recipe["ingredients"]),
        trailing: Icon(Icons.arrow_forward_ios),
    //عند الضغط يذهب الى تفاصيل الوصفة
        onTap: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetailsPage(
                title: recipe["title"],
                ingredients: recipe["ingredients"],
                image: recipe["image"],
                details: recipe["details"],
                isFavorite: isFav,
              ),
            ),
          );

          if (result == true) {
            setState(() {
              if (!favorites.contains(recipe)) favorites.add(recipe);
            });
          } else if (result == false) {
            setState(() {
              favorites.remove(recipe);
            });
          }
        },
      ),
    );
  }
}