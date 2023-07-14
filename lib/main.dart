import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color surfaceColor = Color(0x0dffffff);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ButtonStyle(
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(8)))),
        inputDecorationTheme: InputDecorationTheme(
            fillColor: surfaceColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            )),
        brightness: Brightness.dark,
        dividerColor: surfaceColor,
        primaryColor: Colors.pink.shade400,
        scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        textTheme: GoogleFonts.latoTextTheme(const TextTheme(
          bodyLarge: TextStyle(fontSize: 15),
          bodyMedium: TextStyle(
              fontSize: 13, color: Color.fromARGB(200, 255, 255, 255)),
          titleMedium: TextStyle(fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

enum _skillType {
  dart,
  flutter,
  python,
  django,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _skillType _skill = _skillType.dart;

  void updateSelectedSkill(_skillType skillType) {
    setState(() {
      this._skill = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: const Text(
          'Curriculum Vitae',
          // style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Icon(CupertinoIcons.chat_bubble),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/profile_image.jpg',
                    width: 60,
                    height: 60,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Peyman Salehifard',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Programmer'),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(CupertinoIcons.location_solid,
                              size: 18,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color),
                          Text(
                            'Isfahan, Iran',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Icon(
                  CupertinoIcons.heart,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: Text(
                "Enthusiastic young computer geek seeking an apprenticeship as a Fachinformatiker to enhance skills and knowledge. Eager to gain practical experience in programming, systems analysis, and database management. Committed to team success and continuous self-improvement in the IT industry.",
                style: Theme.of(context).textTheme.bodyMedium,
              )),
          Divider(),
          Padding(
            padding: EdgeInsets.fromLTRB(32, 12, 32, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Skills',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  width: 2,
                ),
                Icon(
                  CupertinoIcons.chevron_down,
                  size: 12,
                )
              ],
            ),
          ),
          Center(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              direction: Axis.horizontal,
              children: [
                Skill(
                  type: _skillType.dart,
                  title: 'Dart',
                  path: 'assets/images/Dart.png',
                  shadowColor: Colors.blue,
                  isActive: _skill == _skillType.dart,
                  onTap: () {
                    updateSelectedSkill(_skillType.dart);
                  },
                ),
                Skill(
                  type: _skillType.flutter,
                  title: 'Flutter',
                  path: 'assets/images/Flutter.png',
                  shadowColor: Colors.blue,
                  isActive: _skill == _skillType.flutter,
                  onTap: () {
                    updateSelectedSkill(_skillType.flutter);
                  },
                ),
                Skill(
                  type: _skillType.python,
                  title: 'Python',
                  path: 'assets/images/Python.png',
                  shadowColor: Colors.yellow,
                  isActive: _skill == _skillType.python,
                  onTap: () {
                    updateSelectedSkill(_skillType.python);
                  },
                ),
                Skill(
                  type: _skillType.django,
                  title: 'Django',
                  path: 'assets/images/Django.png',
                  shadowColor: Colors.brown,
                  isActive: _skill == _skillType.django,
                  onTap: () {
                    updateSelectedSkill(_skillType.django);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 12, 8, 12),
            child: Text('Personal information',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w900)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 12),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      labelText: 'E-Mail', prefixIcon: Icon(CupertinoIcons.at)),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(CupertinoIcons.lock)),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child:
                        ElevatedButton(onPressed: () {}, child: Text('Save')))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class Skill extends StatelessWidget {
  final _skillType type;
  final String title;
  final String path;
  final Color shadowColor;
  final bool isActive;
  final Function() onTap;

  const Skill({
    super.key,
    required this.title,
    required this.path,
    required this.shadowColor,
    required this.isActive,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(12))
            : null,
        width: 110,
        height: 100,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: isActive
                ? BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: shadowColor.withOpacity(0.3),
                      blurRadius: 15,
                    )
                  ])
                : null,
            child: Image.asset(
              path,
              width: 45,
              height: 45,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(title)
        ]),
      ),
    );
  }
}
