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

# Tugas 8
### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
`Navigator.push()` dan `Navigator.pushReplacement()` merupakan fungsi yang menampilkan halaman baru di aplikasi. Di Flutter, halaman-halaman yang telah dikunjungi oleh pengguna disimpan dalam *stack*. Pada `Navigator.push()`, halaman baru akan di-*push* ke atas *stack* sehingga halaman sebelumnya akan tetap tersimpan dalam *stack*. Namun, `Navigator.pushReplacement()` tidak mem-*push* halaman baru ke *stack*, melainkan akan mengganti halaman yang sekarang berada di atas *stack* dengan halaman barunya sehingga halaman sebelumnya akan hilang. `Navigator.push()` dapat kita gunakan apabila kita ingin kembali ke halaman awal setelah kita selesai berurusan dengan halaman baru. Sebagai contoh, jika kita melihat *profile page* diri sendiri, kita biasanya ingin kembali lagi ke halaman utama setelah itu. Dengan `Navigator.push()`, hal itu dapat mudah dilakukan karena kondisi halaman utama masih tersimpan dalam *stack* sehingga kita dapat menekan tombol *back* saja. `Navigator.pushReplacement()` dapat kita gunakan apabila kita tidak ingin kembali ke halaman awal, seperti ketika ingin pergi ke halaman utama.

### Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
- `Container`: Widget wrapper sederhana yang dapat digunakan untuk memberi warna *background* atau pun menentukan posisi dan *sizing* dari anaknya
- `Align`: Widget wrapper yang dapat digunakan untuk memposisikan anaknya relatif terhadap dirinya sendiri
- `Center`: Widget wrapper yang dapat digunakan untuk menengahkan anaknya dalam dirinya sendiri
- `Padding`: Widget wrapper yang dapat digunakan untuk memberi padding pada anaknya
- `Column`: Widget yang digunakan untuk menampilkan anak-anaknya secara vertikal
- `Row`: Widget yang digunakan untuk menampilkan anak-anaknya secara horizontal
- `GridView`: Widget yang digunakan untuk menampilkan anak-anaknya dalam grid dua dimensi

### Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Untuk tugas ini, saya baru memakai widget `TextFormField`. Saya menggunakan `TextFormField` karena widgetnya mudah dipahami dan diimplementasi. Namun, `TextFormField` memiliki kelemahan dapat menerima teks dalam bentuk apa pun dan saya memiliki variabel di dalam aplikasinya yang bertipe `int`. Kelemahan ini dapat diatasi dengan menggunakan properti `validator` pada `TextFormField`. Properti tersebut berfungsi untuk memvalidasi input sebelum disimpan sehingga saya dapat memastikan bahwa input benar-benar sebuah angka sebelum menyimpannya ke dalam variabel `int`.

### Bagaimana penerapan clean architecture pada aplikasi Flutter?
*Clean architecture* dapat diterapkan dengan membagi *file-file* dalam proyek kita sesuai dengan perannya masing-masing. Selain itu, usahakan satu *file* hanya melakukan satu hal saja dan jangan menggabungkan banyak kode yang tidak saling berkaitan ke dalam satu *file*. Ada berbagai cara untuk membagi *file* dalam proyek kita, tetapi yang paling umum adalah pembagian *presentation layer*, *domain layer*, dan *data layer*. *Presentation layer* mengandung semua *UI*, seperti *widget*, *screen*, dan lainnya. *Domain layer* mengandung *logic* utama yang akan digunakan program. *Data layer* mengandung semua data yang dapat kita ambil dan simpan dalam aplikasi.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
- [x] Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:
  Sebelum membuat halaman baru, saya membuat folder baru bernama `models` dan file baru di dalamnya bernama `pokemon.dart`. File tersebut saya gunakan untuk membuat class baru sebagai representasi dari data untuk aplikasi. Berikut adalah isinya.
  ```
  class Pokemon {
    String name;
    int amount;
    String description;
    static List<Pokemon> pokemons = [];

    Pokemon(this.name, this.amount, this.description) {
      Pokemon.pokemons.add(this);
    }   
  }
  ```
  Setelah itu, buat folder baru bernama `screens` dan buat file baru di dalamnya bernama `catch_form.dart`. File ini akan menyimpan halaman baru yang akan kita buat. Berikut adalah isi dari file tersebut.
  ```
  import 'package:flutter/material.dart';
  import 'package:pokemon_pasture_mobile/widgets/left_drawer.dart';
  import 'package:pokemon_pasture_mobile/models/pokemon.dart';

  class CatchFormPage extends StatefulWidget {
    const CatchFormPage({super.key});

    @override
    State<CatchFormPage> createState() => _CatchFormPageState();
  }

  class _CatchFormPageState extends State<CatchFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _amount = 0;
    String _description = "";

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Catch New Pokémon!',
            ),
          ),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Pokémon Name",
                      labelText: "Pokémon Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _name = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Please enter a name";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Amount",
                      labelText: "Amount",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _amount = int.parse(value);
                      });
                    },
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Please enter an amount";
                      }
                      if (int.tryParse(value) == null) {
                        return "Please enter a valid number";
                      }
                      if (int.parse(value) <= 0) {
                        return "Please enter a number greater than 0";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Description",
                      labelText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _description = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Please enter a description";
                      }
                      return null;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.indigo),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('You caught a new Pokémon!'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Name: $_name'),
                                      Text('Amount: $_amount'),
                                      Text('Description: $_description'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                          _formKey.currentState!.reset();
                          Pokemon(_name, _amount, _description);
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  ```
  - [x] Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
    Elemen input diimplementasikan dengan `TextFormField`. Berikut adalah contoh untuk variabel `name`.
    ```
    TextFormField(
      decoration: InputDecoration(
        hintText: "Pokémon Name",
        labelText: "Pokémon Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    ```
  - [x] Memiliki sebuah tombol Save.
    Tombol *save* terletak di akhir *column* dan berfungsi untuk menambahkan objek `Pokemon` baru ke dalam *list*, serta menampilkan *dialog box*.
    ```
    Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.indigo),
          ),
          onPressed: () {
            ...
          },
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
    ```
  - [x] Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
    - [x] Setiap elemen input tidak boleh kosong.
    - [x] Setiap elemen input harus berisi data dengan tipe data atribut modelnya.
      Keuda *checklist* ini diimplementasikan dengan atribut validator pada `TextFormField`. Berikut adalah contoh validasi variabel tipe data `int`.
      ```
      validator: (value) {
        if (value == null || value == "") {
          return "Please enter an amount";
        }
        if (int.tryParse(value) == null) {
          return "Please enter a valid number";
        }
        if (int.parse(value) <= 0) {
          return "Please enter a number greater than 0";
        }
        return null;
      },
      ```
- [x] Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
  Pada class `ButtonCard` di file `button_card.dart`, tambahkan kode berikut setelah menampilkan *snackbar*.
  ```
  ...
  if (item.name == "Catch Pokémon") {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CatchFormPage()));
  }
  ...
  ```
- [x] Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
  Pada atribut `onPressed` pada tombol *save* di *file* `screens/catch_form.dart`, tambahkan kode berikut.
  ```
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('You caught a new Pokémon!'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: $_name'),
                  Text('Amount: $_amount'),
                  Text('Description: $_description'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
      _formKey.currentState!.reset();
      Pokemon(_name, _amount, _description);
    }
  },
  ```
- [x] Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
  Buatlah file baru bernama `left_drawer.dart` pada folder `widgets` dan isi dengan kode berikut.
  ```
  class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context) {
      return Drawer(
        child: ListView(
          children: [
            ...
          ],
        ),
      );
    }
  }
  ```
  - [x] Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
    Isi anak pertama dari `ListView` dengan `DrawerHeader`.
    ```
    const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.indigo,
      ),
      child: Column(
        children: [
          Text(
            'Pokémon Pasture',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Text(
            "Catch new Pokémon and view all the Pokémon you've caught!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
    ```
    Kemudian, buat dua anak lagi yang merupakan tombol ke halaman utama dan halaman *catch Pokemon*.
    ```
    ListTile(
      leading: const Icon(Icons.home_outlined),
      title: const Text('Home Page'),
      // Bagian redirection ke MyHomePage
      onTap: () {
        ...
      },
    ),
    ListTile(
      leading: const Icon(Icons.add_shopping_cart),
      title: const Text('Catch Pokémon'),
      // Bagian redirection ke ShopFormPage
      onTap: () {
        ...
      },
    ),
    ```
  - [x] Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
    Isi atribut `onTap` pada `ListTile` halaman utama dengan kode berikut.
    ```
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      )
    );
    ```
  - [x] Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.
    Isi atribut `onTap` pada `ListTile` *catch Pokemon* dengan kode berikut.
    ```
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const CatchFormPage(),
      )
    );
    ```