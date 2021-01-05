import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geohash/geohash.dart';
import 'package:google_maps_webservice/places.dart';

import '../../../blocs/abstract_blocs/forms/form_address_field_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import '../../../blocs/abstract_blocs/search_filter/search_filter_bloc.dart';
import '../../../blocs/specific_blocs/search_places_bloc.dart';
import '../../../models/utils/geolocation.dart';
import '../../custom_widgets/buttons/custom_button.dart';
import '../search_screen.dart';

class FormAddressField extends StatelessWidget {
  final FormAddressFieldBloc formFieldBloc;
  final FormDataBloc formDataBloc;
  FormAddressField({@required this.formFieldBloc, @required this.formDataBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchPlacesBloc(),
      child: Column(
        children: [
          BlocBuilder(
            cubit: formFieldBloc,
            builder: (context, state) {
              return BlocConsumer(
                cubit: BlocProvider.of<SearchPlacesBloc>(context),
                listener: (context, state) {
                  if (state is SearchFilterSelectedOptionState) {
                    PlacesSearchResult result = state.selectedOption;

                    if (formFieldBloc.editingEnabled) {
                      String geohash = Geohash.encode(
                          result.geometry.location.lat,
                          result.geometry.location.lng);
                      formDataBloc.add(
                        FormDataEditingEvent(
                          formFieldBloc: formFieldBloc,
                          result: Geolocation(
                            geohash: geohash,
                            address: result.formattedAddress,
                          ),
                        ),
                      );
                    }
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      CustomButton.goToOtherScreen(
                        text: 'Choose location',
                        enabled: formFieldBloc.editingEnabled,
                        onPressed: () async {
                          await SearchScreen.show(context,
                              BlocProvider.of<SearchPlacesBloc>(context));
                        },
                      ),
                      if (formFieldBloc.result != null)
                        Column(
                          children: [Text(formFieldBloc.result.address)],
                        ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
