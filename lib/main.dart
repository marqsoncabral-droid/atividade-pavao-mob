import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'dados_app.dart';
import 'loja_store.dart';
import 'modulos.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: nomeLoja,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: corFundoTela,
        colorScheme: ColorScheme.fromSeed(
          seedColor: corVerdeEscuro,
          primary: corVerdeEscuro,
          secondary: corAzulClaro,
          surface: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  LojaStore lojaStore = LojaStore();
  PageController controleBanner = PageController(viewportFraction: 0.94);
  int itemBarra = 0;
  int abaAtual = 0;

  @override
  void dispose() {
    controleBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: corAzulPetroleo,
        onPressed: () {
          setState(() {
            itemBarra = 2;
          });
          lojaStore.randomizarPrecos();
        },
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        height: 72,
        child: Row(
          children: [
            Expanded(
              child: BotaoBarra(
                icone: Icons.home,
                texto: 'Inicio',
                selecionado: itemBarra == 0,
                onTap: () {
                  setState(() {
                    itemBarra = 0;
                  });
                },
              ),
            ),
            Expanded(
              child: BotaoBarra(
                icone: Icons.search,
                texto: 'Busca',
                selecionado: itemBarra == 1,
                onTap: () {
                  setState(() {
                    itemBarra = 1;
                  });
                },
              ),
            ),
            const SizedBox(width: 52),
            Expanded(
              child: BotaoBarra(
                icone: Icons.favorite_border,
                texto: 'Favoritos',
                selecionado: itemBarra == 3,
                onTap: () {
                  setState(() {
                    itemBarra = 3;
                  });
                },
              ),
            ),
            Expanded(
              child: BotaoBarra(
                icone: Icons.person_outline,
                texto: 'Conta',
                selecionado: itemBarra == 4,
                onTap: () {
                  setState(() {
                    itemBarra = 4;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                color: corVerdeEscuro,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.18),
                            borderRadius: BorderRadius.circular(19),
                          ),
                          child: const Text(
                            'FL',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 44,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: corAzulPetroleo,
                                  size: 22,
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    textoBusca,
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.16),
                            borderRadius: BorderRadius.circular(21),
                          ),
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 0.12),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              textoLocal,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Icon(Icons.chevron_right, color: Colors.white),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 42,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: abasLoja.length,
                        itemBuilder: (context, index) {
                          bool selecionada = abaAtual == index;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                abaAtual = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: selecionada
                                    ? Colors.white
                                    : const Color.fromRGBO(255, 255, 255, 0.14),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Text(
                                abasLoja[index],
                                style: TextStyle(
                                  color: selecionada
                                      ? corAzulPetroleo
                                      : Colors.white,
                                  fontWeight: selecionada
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 170,
                child: PageView.builder(
                  controller: controleBanner,
                  itemBuilder: (context, index) {
                    BannerInfo banner = bannersTela[index % bannersTela.length];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: BannerPrincipal(banner: banner),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 14),
                padding: const EdgeInsets.symmetric(vertical: 16),
                color: Colors.white,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 6,
                      runSpacing: 12,
                      children: itensRapidos.map((atalho) {
                        return ItemAtalho(atalho: atalho);
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 18, 14, 10),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: corVerdeAguaFraco,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textoTempo,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: corAzulPetroleo,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              textoTempoFim,
                              style: TextStyle(
                                color: corLaranjaOferta,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.bolt, color: corLaranjaOferta, size: 26),
                    ],
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 90),
                itemCount: produtosTela.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  return Observer(
                    builder: (context) {
                      return CardProduto(
                        produto: produtosTela[index],
                        precoAgora: lojaStore.precosProdutos[index],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
