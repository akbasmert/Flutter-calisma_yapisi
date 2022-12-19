import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/oyun_ekrani.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> with WidgetsBindingObserver {
  int sayac = 0;
  bool kontrol = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("build çalıştı");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    if(state == AppLifecycleState.inactive){
      print("inactive çaıştı");}
    if(state == AppLifecycleState.paused){
      print("paused çaıştı");}
    if(state == AppLifecycleState.resumed){
      print("resumed çaıştı");}
    if(state == AppLifecycleState.detached){
      print("detached çaıştı");}

  }

  Future<int>toplama(int sayi1, int sayi2) async {
    int toplam = sayi1 + sayi2;
    return toplam;
}

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: const Text("Anasayfa"),),
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sayac: $sayac",style: TextStyle(fontSize: 36),),
            ElevatedButton(onPressed: (){
              setState(() {
                sayac++;
              });
            },
                child: const Text("Tıkla")),
            ElevatedButton(onPressed: (){
              var kisi = Kisiler(ad: "mehmet", yas: 23, boy: 1.90, bekar: false);
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> OyunEkrani(kisi: kisi)))
              .then((value){
                print("anasayfaya geri donuldu.");
            });
            },
                child: const Text("Başla")),
            Visibility(visible:kontrol,child: const Text("Merhaba")), // visibility özelliği ile yazıyı gizledik, true ve false olma durumuna göre
            Text(kontrol ? "Merhaba" : "X", style: TextStyle(color: kontrol ? Colors.blue : Colors.red),),
            ((){ // kontrol ile arayüz değişiliği yapmak için kullanılan bir yapı
              if(kontrol){
                return const Text("Merhaba", style: TextStyle(color: Colors.red),);
              }else{
                return const Text("Merhaba", style: TextStyle(color: Colors.blue),);

              }
            }()),
            Text("Merhaba"),
            ElevatedButton(onPressed: (){
              setState(() {
               kontrol = true;
              });
            },
                child: const Text("Durum 1 (True)")),
            ElevatedButton(onPressed: (){
              setState(() {
                kontrol = false;
              });
            },
                child: const Text("Durum 2 (False)")),

            FutureBuilder<int>(
              future: toplama(10, 20), // amacımız bu fonksiyonu çalıştırmak
              builder: (context,snaphot) {
                if(snaphot.hasError){
                  return const Text("Hata oluştu");
                }
                if(snaphot.hasData){
                  return Text("Sonuc: ${snaphot.data}");
                }else{
                  return const Text("sonuc yok");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
