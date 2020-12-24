import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/templates/template_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_webservice/places.dart';

class ChooseLocationScreen extends StatefulWidget {
  final places =
      new GoogleMapsPlaces(apiKey: DotEnv().env['GOOGLE_BROWSER_KEY']);
  @override
  _ChooseLocationScreenState createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {
  PlacesSearchResponse response;

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      body: Column(
        children: [
          CustomButton.flatButton(
            text: 'Get',
            onPressed: () async {
              response = await widget.places.searchByText("Kra");
              setState(() {});
            },
          ),
          if (response != null)
            for (PlacesSearchResult i in response.results)
              Text(i.formattedAddress),
        ],
      ),
    );
  }
}
