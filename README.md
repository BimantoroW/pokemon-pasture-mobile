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
  
# Tugas 9

### Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Iya, JSON tetap dapat diambil tanpa model. Namun, pengambilan JSON tanpa model akan menyusahkan kita karena data dari JSON tidak bisa disimpan ke struktur data yang rapi sehingga kita harus lebih teliti dalam mengolahnya.

### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest berfungsi untuk mengelola state dari user. CookieRequest akan menyimpan session user sehingga detail mengenai login user dapat dikirim ke web server django jika dibutuhkan. Instance CookieRequest perlu dibagikan ke semua komponen di Flutter karena kita membutuhkan satu instance CookieRequest yang sama sepanjang aplikasi berjalan. Jika kita membuat instance baru, detail mengenai user yang telah disimpan akan hilang.

### Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
- Buat model di aplikasi Flutter untuk menyimpan data dari JSON yang nanti didapatkan
- Kirimkan request kepada web server Django untuk meminta data yang diinginkan dalam bentuk JSON.
- Parse JSON tersebut dan konversikan ke instance dari model yang telah dibuat
- Tampilkan data yang telah di-parse menggunakan widget `FutureBuilder`.
- Jika dalam tahap pengambilan data terjadi error, error tersebut akan di-handle oleh `FutureBuilder` dengan cara mengecek kondisional `snaspshot.hasError`

### Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
- Buat metode view baru di aplikasi Django yang menerima post request dan data JSON di body request tersebut
- Body request tersebut akan berisi username dan password dari user yang ingin login
- Autentikasikan username dan password tersebut dengan method `authenticate` dari Django
- Jika autentikasi berhasil, login user dengan method `login` dari Django agar session disimpan di server. Kemudian, kembalikan HTTP response dalam bentuk JSON dengan salah satu key-value pair berupa `status: True`.
- Jika autentikasi tidak berhasil, kembalikan HTTP response dalam bentuk JSON dengan salah satu key-value pair berupa `status: False`
- Di aplikasi Flutter, gunakan method `request.postJson` untuk membuat post request ke URL view yang telah dibuat, serta isi body dari request-nya dengan username dan password user.
- Saat menerima response dari server, cek apakah `status` bernilai `True` atau `False`.
- Jika bernilai `True`, navigasi aplikasi ke halaman `MyHomePage`
- Jika bernilai `False`, tampilkan dialog box yang memberi informasi bahwa data login salah.

### Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
Widget-widget baru:\
- `FutureBuilder`: Widget yang membangun dirinya sendiri berdasarkan data terbaru dari objek `Future`
- `Provider`: Widget yang dapat memberi suatu objek ke semua anak-anaknya
- `SizedBox`: Widget untuk memberi jarak
- `ListView`: Digunakan untuk menampilkan data banyak

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
- [x] Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.\
  Saya men-deploy ulang dan memperbaiki masalah-masalah yang ada.
- [x] Membuat halaman login pada proyek tugas Flutter.\
 Buat file baru bernama `login.dart` di folder `lib/screens`. Isi file tersebut dengan kode berikut.
  ```
  import 'package:pokemon_pasture_mobile/screens/menu.dart';
  import 'package:flutter/material.dart';
  import 'package:pbp_django_auth/pbp_django_auth.dart';
  import 'package:provider/provider.dart';
  import 'package:pokemon_pasture_mobile/screens/register.dart';

  class LoginApp extends StatelessWidget {
    const LoginApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      );
    }
  }

  class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    _LoginPageState createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      ...
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(width: 12.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  RegisterPage()));
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }

  ```
- [x] Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.\
  - Buat app baru di Django bernama `authentication`.
  - Tambah `authentication` ke `INSTALLED_APPS` pada `settings.py`
  - Install package `django-cors-headers`
  - Tambah `corsheaders` ke `INSTALLED_APPS` pada `settings.py`
  - Tambah `corsheaders.middleware.CorsMiddleware` ke `MIDDLEWARE` pada `settings.py`
  - Buat view baru untuk meng-handle login.
    ```
    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                # Status login sukses.
                return JsonResponse({
                    "username": user.username,
                    "pk": user.pk,
                    "status": True,
                    "message": "Login sukses!"
                    # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, akun dinonaktifkan."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, periksa kembali email atau kata sandi."
            }, status=401)
    ```
  - Hubungkan view tersebut dengan `urls.py`
  - Pada file `login.dart`, tambahkan kode berikut di bagian `onPressed` dari tombol login.
    ```
    onPressed: () async {
      String username = _usernameController.text;
      String password = _passwordController.text;

      // Cek kredensial
      final response = await request
          .login("http://localhost:8000/auth/login/", {
        'username': username,
        'password': password,
      });

      if (request.loggedIn) {
        String message = response['message'];
        String uname = response['username'];
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
              content: Text("$message Selamat datang, $uname.")));
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Gagal'),
            content: Text(response['message']),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      }
    },
    ```
  - Ubah `home: MyHomePage()` menjadi `home: LoginPage()` di file `main.dart`
- [x] Membuat model kustom sesuai dengan proyek aplikasi Django.
  - Buat model dengan bantuan https://app.quicktype.io/
  - Copy dan paste data JSON dari model Django yang ingin dibuat di Flutter
  - Beri nama model sesuai yang diinginkan
  - Ubah bahasa yang digunakan menjadi Dart
  - Copy dan paste kode yang dihasilkan pada aplikasi Flutter
- [x] Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
  - Buat file baru bernama `list_pokemon_all.dart` di folder `lib/screens`. Isi file tersebut dengan kode berikut.
    ```
    import 'package:flutter/material.dart';
    import 'package:pokemon_pasture_mobile/screens/pokemon_detail.dart';
    import 'package:pokemon_pasture_mobile/widgets/left_drawer.dart';
    import 'package:pokemon_pasture_mobile/models/pokemon.dart';
    import 'package:http/http.dart' as http;
    import 'dart:convert';

    class ViewPokemonPage extends StatefulWidget {
      const ViewPokemonPage({super.key});

      @override
      State<ViewPokemonPage> createState() => _ViewPokemonPageState();
    }

    class _ViewPokemonPageState extends State<ViewPokemonPage> {
      late Future<List<Pokemon>> futureListPokemon;

      @override
      void initState() {
        super.initState();
        futureListPokemon = fetchPokemon();
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Product'),
            ),
            drawer: const LeftDrawer(),
            body: FutureBuilder<List<Pokemon>>(
                future: futureListPokemon,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Pokemon> list = snapshot.data! as List<Pokemon>;
                    if (list.isEmpty) {
                      return const Column(
                        children: [
                          Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          SizedBox(height: 8),
                        ],
                      );
                    } else {
                      return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (_, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PokemonDetailPage(pokemon: list[index])));
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${snapshot.data![index].fields.name}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )));
                    }
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }));
      }

      Future<List<Pokemon>> fetchPokemon() async {
        final response = await http.get(
          Uri.parse('http://localhost:8000/json/'),
          headers: {"Content-Type": "application/json"},
        );

        if (response.statusCode == 200) {
          List<Pokemon> listPokemon = [];
          var data = jsonDecode(utf8.decode(response.bodyBytes));
          for (var d in data) {
            if (data != null) {
              listPokemon.add(Pokemon.fromJson(d));
            }
          }
          return listPokemon;
        } else {
          throw Exception("Failed to load Pokémon");
        }
      }
    }

    ```
- [x] Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
  - Buat file baru bernama `pokemon_detail.dart` di folder `lib/screens`. Isi file tersebut dengan kode berikut.
    ```
    import 'package:flutter/material.dart';
    import 'package:pokemon_pasture_mobile/widgets/left_drawer.dart';
    import 'package:pokemon_pasture_mobile/models/pokemon.dart';

    class PokemonDetailPage extends StatelessWidget {
      final Pokemon pokemon;
      PokemonDetailPage({super.key, required this.pokemon});

      @override
      Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Details"),
            ),
            drawer: const LeftDrawer(),
            body: Center(
              child: Column(
                children: [
                  Text("Model: ${pokemon.model}"),
                  const SizedBox(height: 10),
                  Text("ID: ${pokemon.pk}"),
                  const SizedBox(height: 10),
                  Text("Name: ${pokemon.fields.name}"),
                  const SizedBox(height: 10),
                  Text("Pokedex Number: ${pokemon.fields.pokedexNumber}"),
                  const SizedBox(height: 10),
                  Text("Description: ${pokemon.fields.description}"),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: const Text('Back'),
                  ),
                ],
              ),
            ));
      }
    }
    ```