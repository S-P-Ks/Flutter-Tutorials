import 'package:flutter/material.dart';
import 'package:flutter_tutorials/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static final routeName = "/filters";
  final Function changeState;
  Map<String, bool> filters;

  FilterScreen({Key? key, required this.filters, required this.changeState})
      : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _gluttenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _gluttenFree = widget.filters["gluten"] as bool;
    _lactoseFree = widget.filters["lactose"] as bool;
    _vegan = widget.filters["vegan"] as bool;
    _vegetarian = widget.filters["vegetarian"] as bool;

    print(widget.filters);
    super.initState();
  }

  onSaveHandler() {
    var f = {
      "gluten": _gluttenFree,
      "lactose": _lactoseFree,
      "vegan": _vegan,
      "vegetarian": _vegetarian,
    };

    widget.changeState(f);
  }

  Widget buildSwitchTile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (val) => updateValue(val),
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Filters"),
          actions: <Widget>[
            IconButton(onPressed: onSaveHandler, icon: const Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Adjust your mean section.",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchTile(
                  "GLuten-Free",
                  "Include non gluten food",
                  _gluttenFree,
                  (val) {
                    setState(() {
                      _gluttenFree = val;
                    });
                  },
                ),
                buildSwitchTile(
                  "Lactose-Free",
                  "Include non lactose food",
                  _lactoseFree,
                  (val) {
                    setState(() {
                      _lactoseFree = val;
                    });
                  },
                ),
                buildSwitchTile(
                  "Vegan",
                  "Include vegan food",
                  _vegan,
                  (val) {
                    setState(() {
                      _vegan = val;
                    });
                  },
                ),
                buildSwitchTile(
                  "Vegetarian",
                  "Include vegetarian food",
                  _vegetarian,
                  (val) {
                    setState(() {
                      _vegetarian = val;
                    });
                  },
                )
              ],
            ))
          ],
        ));
  }
}
