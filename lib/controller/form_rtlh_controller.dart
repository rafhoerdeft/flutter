import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
// import '../shared/login_shared.dart';

class FormRtlhController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController nik_rtlh = TextEditingController(); //nik
  TextEditingController nkk_rtlh = TextEditingController(); //nama
  TextEditingController alamat_rtlh = TextEditingController(); //alamat
  final List<JenisKelamin> jk = [
    JenisKelamin(nama: 'Laki-Laki', val: 1),
    JenisKelamin(nama: 'Perempuan', val: 2)
  ]; //jenis kelamin
  TextEditingController umur_rtlh = TextEditingController(); //umur
  TextEditingController jml_rtlh = TextEditingController(); //jml anggota
  TextEditingController jml_k_rtlh = TextEditingController(); //jml kk
  TextEditingController sejahtera_rtlh =
      TextEditingController(); //status sejahtera

  final jk_rtlh = ''.obs;

  final progres_bar = 0.0.obs;

  final latitude = 0.0.obs;
  final longitude = 0.0.obs;
  final loadingPos = false.obs;

  @override
  void onInit() {}

  getPosition() async {
    loadingPos.value = true;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude.value = position.latitude;
    longitude.value = position.longitude;

    loadingPos.value = false;
    // print(position.toString());
  }
}

class JenisKelamin {
  String nama;
  int val;

  JenisKelamin({this.nama, this.val});
}
