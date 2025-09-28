

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fare/core/components/button/button_widget.dart';
import 'package:fare/core/utils/enum.dart';
import 'package:fare/features/language/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/text/text.dart';
import '../../../core/res/constant.dart';
import '../bloc/city_bloc.dart';
import '../model/city.dart';

class CityWidget extends StatefulWidget {
  const CityWidget({super.key});

  @override
  State<CityWidget> createState() => _CityWidgetState();
}

class _CityWidgetState extends State<CityWidget> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getData();
  }
  getData(){
    BlocProvider.of<CityBloc>(context).add(GetDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<CityBloc,CityState>(

        buildWhen: (previous, current) =>previous.statusButton != current.statusButton || previous.selectedCity != current.selectedCity,
        builder: (context,state) {

          List<City> listCity=[];
          if(state.statusButton == StatusButton.success) {
            listCity = state.listCity;
            if ( listCity.first.id == -1) {
              listCity.removeAt(0);
            }
            listCity.insert(0, City(id: -1,
                countryId: 0,
                title: Strings
                    .of(context)
                    .all_cities_label,
                userId: -1,
                belongsToId: -1,
                languageId: -1,
                url: '',
                imageUrl: '',
                languageContraction: ''));

            if(state.selectedCity==null) {
              BlocProvider.of<CityBloc>(context)
                  .add(SetCityEvent(listCity[0]));
            }

          }




          debugPrint('state_city_is: ${state.toString()}');


          return (state.statusButton==StatusButton.noInternet ||  state.statusButton==StatusButton.failed)?


              ButtonWidget(loading: false, onClick: (){
                getData();

              }, text: Strings.of(context).retry_label, width: 100, height: 40,fontSize: 14,)

          :DropdownButtonHideUnderline(

            child: DropdownButton2<City>(

              isExpanded: true,



              items: listCity
                  .map((City item) => DropdownMenuItem<City>(
                value: item,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    MyText(
                      text: item.translateTitle(),

                      fontSize: 14,
                      fontWeight: FontWeight.bold,


                      overflow: TextOverflow.ellipsis,
                    ),

                  ],
                ),
              ))
                  .toList(),
              value: state.selectedCity,
              onChanged: (city) {

                BlocProvider.of<CityBloc>(context)
                    .add(SetCityEvent(city));

              },

              iconStyleData: IconStyleData(
                icon:  SizedBox(),
                iconSize: 0,
                iconEnabledColor: Colors.grey[800],
                iconDisabledColor: Colors.grey,
              ),
              buttonStyleData: ButtonStyleData(
                height: 40,
                width: 120,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  border: Border.all(
                    color: Colors.grey[600]!,
                  ),
                  color: Theme.of(context).canvasColor,
                ),
                elevation: 0,
              ),

              dropdownStyleData: DropdownStyleData(
                maxHeight: 150,


                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: Theme.of(context).canvasColor,
                ),
                offset: const Offset(0, 0),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(10),
                  thickness: MaterialStateProperty.all(6),
                  thumbVisibility: MaterialStateProperty.all(true),
                ),
              ),
              menuItemStyleData:  MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.only(left: 10, right: 10),
              ),


            ),
          );


          // return ListView.builder(
          //     shrinkWrap: true,
          //     padding: const EdgeInsets.only(top: 8, bottom: 8),
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: state.getLanguageList.length ,
          //     itemBuilder: (context, index) =>
          //         LanguageItemWidget(
          //           isProfile: widget.isProfile,
          //           isSelected:
          //           state.getLanguageList[index].language ==
          //               state.language.language,
          //           language: state.getLanguageList[index],
          //         )
          //
          // );
        }
    );
  }
}
