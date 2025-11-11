# Ariza Nola Rufiana
# H1D023005
# Shift C

## Alur *Passing Data*
1. Pengguna mengisi form pada **FormDataPage** (`form_data.dart`).
2. Saat tombol **Simpan** ditekan dan validasi lolos, aplikasi melakukan navigasi:
   ```dart
   Navigator.push(
     context,
     MaterialPageRoute(
       builder: (_) => TampilDataPage(
         nama: nama,
         nim: nim,
         tahunLahir: tahun,
       ),
     ),
   );

  <img width="462" height="978" alt="Input Data" src="https://github.com/user-attachments/assets/11b9c0fd-fa59-413f-877c-eeda0f9f75ef" />
  <img width="476" height="924" alt="Tampil Data" src="https://github.com/user-attachments/assets/d00bfb57-e34b-45e1-a66f-378b9ff7231c" />

