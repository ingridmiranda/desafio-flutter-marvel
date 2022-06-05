# Desafio Flutter Marvel - SoftDesign

## Sobre
Essa é uma aplicação criada em Flutter com o intuito de consumir os dados API da Marvel e listar os personagens existentes, com seus respectivos nomes e fotos, utilizando paginação infinita. Caso ocorra um clique em um personagem, deve exibir uma tela com detalhes, tais como: Foto, nome, descrição e uma lista com os quadrinhos em que o personagem participou.

## Tecnologias externas utilizadas

- API Rest: Marvel, disponível no link https://developer.marvel.com/

## Pacotes do Flutter

#### Para integração com API rest:

- dio
- json_annotation
- json_serializable

#### Para testes
- mocktail
- faker

#### Para gerenciamento de estados
- mobx
- mobx_codegen

#### Para injeção de dependências
- get_it

#### Para checar conectividade com internet
- connectivity_plus

#### Para gerar hash da API
- crypto

#### Para complementar elementos de UI
- animated_splash_screen
- carousel_slider
- page_transition

## APK 

O APK para essa aplicação pode ser acessado no seguinte link: 



## Build

Por questões de segurança, para buildar esse projeto, é necessário criar uma conta da API da Marvel (https://developer.marvel.com/documentation/getting_started). Após isso, adicionar ao projeto um arquivo lib/utils/keys.dart e dentro dele adicionar as suas chaves públicas e privadas da seguinte forma:

 ``abstract class Keys {``
 
 ``   static const apiKey = 'inserir chave pública';``
  
``  static const privateKey = 'inserir chave privada';``

``}``





