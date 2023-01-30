import 'package:flutter/cupertino.dart';

NetworkImage getValidity() {
  try {
    return NetworkImage(
        'https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg');
  } catch (e) {
    print(e.toString());
    return NetworkImage(
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
  }
}
