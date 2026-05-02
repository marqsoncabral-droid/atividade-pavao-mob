import 'package:flutter/material.dart';

const String nomeLoja = 'Vitrine Mix';
const String textoBusca = 'Buscar produtos';
const String textoLocal = 'Enviar para Rua CL-010';
const String textoTempo = 'Ofertas por tempo limitado';
const String textoTempoFim = 'Termina em 23:59:59';

const Color corVerdeEscuro = Color(0xFF0D5C4A);
const Color corVerdeAgua = Color(0xFF37B7A8);
const Color corAzulPetroleo = Color(0xFF155E75);
const Color corAzulClaro = Color(0xFF7DD3FC);
const Color corFundoTela = Color(0xFFF2F7F8);
const Color corVerdeAguaFraco = Color(0xFFDDF5F1);
const Color corLaranjaOferta = Color(0xFFE85D04);

class Produto {
  final String nome;
  final int descontoProduto;
  final bool freteGratis;
  final String urlImagem;
  final Color corBloco;

  Produto({
    required this.nome,
    required this.descontoProduto,
    required this.freteGratis,
    required this.urlImagem,
    required this.corBloco,
  });
}

class BannerInfo {
  final String titulo;
  final String subtitulo;
  final String detalhe;
  final IconData icone;
  final Color corA;
  final Color corB;

  BannerInfo({
    required this.titulo,
    required this.subtitulo,
    required this.detalhe,
    required this.icone,
    required this.corA,
    required this.corB,
  });
}

class AtalhoInfo {
  final String nome;
  final IconData icone;
  final Color corIcone;
  final Color corFundo;

  AtalhoInfo({
    required this.nome,
    required this.icone,
    required this.corIcone,
    required this.corFundo,
  });
}

double calcularPreco(double valorBase, int descontoProduto) {
  double valorDesconto = valorBase * descontoProduto / 100;
  return valorBase - valorDesconto;
}

String formatarDinheiro(double valor) {
  String valorTexto = valor.toStringAsFixed(2).replaceAll('.', ',');
  List<String> partes = valorTexto.split(',');
  String parteInteira = partes[0];
  String parteDecimal = partes[1];
  String numeroFinal = '';
  int contador = 0;

  for (int i = parteInteira.length - 1; i >= 0; i--) {
    numeroFinal = parteInteira[i] + numeroFinal;
    contador++;

    if (contador == 3 && i != 0) {
      numeroFinal = '.$numeroFinal';
      contador = 0;
    }
  }

  return 'R\$ $numeroFinal,$parteDecimal';
}

List<String> abasLoja = [
  'Inicio',
  'Tecnologia',
  'Casa',
  'Moda',
  'Mercado',
  'Beleza',
  'Esporte',
];

List<BannerInfo> bannersTela = [
  BannerInfo(
    titulo: 'Super ofertas',
    subtitulo: 'Ofertas do dia para comprar com desconto.',
    detalhe: 'precos mudam no carrinho',
    icone: Icons.local_offer,
    corA: corVerdeEscuro,
    corB: corVerdeAgua,
  ),
  BannerInfo(
    titulo: 'Casa e cozinha',
    subtitulo: 'Itens simples para sua rotina.',
    detalhe: 'frete em varias ofertas',
    icone: Icons.home,
    corA: corAzulPetroleo,
    corB: corAzulClaro,
  ),
  BannerInfo(
    titulo: 'Tecnologia',
    subtitulo: 'Fone, teclado e caixa de som com desconto.',
    detalhe: 'produtos para estudo e lazer',
    icone: Icons.phone_android,
    corA: Color(0xFF136F63),
    corB: Color(0xFF34D399),
  ),
  BannerInfo(
    titulo: 'Cupons',
    subtitulo: 'Use cupons e aproveite melhores valores.',
    detalhe: 'toque no carrinho para atualizar',
    icone: Icons.confirmation_number,
    corA: Color(0xFF0F4C5C),
    corB: Color(0xFF5BC0BE),
  ),
];

List<AtalhoInfo> itensRapidos = [
  AtalhoInfo(
    nome: 'Carteira',
    icone: Icons.account_balance_wallet,
    corIcone: corVerdeEscuro,
    corFundo: Color(0x1F0D5C4A),
  ),
  AtalhoInfo(
    nome: 'Cupons',
    icone: Icons.confirmation_number,
    corIcone: corAzulPetroleo,
    corFundo: Color(0x1F155E75),
  ),
  AtalhoInfo(
    nome: 'Super ofertas',
    icone: Icons.flash_on,
    corIcone: corLaranjaOferta,
    corFundo: Color(0x1FE85D04),
  ),
  AtalhoInfo(
    nome: 'Frete rapido',
    icone: Icons.local_shipping,
    corIcone: corVerdeAgua,
    corFundo: Color(0x1F37B7A8),
  ),
  AtalhoInfo(
    nome: 'Favoritos',
    icone: Icons.favorite_border,
    corIcone: corAzulPetroleo,
    corFundo: Color(0x147DD3FC),
  ),
  AtalhoInfo(
    nome: 'Lojas',
    icone: Icons.store,
    corIcone: corVerdeEscuro,
    corFundo: Color(0x1437B7A8),
  ),
];

List<Produto> produtosTela = [
  Produto(
    nome: 'Fone Bluetooth Compacto',
    descontoProduto: 35,
    freteGratis: true,
    urlImagem: 'https://picsum.photos/seed/fone-vitrine/300/300',
    corBloco: Color(0xFFE1F5F2),
  ),
  Produto(
    nome: 'Mochila Urbana',
    descontoProduto: 22,
    freteGratis: true,
    urlImagem: 'https://picsum.photos/seed/mochila-vitrine/300/300',
    corBloco: Color(0xFFE2F1FB),
  ),
  Produto(
    nome: 'Cafeteira Mini',
    descontoProduto: 18,
    freteGratis: false,
    urlImagem: 'https://picsum.photos/seed/cafeteira-vitrine/300/300',
    corBloco: Color(0xFFEAF7F3),
  ),
  Produto(
    nome: 'Teclado Sem Fio',
    descontoProduto: 27,
    freteGratis: true,
    urlImagem: 'https://picsum.photos/seed/teclado-vitrine/300/300',
    corBloco: Color(0xFFE3F3FF),
  ),
  Produto(
    nome: 'Luminaria de Mesa',
    descontoProduto: 30,
    freteGratis: false,
    urlImagem: 'https://picsum.photos/seed/luminaria-vitrine/300/300',
    corBloco: Color(0xFFEDF8F6),
  ),
  Produto(
    nome: 'Camiseta Basica',
    descontoProduto: 16,
    freteGratis: true,
    urlImagem: 'https://picsum.photos/seed/camiseta-vitrine/300/300',
    corBloco: Color(0xFFE6F4FF),
  ),
  Produto(
    nome: 'Garrafa Termica',
    descontoProduto: 20,
    freteGratis: true,
    urlImagem: 'https://picsum.photos/seed/garrafa-vitrine/300/300',
    corBloco: Color(0xFFE5F7F0),
  ),
  Produto(
    nome: 'Caixa de Som Portatil',
    descontoProduto: 33,
    freteGratis: false,
    urlImagem: 'https://picsum.photos/seed/caixa-vitrine/300/300',
    corBloco: Color(0xFFE2F0F7),
  ),
];
