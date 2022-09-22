import 'package:flutter/material.dart';
import 'package:pokedex/views/widgets/dot_grid.dart';

class HeaderPokemons extends StatelessWidget {
  const HeaderPokemons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 371,
      child: Stack(
        children: [

          /** DO NOT CHANGE THE ORDER OF LIST WIDGETS */
          
          //Logo

          Positioned(
            left: 41.0,
            top: -33,
            child: Image.asset('assets/images/logo.png'),
          ),

          // Grid 1

          Positioned(
            right: 194.82,
            top: 58.46,
            child: Transform.rotate(
              angle: 10.0,
              child: const SizedBox(
                width: 55.62,
                height: 51.49,
                child: DotGrid(),
              ),
            ),
          ),

          // Grid 2

          Positioned(
            right: 47.53,
            bottom: 38.49,
            child: Transform.rotate(
              angle: 10,
              child: const SizedBox(
                width: 83.18,
                height: 80.13,
                child: DotGrid(),
              ),
            ),
          ),

          /**Start Pokemon 2 */

          Positioned(
            right: 11,
            top: 40,
            child: Image.asset('assets/images/background-pokemon-2.png'),
          ),
          Positioned(
            right: 9.87,
            top: 19.54,
            child: Image.asset('assets/images/pokemon-2.png'),
          ),

          //**End Pokemon 2 */

          /**Start Pokemon 1 */

          Positioned(
            left: 12,
            top: 70,
            child: Image.asset('assets/images/background-pokemon-1.png'),
          ),

          Positioned(
            left: 25.91,
            top: 61.37,
            child: Image.asset('assets/images/pokemon-1.png'),
          ),

          //**End Pokemon 1 */

          /**Start Pokemon 3 */

          Positioned(
            left: 34,
            top: 201,
            child: Image.asset('assets/images/background-pokemon-3.png'),
          ),
          Positioned(
            left: 62,
            top: 189,
            child: Image.asset('assets/images/pokemon-3.png'),
          ),

          //**End Pokemon 3 */
        ],
      ),
    );
  }
}
