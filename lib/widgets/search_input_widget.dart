import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_pass_challenge/core/constants/assets.dart';
import 'package:open_pass_challenge/core/constants/strings.dart';
import 'package:open_pass_challenge/core/utils/app_colors.dart';

class SearchInputWidget extends StatefulWidget {
  final TextEditingController? searchController;
  final ValueChanged<String>? onChanged;

  const SearchInputWidget({
    super.key,
    this.searchController,
    this.onChanged,
  });

  @override
  SearchInputWidgetState createState() => SearchInputWidgetState();
}

class SearchInputWidgetState extends State<SearchInputWidget> {
  @override
  Widget build(BuildContext context) {
    return _getSearchInput(context);
  }

Widget _getSearchInput(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: AppColors.cardBackground,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: size.width * 0.85,
          height: 53,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: TextFormField(
                  controller: widget.searchController,
                  onChanged: widget.onChanged,
                  decoration: InputDecoration(
                    suffixIcon: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () => _informationTextField(context),
                        child: SvgPicture.asset(
                          ConstantsAssets.infoCircle,
                          height: 27.0,
                          color: AppColors.grisDefault,
                        ),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1.5, color: AppColors.grisDefault),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: 'Ej: Luke Skywalker',
                    hintStyle: TextStyle(color: AppColors.grisDefault),
                    filled: false,
                    isDense: true,
                    suffixIconConstraints: const BoxConstraints(minWidth: 2, minHeight: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _informationTextField(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(top: 135),
          child: AlertDialog(
            alignment: Alignment.topCenter,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            insetPadding: const EdgeInsets.all(10),
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  Text(
                    ConstantsStrings.searchCharacterName,
                    style: TextStyle(
                      color: AppColors.darkSpace,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
