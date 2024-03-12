// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//método que roda a aplicação
void main(){
  runApp(Principal());
}

class Principal extends StatelessWidget{
  //construção do app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação com API',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: home(),
    );
  }
}

class home extends StatefulWidget{
  @override
  home_state createState() => home_state();
}

class home_state extends State<home>{
  //permite manipular o texto dentro do campo de input
  TextEditingController controleTexto = TextEditingController();
  String conteudo = "";
  String imagem = "";

  //future retorna valor no futuro - async método assincrono
  Future<void> buscar() async {
    String entrada = controleTexto.text;
    String url = 'https://pt.wikipedia.org/api/rest_v1/page/summary/$entrada';

    final resposta = await http.get(Uri.parse(url));

    //se a busca estiver certa
    if(resposta.statusCode == 200) {
      Map<String, dynamic> dado = json.decode(resposta.body);
      setState(() {
        conteudo = dado['extract'];
        imagem = dado['originalimage']['source'];
      });
    }else{
      //se houver um erro
      conteudo = 'Nada foi encontrado!';
      imagem = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicativo com API', style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 115, 8, 0),
      ),

      body: Stack(
        children: [
          //representa a imagem de fundo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://th.bing.com/th/id/R.a359f8920aee17ee5c0c20b1ee335829?rik=YmUs8CFrKKGSYw&pid=ImgRaw&r=0'),  //https://th.bing.com/th/id/R.ec137f7e1b0c0c5524b48fe144cbaf66?rik=11C%2bRTEqIAv%2btg&riu=http%3a%2f%2fwallpapercave.com%2fwp%2f3jQbonO.jpg&ehk=MALaOn2QmiwS5ArQaTp%2fWHOdPN77ArQ0VPQY9egQ%2bE4%3d&risl=&pid=ImgRaw&r=0
                fit: BoxFit.cover,  
              ),
            ),
          ),

          //construção do card
          Padding(
            padding: const EdgeInsets.all(56.0),
            child: Center(
              child: Card(
                color: Color.fromARGB(157, 255, 255, 255),
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: controleTexto,
                              decoration: const InputDecoration(
                                labelText: 'Digite o texto',
                              ),
                            ),
                          ),

                        ElevatedButton(
                          onPressed: buscar,
                          child: Icon(Icons.search, color: Colors.white, ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                          ),
                        ),

                    ],
                  ),

                      
                      const SizedBox(height: 20.0),

                      const Text('Resultado:', 
                      style: TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      Text(conteudo, style: TextStyle(fontSize: 16.0)),
                      const SizedBox(height: 20),
                      if(imagem.isNotEmpty)

                       GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => 
                              ImagemTelaInteira(imagemParametro: imagem),
                            ),
                          );
                        },
                       
                        child: Center(
                          child: Hero(
                            tag: imagem,
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: Image.network(imagem, height: 150,),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImagemTelaInteira extends StatelessWidget {
  final String imagemParametro;

  ImagemTelaInteira({required this.imagemParametro});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: imagemParametro,
          child: Image.network(imagemParametro),
        ),
      ),
    );
  }
}