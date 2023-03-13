class washmodel {
  final String washname;
  final String dryer;
  final String washer;
  final String lat;
  final String images;
  //final String location;
  //final String kilo;
  final String lon;

  washmodel({
    required this.washname,
    required this.images,
    required this.washer,
    required this.lat,
    required this.lon,
    //required this.kilo,
    // required this.location,
    required this.dryer,
  });

  static washmodel fromMap({required Map map}) => washmodel(
        washname: map['site_name'],
        images: map['img_site'],
        washer: map['site_washer_count'],
        lon: map['longitude'],
        lat: map['latitude'],
        dryer: map['site_dryer_count'],
      );
}
