import 'package:application/app_styles.dart';
import 'package:application/counter.dart';
import 'package:application/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.imagePath});

  final String imagePath;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final Counter _counter = Counter();

  void _incrementCounter() {
    setState(() {
      _counter.increment();
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter.decrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          debugPrint('Add to Cart button pressed!');
        },
        child:
            // Ajouter au panier
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: kDarkBrown,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg/shopping_cart_icon.svg'),
                  SizedBox(width: SizeConfig.blockSizeHorizontal! * 2),
                  RichText(
                    text: TextSpan(
                      text: 'Ajouter au panier | 9500 F ',
                      style: kEncodeSansBold.copyWith(
                        color: kWhite,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '14000 F',
                          style: kEncodeSansRagular.copyWith(
                            color: kWhite,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness:
                                SizeConfig.blockSizeHorizontal! * 1,
                            decorationColor: kWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 50,
                child: Stack(
                  children: [
                    // Image du produit
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        widget.imagePath,
                        height: SizeConfig.blockSizeVertical! * 50,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Bouton de retour
                            Container(
                              height: SizeConfig.blockSizeVertical! * 4,
                              width: SizeConfig.blockSizeVertical! * 4,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: kBrown.withOpacity(0.11),
                                    spreadRadius: 0.0,
                                    blurRadius: 12,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(
                                  'assets/svg/arrow_back_icon.svg',
                                ),
                              ),
                            ),
                            // Ajouter aux favoris
                            Container(
                              height: SizeConfig.blockSizeVertical! * 4,
                              width: SizeConfig.blockSizeVertical! * 4,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: kBrown.withOpacity(0.11),
                                    spreadRadius: 0.0,
                                    blurRadius: 12,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                'assets/svg/favorite_black_icon.svg',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Titre du produit
                  Expanded(
                    child: Text(
                      'Chemise en coton pour homme',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: kEncodeSansSemibold.copyWith(
                        color: kDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 7,
                      ),
                    ),
                  ),
                  // Sélecteur de quantité
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: _decrementCounter,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: kBorderColor, width: 1),
                            shape: BoxShape.circle,
                            color: kWhite,
                          ),
                          child: const Icon(Icons.remove, color: kGrey),
                        ),
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal! * 3),
                      Text(
                        _counter.value.toString(),
                        style: kEncodeSansBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                          color: kDarkBrown,
                        ),
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal! * 3),
                      GestureDetector(
                        onTap: _incrementCounter,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: kBorderColor, width: 1),
                            shape: BoxShape.circle,
                            color: kWhite,
                          ),
                          child: const Icon(Icons.add, color: kDarkGrey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  RatingBar.builder(
                    itemSize: 18,
                    initialRating: 3.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.all(2),
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: kYellow),
                    onRatingUpdate: (rating) {
                      debugPrint(rating.toString());
                    },
                    unratedColor: kLightGrey,
                  ),
                  const SizedBox(width: 8),
                  RichText(
                    text: TextSpan(
                      text: '5.0 ',
                      style: kEncodeSansRagular.copyWith(
                        color: kDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                      children: <TextSpan>[
                        // TextSpan(
                        //   text: '(7.932 reviews)',
                        //   style: kEncodeSansRagular.copyWith(
                        //     color: kBlue,
                        //     fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              ReadMoreText(
                'lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit auctor dui, sed efficitur enim efficitur a. Sed at nunc ac nisl convallis commodo. Donec in ligula a enim efficitur varius. Donec suscipit auctor dui, sed efficitur enim efficitur a. Sed at nunc ac nisl convallis commodo. Donec in ligula a enim efficitur varius.',
                trimLines: 2,
                trimMode: TrimMode.Line,
                delimiter: ' ',
                trimCollapsedText: ' Plus...',
                trimExpandedText: ' Moins',
                style: kEncodeSansRagular.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  color: kDarkGrey,
                ),
                moreStyle: kEncodeSansBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: kDarkBrown,
                ),
                lessStyle: kEncodeSansBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: kDarkBrown,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(height: 1, color: kLightGrey),
              const SizedBox(height: 16),
              // Taille
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Taille',
                        style: kEncodeSansBold.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(color: kLightGrey, width: 1),
                              shape: BoxShape.circle,
                              color: kWhite,
                            ),
                            child: Center(
                              child: Text(
                                'S',
                                style: kEncodeSansRagular.copyWith(
                                  color: kDarkBrown,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.7,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.blockSizeHorizontal! * 1),
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(color: kLightGrey, width: 1),
                              shape: BoxShape.circle,
                              color: kWhite,
                            ),
                            child: Center(
                              child: Text(
                                'M',
                                style: kEncodeSansRagular.copyWith(
                                  color: kDarkBrown,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.7,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.blockSizeHorizontal! * 1),
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(color: kLightGrey, width: 1),
                              shape: BoxShape.circle,
                              color: kDarkBrown,
                            ),
                            child: Center(
                              child: Text(
                                'L',
                                style: kEncodeSansBold.copyWith(
                                  color: kWhite,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.7,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.blockSizeHorizontal! * 1),
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(color: kLightGrey, width: 1),
                              shape: BoxShape.circle,
                              color: kWhite,
                            ),
                            child: Center(
                              child: Text(
                                'XL',
                                style: kEncodeSansRagular.copyWith(
                                  color: kDarkBrown,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.7,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Couleur',
                        style: kEncodeSansBold.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(color: kLightGrey, width: 1),
                              shape: BoxShape.circle,
                              color: const Color.fromARGB(255, 243, 243, 1),
                            ),
                          ),
                          SizedBox(width: SizeConfig.blockSizeHorizontal! * 1),
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 237, 237, 237),
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: const Color.fromARGB(255, 1, 13, 129),
                            ),
                          ),
                          SizedBox(width: SizeConfig.blockSizeHorizontal! * 1),
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(color: kLightGrey, width: 1),
                              shape: BoxShape.circle,
                              color: kBrown,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
