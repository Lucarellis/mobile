// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main(){
  runApp(const Contato());
}

class Contato extends StatelessWidget{
  //nbecessário para inicializar a widget, passa para a classe pai
  const Contato({super.key});
  
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 165, 16, 16)),
      useMaterial3: true,
    ),
    home: const Principal(title:'Contato Pessoal'),
   ); 
  }
}

class Principal extends StatefulWidget {
  //passa parâmetros informações para dentro dessa classe
  const Principal({super.key, required this.title});
  final String title;

  //cria um estado que vai se referir a classe _PrincipalEstado
  @override
  State<Principal> createState() => _PricipalEstado();
}
//Classe _PrincipalEstado herdando o Estado - Ex: vai ficar atualizando
class _PricipalEstado extends State<Principal> {

  final foto = const CircleAvatar(
    backgroundImage: NetworkImage("https://64.media.tumblr.com/f6377d09c2abe70d5c16d0605c0ca538/242f867dfb31d5df-d1/s400x600/1104fca5fd47fb8df86e75bdaa6c6b2ad20b5099.png"),    
    radius: 150,
  );

  final nome = const Text(
    'Lucas Cordeiro',
    style: TextStyle(fontSize: 30),
    textAlign: TextAlign.center,
  );

  final obs = const Text(
    'Programador',
    style: TextStyle(fontSize: 20),     //color: Colors. '...'
    textAlign: TextAlign.center,
  );

  final email = IconButton(
    icon: const Icon(Icons.mail),
    color: Colors.red,
    onPressed: (){
      launchUrl(
        Uri(scheme: 'mailto', path: 'cordeirolucas009@gmail.com',
          queryParameters: {
            'Subject': 'Assunto do email',
            'body': 'Corpo do Email',
          },
        ));
    },
  );

  final telefone = IconButton(
    icon: const Icon(Icons.phone),
    color: Colors.red,
    onPressed: () {
        launchUrl(Uri(scheme: 'tel', path: '+5544991298892'));
      },
    );

    final sms = IconButton(
      color: Colors.red,
      icon: const Icon(Icons.sms),
      onPressed: () {
        launchUrl(Uri(scheme: 'sms', path: '+5544991298892'));
      },
    );

    final site = IconButton(
      color: Colors.red,
      icon: const Icon(Icons.open_in_browser),
      onPressed: () {
        launchUrl(Uri.parse('https://www.linkedin.com/in/lucas-cordeiro-b34371281/'));
      },
    );

    final whatsaap = IconButton(
      color: Colors.red,
      icon: const Icon(Icons.wechat),
      onPressed: () {
        launchUrl(Uri.parse('https://api.whatsaap/+5544991298892'));
      },
    );

    final mapa = IconButton(
      color: Colors.red,
      icon: const Icon(Icons.map),
      onPressed: () {
        launchUrl(Uri.parse('https://maps.app.goo.gl/ALo7WacLyQ28ugY37'));
      },
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicativo de Contato', style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 91, 91, 91),
        leading: IconButton(
          icon: Icon(Icons.account_circle, color: Colors.white),
          onPressed: () {},
        ),
      ),

      //organizar em coluna
      body: Column(
        //alinhar contúdo no centro - acima/baixo
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          foto, nome, obs,
          //Text('Olá mundo'),//
          //criando linha
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [email, telefone, sms, site, whatsaap, mapa],
            //botões do aplicativo 
          )
        ],
      ),
    );
  }
}