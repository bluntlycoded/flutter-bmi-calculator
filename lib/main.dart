import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
var wtController=TextEditingController();
var ftController=TextEditingController();
var inController=TextEditingController();
var result='';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'BMI CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
    decoration: const BoxDecoration(
    image: DecorationImage(image: AssetImage('./assets/home/bgimg.jpg'),
    fit: BoxFit.cover),),
        child: Center(
          child: SingleChildScrollView(
            child:
              SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    TextField(
                      controller: wtController,
                      decoration: const InputDecoration(
                          label: Text('Enter Your Weight'),
                          prefixIcon: Icon(Icons.line_weight)
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: ftController,
                      decoration: const InputDecoration(
                          label: Text('Enter Your Height (in ft)'),
                          prefixIcon: Icon(Icons.height),
                        iconColor: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: inController,
                      decoration: const InputDecoration(
                          label: Text('Enter Your Height (in inches)'),
                          prefixIcon: Icon(Icons.height)
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(onPressed: () {
                      var wt=wtController.text.toString();
                      var ft=ftController.text.toString();
                      var inc=inController.text.toString();
                      if(ft!=''&&inc!=''&&wt!=''){
                        var iwt=int.parse(wt);
                        var ift=int.parse(ft);
                        var incht=int.parse(inc);
                        var th=((ift*12)+incht);
                        var hcm=th*2.54;
                        var hm=hcm/100;
                        var bmi=iwt/(hm*hm);
                        setState(() {
                          result=('Your BMI is  ${bmi.toStringAsFixed(2)}');
                        });
                      }else{
                        setState((){
                          result="Please Fill All The Values";
                        });
                      }
                    },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ), child: const Text('Compute BMI'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        wtController.clear();
                        ftController.clear();
                        inController.clear();
                        result='';
                      });
                    },style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ), child: const Text('Check Again')
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(result,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),),
                    ],
                ),
              ),
          ),
        ),
      ),
    );
  }
}