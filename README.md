# Analisis Tugas 7

## Kelas di main.dart
- `MyApp` : StatelessWidget (menyusun MaterialApp, tidak ada data berubah)
- `MyHomePage`: StatefulWidget (pembuat State)
- `_MyHomePageState`: State dari MyHomePage (berisi `_counter` dan `build()`)

## 2. Tempat counter disimpan
- `_counter` ada di `_MyHomePageState`. Widget itu immutable dan bisa dibuat ulang, jadi nilainya disimpan di State yang tetap hidup.

## 3. Alur tombol +
Tombol ditekan, `_incrementCounter()` jalan, `setState` menambah `_counter`, `build()` dipanggil ulang, angka di layar berubah.

## 4. setState
`setState` mengubah data lalu memberi tahu Flutter untuk memanggil `build()` lagi.
Percobaan tanpa `setState`

## 5. Stateless vs Stateful
- Stateless: tampilan tetap (teks, ikon).
- Stateful: ada data yang berubah dan tampilan harus ikut berubah (counter, form).