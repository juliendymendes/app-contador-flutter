import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }
  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://images.unsplash.com/photo-1753997738438-132e9f1092fd?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D"),
            fit: BoxFit.cover,
            opacity: 0.7
            )
        ),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,  
        children:  [
          Text(
            isFull ? "Lotado" : "Pode entrar!", 
            style: TextStyle(
                    fontSize: 26, 
                    color:Colors.white, 
                    fontWeight: FontWeight.w700
                    ),
          ), 
           Padding(
            padding: const EdgeInsets.all(40),
            child:  Text(
              '$count', 
              style: TextStyle(
                fontSize: 100, 
                color: isFull ? Colors.red : Colors.white
              )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: isEmpty ? null : decrement,
                style: TextButton.styleFrom(
                  backgroundColor: isEmpty ? Colors.white.withValues(
                    alpha: 0.8
                  ) : Colors.white,
                  fixedSize: const Size(100,100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  )
                ),
                child: const Text("Saiu", style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
              const SizedBox(width: 32,),
               TextButton(
                onPressed: isFull ? null : increment,
                style: TextButton.styleFrom(
                  backgroundColor: isFull ? Colors.white.withValues(
                    alpha: 0.8
                  ) : Colors.white,
                  fixedSize: const Size(100,100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  )
                ),
                child: const Text("Entrou", style: TextStyle(color: Colors.black, fontSize: 16)),
              )
            ],
          )
        ]
      ),
      )
    );
  }
}


