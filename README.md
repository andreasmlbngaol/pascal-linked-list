# iLoveLinkedList v1.0

## Ringkasan

Program simulasi operasi pada Linked List mulai dari Create, Insert, Delete, sampai Conjugate.

## Daftar Isi

1. [Instalasi](#installation)
2. [Penggunaan](#usage)
3. [Create](#create)
4. [Insert](#insert)
5. [Delete](#delete)
6. [Conjugate](#conjugate)
7. [Exit](#exit)

## Instalasi {#installation}

Pastikan compiler [Free Pascal](https://www.freepascal.org/download.html) sudah terpasang di perangkat anda

### Dengan Git

```bash
# Clone Repository
git clone https://github.com/andreasmlbngaol/pascal-linked-list.git
# Change Directory
cd pascal-linked-list
# Compile Program Utama
fpc main.pas
```

### Unduh Zip

Klik link berikut untuk mengunduh file:

[iLoveLinkedList](https://github.com/andreasmlbngaol/pascal-linked-list/archive/main.zip)


Setelah file zip terunduh, ekstrak file.

Buka terminal dan arahkan ke tempat anda mengekstrak file dan masukkan perintah berikut:

```bash
fpc main.pas
```

## Penggunaan {#usage}

### Dengan Terminal

Buka lokasi file yang telah di-compile sebelumnya dan masukkan perintah berikut:
```bash
./main.exe
```

### Dengan File Explorer

Buka lokasi file yang telah di-compile sebelumnya di File Explorer dan jalankan file `main.exe`

## Create {#create}

***Buat Linked List Baru***

Masukkan `[0]` untuk membuat linked list baru.

## Insert {#insert}

***Sisip Nilai ke dalam Linked List***

* Masukkan `[1]` untuk menyisip nilai ke dalam Linked List.
* Jika hanya terdapat 1 linked list, maka otomatis akan mengoperasikan linked list tersebut.
* JIka terdapat > 1 linked list, maka user akan diminta memilih linked list yang ingin disisip dengan memasukkan nomor urut linked list.
* Selanjutnya user akan diminta memasukkan nilai yang ingin disisip.
* Jika linked list masih kosong maka akan langsung memasukkan nilai tersebut.
* Jika linked list hanya memiliki 1 elemen, maka akan muncul menu **Insert First [1]**, **Insert Last[2]**.
* Jika linked list memiliki > 1 elemen, maka akan muncul menu **Insert After [3]**.

### Insert First [1]

Menyisip elemen menjadi elemen pertama pada linked list.

### Insert Last [2]

Menyisip elemen menjadi elemen terkahir pada linked list.

### Insert After [3]

* Menyisip elemen setelah elemen dengan nilai tertentu.
* User akan diminta memasukkan nilai sebelum nilai tersebut akan disisip.
* Jika nilai ditemukan, maka akan memasukkan nilai setelahnya. Jika tidak, batal menyisip nilai.

## Delete {#delete}

***Hapus Element dari Linked Lsit***

* Masukkan `[2]` untuk menghapus elemen dari Linked List.
* Jika hanya terdapat 1 linked list, maka otomatis akan mengoperasikan linked list tersebut.
* Jika terdapat > 1 linked list, maka user aka ndiminta memilih linked list yang ingin dihapus elemnnya dengan memasukkan nomor urut linked list.
* Jika linked list hanya memiliki 1 elemen, maka akan muncul menu **Empty [0]**.
* Jika linked list memiliki > 1 elemen, maka akan muncul menu **Delete First [1]**, **Delete Last [2]**, **Delete After [3]**.

### Empty [0]

Mengosongkan linked list dengan menghapus semua elemen pada linked list.

### Delete First [1]

Menghapus elemen pertama pada linked list.

### Delete Last [2]

Menghapus elemen terakhir pada linked list.

### Delete After [3]

* Menghapus eleme nsetelah elemen dengan nilai tertentu.
* User akan diminta memasukkan nilai sebelum elemen yang ingin disisip.
* Jika nilai ditemukan, maka akan menghapus elemen setelahnya. Jika tidak, batal menghapus elemen.

## Conjugate {#conjugate}

***Menggabungkan 2 linked list***

* Fitur ini hanya muncul jika terdapat > 1 linked list.
* Masukkan `[3]` untuk menghapus elemen dari Linked List.
* User akan diminta memasukkan nomor urut linked list pertama yang ingin disambungkan.
* User akan diminta memasukkan nomor urut linked lsit kedua yang ingin disambungkan.
* Linked list kedua akan disambungkan ke linked list pertama, dan linked list kedua akan dikosongkan.

## Exit {#exit}

***Keluar dari Program***

* Masukkan `[23]` untuk keluar dari program.
* Akan ada hitung mundur untuk keluar dari program.
