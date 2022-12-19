import 'package:flutter/material.dart';

class Odev3 extends StatefulWidget {
  const Odev3({Key? key}) : super(key: key);

  @override
  State<Odev3> createState() => _Odev3State();
}

class _Odev3State extends State<Odev3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upgrade To Pro"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column( mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Text("Unlock all fatures. Use the remoete ads, and enjoy browsing your websites on TV's sith a keyboard!",
                style: TextStyle(fontSize: 16),),
             Spacer(),
             ElevatedButton(onPressed: (){},
                 child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(

                 children: [
                   Text("Monthly",style: TextStyle(fontSize: 24),),
                   Text("\$2.99 per month",style: TextStyle(fontSize: 16),),
                 ],
               ),
             ),
             ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(

                      children: [
                        Text("Yearly",style: TextStyle(fontSize: 24),),
                        Text("\$13.49 per year",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
              ),
              SizedBox(height: 20,),

              ElevatedButton(onPressed: (){},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(

                      children: [
                        Text("Lifetime",style: TextStyle(fontSize: 24),),
                        Text("\$26.99 only once",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () { },
                child: Text('restored'),
              ),

              Spacer(),
              Text("Automaticlly renewed, cansel anytime Terms of Use and Privacy Policy ",
                style: TextStyle(fontSize: 16,),
              textAlign: TextAlign.center,),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}
