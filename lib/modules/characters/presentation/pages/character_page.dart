import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_pass_challenge/core/constants/strings.dart';

import 'package:open_pass_challenge/modules/characters/presentation/controllers/characters_controllers.dart';
import 'package:open_pass_challenge/core/utils/app_colors.dart';
import 'package:open_pass_challenge/modules/characters/presentation/widgets/characters_skeleton.dart';
import 'package:open_pass_challenge/widgets/search_input_widget.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final TextEditingController searchController = TextEditingController();
  final CharactersController controller = Get.find<CharactersController>();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      controller.filterByText(searchController.text);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(ConstantsStrings.titleApp,
              style: TextStyle(color: AppColors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _getSearchInput(),
              selectTab(context),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildCharacterList(
                      controller.state.charactersAll,
                    ),
                    // Lista de favoritos
                    _buildCharacterList(
                      controller.state.charactersFavorites,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card selectTab(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        color: AppColors.cardBackground,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: size.width * 0.85,
            height: 53,
            child: TabBar(
              indicatorColor: AppColors.primaryColor,
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.grisDefault,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              tabs: [
                Tab(
                  icon: Icon(Icons.list),
                  text: ConstantsStrings.all,
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: ConstantsStrings.favorites,
                ),
              ],
              onTap: (index) {
                controller.state.isFavoritesTab.value = index == 1;
              },
            ),
          ),
        ));
  }

  Widget _getSearchInput() {
    return SearchInputWidget(
      searchController: searchController,
      onChanged: controller.filterByText,
    );
  }

  Widget _buildCharacterList(RxList characters) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      if (controller.state.isLoading.value) {
        return Center(child: buildSkeletonLoader());
      }
      if (characters.isEmpty) {
        return Center(
          child: Text(
            controller.state.isFavoritesTab.value
                ? ConstantsStrings.noFavorites
                : ConstantsStrings.charactersIsEmpty,
            style: TextStyle(fontSize: 18, color: AppColors.grisDefault),
          ),
        );
      }
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 4,
        ),
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          return Card(
              elevation: 4,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: AppColors.cardBackground,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.gradenteOscuro,
                        AppColors.gradienteClaro
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      character.name,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      icon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(
                          scale: animation,
                          child: child,
                        ),
                        child: Icon(
                          character.isFavorite ? Icons.star : Icons.star_border,
                          key: ValueKey(character.isFavorite),
                          color: character.isFavorite
                              ? AppColors.imperialRed
                              : AppColors.grisDefault,
                          size: 30,
                        ),
                      ),
                      onPressed: () {
                        controller.toggleFavorite(character);
                      },
                    ),
                  ),
                ),
              ));
        },
      );
    });
  }
}
