import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';

Text normalTextApp(String text, BuildContext context, {align = TextAlign.left}) {
  return Text(text, 
    textAlign: align,
    style: Theme.of(context).textTheme.bodyLarge,
  );
}

Text mediumTextApp(String text, BuildContext context, {align = TextAlign.left}) {
  return Text(text, 
    textAlign: align,
    style: Theme.of(context).textTheme.titleMedium,
  );
}

Text headingTextApp(String text, BuildContext context, {align = TextAlign.left}) {
  return Text(text, 
    textAlign: align,
    style: Theme.of(context).textTheme.titleLarge,
  );
}

Text secondaryTextApp(String text, BuildContext context, {align = TextAlign.left}) {
  return Text(text, 
    textAlign: align,
    style: Theme.of(context).textTheme.bodyMedium,
  );
}

Text smallTextApp(String text, BuildContext context, {align = TextAlign.left}) {
  return Text(text, 
    textAlign: align,
    style: Theme.of(context).textTheme.bodySmall,
  );
}
Text tinyTextApp(String text, BuildContext context, {align = TextAlign.left}) {
  return Text(text, 
    textAlign: align,
    style: Theme.of(context).textTheme.labelSmall,
  );
}


TextFormField inputForm(
  String textLabel,
  TextEditingController controler, 
  String? Function(String?)? onValid,
  {
    bool obscureText = false, 
    String symb = '*', 
    TextInputType type = TextInputType.text,
  }
  ){
  return TextFormField(
    controller: controler,
    obscureText: obscureText,
    keyboardType: type,
    cursorWidth: 1,
    validator: onValid,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.secondary, width: 2)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.secondary, width: 2)
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: const Color.fromARGB(255, 192, 27, 27), width: 2)
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: const Color.fromARGB(255, 192, 27, 27), width: 2)
      )
    ),
  );
}



ElevatedButton buttonApp(BuildContext context, VoidCallback onPress, String text, {size = 1}) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.secondary),
      elevation: WidgetStateProperty.all(3),
      minimumSize: WidgetStateProperty.all(
        Size(
          MediaQuery.of(context).size.width * size,
          45
        )
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    onPressed: onPress,
    child: Text(text, style: TextStyle(color: AppColors.darkText),),
  );
}

ElevatedButton mainButtonApp(BuildContext context, VoidCallback onPress, String text, {size = 1}) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.secondary),
      elevation: WidgetStateProperty.all(3),
      minimumSize: WidgetStateProperty.all(
        Size(
          MediaQuery.of(context).size.width * size,
          45
        )
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        ),
      ),
    ),
    onPressed: onPress,
    child: Text(
      text, 
      style: GoogleFonts.poppins(
        color: AppColors.darkText,
        fontSize: 18,
        fontWeight: FontWeight.w600
      ),
      textAlign: TextAlign.center,
    ),
  );
}

OutlinedButton mainOutlinedButtonApp(BuildContext context, VoidCallback onPress, String text, {size = 1}) {
  return OutlinedButton(
    style: ButtonStyle(
      side: WidgetStateProperty.all(
        BorderSide(color: AppColors.secondary, width: 3)
      ),
      backgroundColor: WidgetStateProperty.all(const Color.fromARGB(0, 29, 114, 184)),
      elevation: WidgetStateProperty.all(3),
      minimumSize: WidgetStateProperty.all(
        Size(
          MediaQuery.of(context).size.width * size,
          45
        )
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        ),
      ),
    ),
    onPressed: onPress,
    child: Text(text,textAlign: TextAlign.center, style: GoogleFonts.poppins(
      color: AppColors.secondary,
      fontSize: 18,
      fontWeight: FontWeight.w600
    ),),
  );
}





class MultiSelectSearchableDropdown extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final Function(List<String>) onSelected;

  const MultiSelectSearchableDropdown({
    Key? key,
    required this.items,
    required this.hintText,
    required this.onSelected,
  }) : super(key: key);

  @override
  _MultiSelectSearchableDropdownState createState() => _MultiSelectSearchableDropdownState();
}

class _MultiSelectSearchableDropdownState extends State<MultiSelectSearchableDropdown> {
  final TextEditingController _controller = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  List<String> _filteredItems = [];
  List<String> _selectedItems = [];
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
  }

  void _toggleOverlay() {
    if (_isDropdownOpen) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
  }

  void _showOverlay() {
    _removeOverlay(); // Supprime un ancien overlay avant d'en créer un nouveau

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _isDropdownOpen = true;
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      _isDropdownOpen = false;
    }
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = widget.items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
    _showOverlay();
  }

  void _toggleSelection(String item) {
    setState(() {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        _selectedItems.add(item);
      }
      widget.onSelected(_selectedItems);
    });
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: MediaQuery.of(context).size.width * 0.9,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, 50),
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(8),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  final isSelected = _selectedItems.contains(item);

                  return ListTile(
                    title: Text(item),
                    trailing: isSelected ? Icon(Icons.check, color: Colors.blue) : null,
                    onTap: () {
                      _toggleSelection(item);
                      _showOverlay();
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CompositedTransformTarget(
          link: _layerLink,
          child: TextField(
            controller: _controller,
            onChanged: _filterItems,
            decoration: InputDecoration(
              labelText: widget.hintText,
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(_isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                onPressed: _toggleOverlay,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 5,
          children: _selectedItems.map((item) => Chip(
            label: Text(item),
            onDeleted: () {
              setState(() {
                _selectedItems.remove(item);
                widget.onSelected(_selectedItems);
              });
            },
          )).toList(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }
}
