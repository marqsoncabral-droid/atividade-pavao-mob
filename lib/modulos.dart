import 'package:flutter/material.dart';

import 'dados_app.dart';

class BannerPrincipal extends StatelessWidget {
  final BannerInfo banner;

  const BannerPrincipal({super.key, required this.banner});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: banner.corA,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.20),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    nomeLoja,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  banner.titulo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    height: 1.05,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  banner.subtitulo,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Text(
                  banner.detalhe,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
              color: banner.corB,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(banner.icone, color: Colors.white, size: 36),
          ),
        ],
      ),
    );
  }
}

class ItemAtalho extends StatelessWidget {
  final AtalhoInfo atalho;

  const ItemAtalho({super.key, required this.atalho});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      child: Column(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: atalho.corFundo,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(atalho.icone, color: atalho.corIcone, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            atalho.nome,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.black87, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class CardProduto extends StatelessWidget {
  final Produto produto;
  final double precoAgora;

  const CardProduto({
    super.key,
    required this.produto,
    required this.precoAgora,
  });

  @override
  Widget build(BuildContext context) {
    double valorComDesconto = calcularPreco(
      precoAgora,
      produto.descontoProduto,
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 122,
            decoration: BoxDecoration(
              color: produto.corBloco,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(18),
                  ),
                  child: Image.network(
                    produto.urlImagem,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.image,
                          color: Colors.black38,
                          size: 30,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: corLaranjaOferta,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '-${produto.descontoProduto}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produto.nome,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black87, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    formatarDinheiro(precoAgora),
                    style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    formatarDinheiro(valorComDesconto),
                    style: const TextStyle(
                      color: corAzulPetroleo,
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  if (produto.freteGratis)
                    const Text(
                      'Frete gratis',
                      style: TextStyle(
                        color: corVerdeEscuro,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BotaoBarra extends StatelessWidget {
  final IconData icone;
  final String texto;
  final bool selecionado;
  final VoidCallback onTap;

  const BotaoBarra({
    super.key,
    required this.icone,
    required this.texto,
    required this.selecionado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color corAtual = selecionado ? corAzulPetroleo : Colors.black54;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icone, color: corAtual, size: 21),
            const SizedBox(height: 4),
            Text(
              texto,
              style: TextStyle(
                color: corAtual,
                fontSize: 11,
                fontWeight: selecionado ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
