import 'package:application/app_styles.dart';
import 'package:application/product_detail_page.dart';
import 'package:application/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ["Tout", "Robes", "Chapeaux", "Montres"];

  // Icons pour les catégories
  List<String> icons = [
    'all_items_icon',
    'dress_icon',
    'hat_icon',
    'watch_icon',
  ];

  // Images des produits
  List<String> images = [
    'image-01.png',
    'image-02.png',
    'image-03.png',
    'image-04.png',
    'image-05.jpg',
    'image-06.jpg',
    'image-07.jpg',
    'image-08.jpg',
  ];

  // Index de la catégorie actuellement sélectionnée
  int current = 0;

  @override
  Widget build(BuildContext context) {
    // Initialisation de SizeConfig pour les dimensions adaptatives
    SizeConfig().init(context);

    return SafeArea(
      child: ListView(
        children: [
          // Header avec le message de bienvenue et l'avatar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Message de bienvenue
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bonjour 👋',
                      style: kEncodeSansRagular.copyWith(
                        color: kDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                    Text(
                      'Boris Johnson',
                      style: kEncodeSansBold.copyWith(
                        color: kDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    ),
                  ],
                ),
                // Avatar de l'utilisateur
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: kGrey,
                  backgroundImage: AssetImage('assets/images/my_profile.jpg'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              children: [
                // Champ de recherche
                Expanded(
                  child: TextField(
                    style: kEncodeSansRagular.copyWith(
                      color: kDarkGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 13,
                      ),
                      prefixIcon: const IconTheme(
                        data: IconThemeData(color: kDarkGrey),
                        child: Icon(Icons.search),
                      ),
                      hintText: 'Rechercher ...',
                      border: kInputBorder,
                      errorBorder: kInputBorder,
                      disabledBorder: kInputBorder,
                      focusedBorder: kInputBorder,
                      focusedErrorBorder: kInputBorder,
                      enabledBorder: kInputBorder,
                      hintStyle: kEncodeSansRagular.copyWith(
                        color: kDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // Icone de filtre
                Container(
                  height: 49,
                  width: 49,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: kBlack,
                  ),
                  child: SvgPicture.asset('assets/svg/filter_icon.svg'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Liste des catégories
          SizedBox(
            width: double.infinity,
            height: 36,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: index == 0 ? kPaddingHorizontal : 15,
                      right: index == categories.length - 1
                          ? kPaddingHorizontal
                          : 0,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 36,
                    decoration: BoxDecoration(
                      color: current == index ? kBrown : kWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: current == index
                          ? null
                          : Border.all(color: kLightGrey, width: 1),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          current == index
                              ? 'assets/svg/${icons[index]}_selected.svg'
                              : 'assets/svg/${icons[index]}_unselected.svg',
                        ),
                        const SizedBox(width: 4),
                        Text(
                          categories[index],
                          style: kEncodeSansMedium.copyWith(
                            color: current == index ? kWhite : kDarkBrown,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 32),
          // Grille de produits
          // Utilisation de MasonryGridView pour une grille avec des éléments de différentes hauteurs
          // MasonryGridView est une grille en maçonnerie qui permet d'avoir des éléments de différentes hauteurs, ce qui est idéal pour les images de produits qui peuvent avoir des proportions variées.
          // mais comme nous sommes dans une ListView, nous devons utiliser shrinkWrap: true et physics: NeverScrollableScrollPhysics() pour éviter les problèmes de défilement imbriqué.
          //pourquoi utiliser shrinkWrap: true et physics: NeverScrollableScrollPhysics() ?
          // shrinkWrap: true permet à la grille de prendre seulement l'espace nécessaire pour afficher tous les éléments, au lieu de prendre tout l'espace disponible. Cela est important lorsque la grille est imbriquée dans une ListView, car sinon la grille essaierait de prendre tout l'espace vertical, ce qui causerait des problèmes de défilement.
          // physics: NeverScrollableScrollPhysics() désactive le défilement de la grille elle-même, ce qui est nécessaire lorsque la grille est imbriquée dans une ListView. Si la grille avait son propre défilement, cela causerait des conflits avec le défilement de la ListView parente, rendant l'expérience utilisateur confuse et difficile à gérer.

          // Si on n'avait pas utilisé MasonryGridView, nous aurions utilisé GridView, mais cela aurait rendu tous les éléments de la grille de la même hauteur, ce qui n'est pas idéal pour les images de produits qui peuvent avoir des proportions différentes. MasonryGridView permet d'avoir une grille plus dynamique et visuellement intéressante, avec des éléments de différentes hauteurs en fonction de leur contenu.
          MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20, // space between columns
            mainAxisSpacing: 23, // space between rows
            itemCount: images.length,
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            imagePath: 'assets/images/${images[index]}',
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Positioned(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            child: Image.asset(
                              'assets/images/${images[index]}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 12,
                          top: 12,
                          child: GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/svg/favorite_cloth_icon_unselected.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Robe de soirée élégante',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: kEncodeSansSemibold.copyWith(
                      color: kDarkBrown,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                  ),
                  Text(
                    'Adidas',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kEncodeSansRagular.copyWith(
                      color: kGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '7500 Fcfa',
                        style: kEncodeSansSemibold.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: kYellow, size: 16),
                          const SizedBox(width: 8),
                          Text(
                            '5.0',
                            style: kEncodeSansRagular.copyWith(
                              color: kDarkBrown,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
