import 'package:alio/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

enum TypeContrat { location, vente }

class _NewPostState extends State<NewPost> {
  final _formKey = GlobalKey<FormState>();
  TypeContrat? _typeContrat = TypeContrat.location;
  List<String> dropdownValues = [
    'Maison d\'habitation',
    'Appartement',
    'Bureaux',
    'Point de vente / Boutique',
    'Batiment / Immeuble',
    'Grande Salle',
    'Salle de reunion',
    'Terrain construit',
    'Terrain vide',
    'Espace événementiel',
    'Parking',
    'Hotel'
  ];
  String? currentDropdownValue = 'Choisir une catégorie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.bgColor,
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Container(
          padding: EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            iconSize: 30,
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(
              'assets/icons/arrow_back.svg',
            ),
          ),
        ),
        // leadingWidth: 30,
        elevation: 0,
        titleSpacing: 0,
        title: const Text('Nouvelle Annonce'),
        titleTextStyle: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(color: Colors.white),
        
      ),
      body: Padding(
        padding: EdgeInsets.all(AppConst.defaultPadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Type de contrat",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.black),
              ),
              ListTile(
                title: Text('Location',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.black)),
                dense: false,
                isThreeLine: false,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                leading: Radio<TypeContrat>(
                  value: TypeContrat.location,
                  groupValue: _typeContrat,
                  onChanged: (TypeContrat? value) {
                    setState(() {
                      _typeContrat = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Vente',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.black),
                ),
                dense: false,
                isThreeLine: false,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                leading: Radio<TypeContrat>(
                  value: TypeContrat.vente,
                  groupValue: _typeContrat,
                  onChanged: (TypeContrat? value) {
                    setState(() {
                      _typeContrat = value;
                    });
                  },
                ),
              ),
              Text(
                "Catégorie",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                    border: Border.all(
                        color: const Color.fromRGBO(184, 184, 184, 1),
                        width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: currentDropdownValue,
                    icon: const Icon(
                      Icons.expand_more,
                      color: Color.fromRGBO(151, 151, 151, 1),
                    ),
                    iconSize: 36,
                    focusColor: Colors.white,
                    iconEnabledColor: AppConst.primaryColor,
                    elevation: 16,
                    isExpanded: true,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: const Color.fromRGBO(161, 161, 161, 1)),
                    onChanged: (String? newValue) {
                      setState(() {
                        currentDropdownValue = newValue!;
                      });
                    },
                    items: dropdownValues
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
