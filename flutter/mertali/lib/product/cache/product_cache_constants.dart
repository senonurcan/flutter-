enum ProductCacheConstants {
  themeKey(value: "themeKey"),
  firstOpen(value: "firstOpen"),
  mySuggestions(value: "mySuggestions"),
  profilePhoto(value: "profilePhoto"),
  ;

  const ProductCacheConstants({
    required this.value,
  });

  final String value;
}
