import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/sonuc_ekrani.dart';
import 'package:flutter/material.dart';

class OyunEkrani extends StatefulWidget {
Kisiler kisi;

OyunEkrani({required this.kisi});

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {

  Future<bool> geriTusu(BuildContext context) async {
    print("Navigation geri tıklandı");
    return true; // false olursa geri tuşu çalışmaz. cihazın kendi geri tuşu
  }
  @override
  Widget build(BuildContext context) {
    var k = widget.kisi;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Oyun Ekranı"),
      leading: IconButton(onPressed: (){
        print("appbar geri tuşu tıklandı");
        Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: WillPopScope( // telefonun geri tuşunu kontrol altına almak için kullandık yukarıdaki future fonksiyonu ile.
        onWillPop: () => geriTusu(context),
        child: Center(
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${k.ad} - ${k.yas}- ${k.boy}- ${k.bekar}"), // Üst clastaki bilgiye widget diyerek erişiyoruz

              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SonucEkrani())); // push yerine pushReplament diyerek geri tuşu ile direk anasayfaya dönus sahladık

              },
                  child: const Text("Bitti")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
