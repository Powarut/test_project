import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/providers/check_out_provider.dart';

class CostomGoogleMap extends StatefulWidget {
  const CostomGoogleMap({Key? key}) : super(key: key);

  @override
  State<CostomGoogleMap> createState() => _GoogleMapState();
}

class _GoogleMapState extends State<CostomGoogleMap> {
  LatLng _initialCameraPosition =
      LatLng(13.7650836, 100.5379664);
  late GoogleMapController controller;
  Location _location = Location();
  void _onMapCreated(GoogleMapController _value) {
    controller = _value;
    _location.onLocationChanged.listen((event) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(event.latitude!, event.longitude!), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: memberColor,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _initialCameraPosition,
                ),
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 60,left: 10,bottom: 40,top: 40),
                  child: MaterialButton(
                    onPressed: ()async{
                      await _location.getLocation().then((LocationData) {
                        setState(() {
                         checkoutProvider.setLocation = LocationData;
                        });
                      });
                      Navigator.of(context).pop();
                    },
                    color: memberColor,
                    child: Text("ตั้งค่าตำแหน่ง"),
                    shape: StadiumBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
