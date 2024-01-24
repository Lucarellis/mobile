// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//método principal que inicia a aplicação
void main(){
  runApp(Aplicativo());   //runApp - roda app - Chama classe aplicativo
}

//A classe aplicativo vai herdar Stateless - ou seja - não tem alteração dentro da tela
class Aplicativo extends StatelessWidget{
  
  //widget build vai construir a aplicação
  @override
  Widget build(BuildContext context) {
    return MaterialApp(       //oferece padrão de design e componentes
    debugShowCheckedModeBanner: false,
      home: Pagina1(),        //home - representa tela inicial - a primeira que abre
    );
  }
}
class Pagina1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     //fornece estruturas básicas
    return Scaffold(   
      //barra de cima      
      appBar: AppBar(
        title: const Text('Página 1', style: TextStyle(color: Colors.white),),            //texto dentro da barra - cor da letra
        backgroundColor: const Color.fromARGB(255, 82, 82, 82),                 //cor da barra
      ),

      body: Center(                  //body - corpo - center - centralizar(direita-esquerda)
        child: Column(                    //organize em sentido coluna
        //centraliza sentido(acima-abaixo)
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //colocando imagem e personalizando tamanho
            Image.network('https://uploads-ssl.webflow.com/5f841209f4e71b2d70034471/60bb4a2e143f632da3e56aea_Flutter%20app%20development%20(2).png',
             width: 400,
             height: 400,
             ),

            const Text(
              'Bem vindo a tela inicial',
              style: TextStyle(fontSize: 30),
              ),

              const Text(
                'Flutter é uma ferramenta multiplataforma - Android e IOS com um único código'
              ),

              const SizedBox(height: 20),       //dar uma quebra de linha <br>

              ElevatedButton(
                onPressed: () {
                //Navigator, gerencia navegações entre telas
                //push - empurra uma nova rota, para a pilha de navegação
                Navigator.push(
                  //context - identifica pagina atual
                  context,
                  //MaterialPageRouter - define animação e layou para ir para outra tela
                  //builder - Constroi a nova tela Pagina2
                  MaterialPageRoute(builder: (context) => Pagina2()),
                );
              },
                child: Text(
                'Ir para Página 2'
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Pagina2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2', style: TextStyle(color: Colors.white),),
      backgroundColor: Color.fromARGB(255, 238, 121, 62),),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://media.licdn.com/dms/image/C5612AQEkE5HU9-nVCA/article-cover_image-shrink_600_2000/0/1603408826404?e=2147483647&v=beta&t=UqTAFFpvvqcG4iQiGpYNrho5yXHabR8DEO9laCaFBZc', width: 400, height: 400,),
            
            SizedBox(height: 20),

            Text('Linguagem DART', style: TextStyle(fontSize: 30),
            ),

            Text('É uma linguagem versátil que combina eficiência e desempenho, tornando-a uma escolha atraente para o desenvolvimento de aplicativos móveis e web, especialmente quando combinada com o Framework Flutter.'),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pagina3()),
                );
              },
              child: Text('Ir para página 3'),
            ),
          ],
        ),
      ),
    );
  }
}

//Stateless - informações estatícas, não mudam
class Pagina3 extends StatelessWidget{

  //build - responsável pela renderização/construção
  @override
  Widget build(BuildContext context) {
    //define estruturas de lauout > appbar + body
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 3', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,

        //action permite adicionar icone a direita
        actions: [
          //exibe menu pop-up
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Opção 1'),
                  value: 'opcao1',
                ),
                PopupMenuItem(
                  child: Text('Opção 2'),
                  value: 'opcao2',
                  )
              ];
            },
            onSelected: (value) {},     //ação ao selecionar opção
          ),
        ],
      ),

      //corpo do aplicativo - centralizando esquerda/direita
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,        //centralizando acima-baixo
            children: [
              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmlbHw9Hoogc3trl0Z5QCwTc9FKlLWJbNVfA&usqp=CAU', width: 400, height: 400,),
              Text('A História do Senac', style: TextStyle(fontSize: 30),),
              Text('O Senac foi criado no ano 1946, com o propósito de educar profissionalmente '),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Pagina1()),
                  );
                },
                child: Text('Voltar para Página Inicial'),
              )
            ],
        ),
      ),
    );
  }
}