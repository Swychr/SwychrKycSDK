
import 'package:flutter/material.dart';
import 'package:swychr_kyc_sdk/kyc/address/route_wrapper.dart';

import 'input_field.dart';
import 'model/location.dart';



class AddressForm extends StatefulWidget {
  const AddressForm(
      {super.key,
        required this.mainKey,
        required this.apiKey,
        this.address2Controller,
        this.addressController,
        this.cityController,
        this.countryController,
        this.zipController,
        this.addressValidator,
        this.address2Validator,
        this.zipValidator,
        this.cityValidator,
        this.cityLabel = "City",
        this.zipLabel = "Postcode",
        this.countryLabel= "Country",
        this.streetAddressLabel = "City address",
        this.secondaryAddressLabel = "Street Address."});
  final GlobalKey<AddressFormState> mainKey;
  final String apiKey;
  final TextEditingController? addressController;
  final TextEditingController? address2Controller;
  final TextEditingController? zipController;
  final TextEditingController? cityController;
  final TextEditingController? countryController;
  final String? Function(String?)? addressValidator;
  final String? Function(String?)? address2Validator;
  final String? Function(String?)? zipValidator;
  final String? Function(String?)? cityValidator;


  final String streetAddressLabel;
  final String secondaryAddressLabel;
  final String zipLabel;
  final String cityLabel;
  final String? countryLabel;

  @override
  State<AddressForm> createState() => AddressFormState();
}

class AddressFormState extends State<AddressForm> {
  late final TextEditingController _streetAddressController;
  late final TextEditingController _secondaryAddressController;
  late final TextEditingController _zipController;
  late final TextEditingController _cityController;
  Location? location;

  late Widget child;
  late FocusNode addressNode;
  late final TextEditingController _countryController;

  bool modalOpen = false;
  Duration addressTransitionDuration = const Duration(milliseconds: 300);

  void setModalOpen(bool val) {
    setState(() {
      modalOpen = val;
    });
  }

  @override
  void initState() {
    _streetAddressController =
        widget.addressController ?? TextEditingController();
    _secondaryAddressController =
        widget.address2Controller ?? TextEditingController();
    _zipController = widget.zipController ?? TextEditingController();
    _cityController = widget.cityController ?? TextEditingController();
    _countryController = widget.countryController ?? TextEditingController();
    addressNode = FocusNode();
    child = Material(
        type: MaterialType.transparency,
        // color: Colors.transparent,
        child: StatefulBuilder(
          builder: (context, setSelf) {
            return InputField(
              controller: _streetAddressController,
              label: widget.streetAddressLabel,
              //autoFocus: modalOpen,
              focusNode: addressNode,
              validator: widget.addressValidator,
              prefix: !modalOpen
                  ? null
                  : IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    setSelf(
                          () {
                        modalOpen = false;
                      },
                    );
                    Navigator.of(context).pop();
                  }),
              onTap: modalOpen
                  ? null
                  : () {
                setSelf(() {
                  modalOpen = true;
                });
                Future.delayed(addressTransitionDuration)
                    .then((_) => addressNode.requestFocus());
                Navigator.of(context).push(PageRouteBuilder(
                    transitionDuration: addressTransitionDuration,
                    reverseTransitionDuration: addressTransitionDuration,
                    opaque: false,
                    fullscreenDialog: true,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    pageBuilder: (context, a, b) {
                      return AddressPickerRouteWrapper(
                        apiKey: widget.apiKey,
                        mainKey: widget.mainKey,
                        anim: b,
                        addressController: _streetAddressController,
                        zipController: _zipController,
                        countryController: _countryController,
                        cityController: _cityController,
                        setModal: setModalOpen,
                        child: child,
                      );
                    }));
              },
            );
          },
        ));
    super.initState();
  }

  @override
  void dispose() {
    addressNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(tag: "street", child: child),
        InputField(
            controller: _secondaryAddressController,
            label: widget.secondaryAddressLabel),
        LayoutBuilder(builder: (c, b) {
          return Wrap(
            spacing: 10,
            children: [
              SizedBox(
                  width: (b.maxWidth / 2) - 5,
                  child: InputField(
                      controller: _zipController,
                      validator: widget.zipValidator,
                      label: widget.zipLabel)),
              SizedBox(
                  width: (b.maxWidth / 2) - 5,
                  child: InputField(
                      controller: _cityController,
                      validator: widget.cityValidator,
                      label: widget.cityLabel)),
              SizedBox(
                  width: (b.maxWidth) - 5,
                  child: InputField(
                      controller: _countryController,
                      validator: widget.cityValidator,
                      label: widget.countryLabel!))
            ],
          );
        })
      ],
    );
  }
}

