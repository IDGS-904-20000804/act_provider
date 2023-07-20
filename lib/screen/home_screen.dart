import 'package:act_provider/provider/pokemon_provider.dart';
import 'package:act_provider/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<PokemonProvider>(context, listen: false).getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pkprovider = Provider.of<PokemonProvider>(context);
    List<dynamic> pokemons = pkprovider.pokemons;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppTheme.primary,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                child: const Text('Pokedex'),
              ),
              background: const FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/loading2.gif'),
                  image: NetworkImage('assets/pokemon.png')),
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final pokemon = pokemons[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        const FadeInImage(
                          fit: BoxFit.cover,
                          placeholder: AssetImage('assets/loading.gif'),
                          image: NetworkImage('assets/pokemon.png'),
                        ),
                        Text(
                          pokemon['name'],
                          style: const TextStyle(color: Colors.blue, fontSize: 30),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            'Consectetur ex aute reprehenderit ut do anim ex. Eu nulla quis est enim sint voluptate aute exercitation officia voluptate.',
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }, childCount: pokemons.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2))
        ],
      ),
    );
  }
}
