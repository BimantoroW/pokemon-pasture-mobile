# Tugas 7

### Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Stateless widget adalah widget yang keadaan atau properti-propertinya tidak bisa berubah seiring berjalannya waktu, seperti layout-nya, warnanya, atau variabel apa pun yang kita gunakan dalam widget tersebut. Stateless widget dapat menampilkan data, tetapi data tersebut tidak bisa berubah setelah widget-nya telah diinisialisasi. Di sisi lain, stateful adalah widget yang keadaan atau propert-propertinya dapat berubah seiring berjalannya waktu. Perubahan properti dari stateful widget dapat diakibatkan berbagai hal, antara lain penekanan tombol. Contoh dari stateful widget adalah default app dari flutter, di mana widget akan menyimpan state berapa kali tombol increment telah ditekan.

### Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
- `MaterialApp`\
Widget yang berfungsi sebagai *wrapper* untuk widget-widget lain serta menawarkan berbagai fungsionalitas dasar
- `Scaffold`\
Widget yang menawarkan layout visual dasar yang sering ditemukan di aplikasi mobile
- `AppBar`\
Widget yang digunakan untuk membuat *app bar* di bagian atas aplikasi
- `Text`\
Widget yang digunakan untuk menampilkan teks
- `SingleChildScrollView`\
Widget yang memuat satu *child* dan dapat di-*scroll* apabila kontennya melebihi ruang yang diberikan
- `Padding`\
Widget yang memberikan *padding* pada *child*-nya
- `Column`\
Widget yang digunakan untuk menampilkan anak-anaknya secara vertikal
- `GridView`\
Widget yang menampilkan anak-anaknya dalam *grid* 2-dimensi. `GridView.count` membuat sebuah *grid* dengan jumlah sel tetap pada *cross axis*
- `Material`\
Widget mendasar yang berfungsi sebagai *wrapper*. Material menawarkan layout visual dasar pada anaknya
- `InkWell`\
Widget yang berbentuk persegi panjang dan merupakan daerah dari sebuah Material yang responsif terhadap sentuhan
- `SnackBar`\
Widget yang menampilkan pesan di bagian bawah aplikasi
- `Container`\
Widget yang memberi kemudahan untuk menentukan posisi dan *sizing* dari anaknya
- `Center`\
Widget yang memposisikan anaknya di tengah-tengah dirinya. `Center` umumnya akan mengambil tempat sebesar orangtuanya
- `Icon`\
Widget untuk menampilkan *icon-icon* dari Flutter

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
- [x] Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.\
  Buka Command Prompt di *folder* yang akan menyimpan proyek Flutter. Kemudian, jalankan perintah
  ```
  flutter create pokemon_pasture_mobile
  ```
- [x] Membuat tiga tombol sederhana dengan ikon dan teks untuk:
  - [x] Melihat daftar item (Lihat Item)
  - [x] Menambah item (Tambah Item)
  - [x] Logout (Logout)
  
  Buat *file* baru bernama `menu.dart`. *File* ini akan menyimpan *home page* dari proyek dan segala widget lainnya yang dibutuhkan untuk membangun *home page*. Buat kelas baru bernama `CardItem` yang nantinya akan digunakan sebagai konten dari kelas `ButtonCard`. Isi dari `CardItem` adalah sebagai berikut.
    ```
    class CardItem {
    final String name;
    final IconData icon;

    CardItem(this.name, this.icon);
    }
    ```
    Kemudian, buat kelas baru dengan nama `ButtonCard` dengan isi
    ```
    class ButtonCard extends StatelessWidget {
    final CardItem item;

    const ButtonCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
        return Material(
        color: Colors.indigo,
        child: InkWell(
            // Area responsive terhadap sentuhan
            onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
            child: Container(
            // Container untuk menyimpan Icon dan Text
            padding: const EdgeInsets.all(8),
            child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    ),
                ],
                ),
            ),
            ),
        ),
        );
        }
    }
    ```
    Untuk menampilkan *card*-nya, gunakan `List` dan juga fungsi `map`.
    ```
    final List<CardItem> items = [
      CardItem("Lihat Pokémon", Icons.checklist),
      CardItem("Tambah Pokémon", Icons.add_shopping_cart),
      CardItem("Logout", Icons.logout),
    ];
    ```
    ```
    ...
    children: items.map((CardItem item) {
                return ButtonCard(item);
            }).toList(),
    ...
    ```
- [x] Memunculkan Snackbar dengan tulisan:
  - [x] "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
  - [x] "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
  - [x] "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.
  
  Di properti `onTap` pada kelas `InkWell` dalam widget `ButtonCard`, tambahkan kode berikut.
  ```
  onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
  ```
