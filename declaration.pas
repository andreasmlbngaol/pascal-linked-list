uses crt, SysUtils, DateUtils, Windows;

const
    limit = 10;

type
    {Tipe data untuk nilai Linked List}
    value = Integer;

    {Tipe data record untuk sebuah node pada Linked List}
    recordLinkedList = Record
        value: value;
        next: Pointer;
    end;

    {Tipe data pointer yang menunjuk tipe recordLinkedList}
    address = ^recordLinkedList;

    {Membuat Class LinkedList}
    LinkedList = Class
        private
            {Property yang menunjuk elemen pertama Linked List}
            start: address; 
            {Method untuk membuat node baru untuk nilai yang dimasukkan}
            function createNode(value: value): address;
            {Mengecek apakah LinkedList kosong}
            function isEmpty(): Boolean;
        
        public
            {Pembuatan Objek}
            constructor Create;
            {Mengecek elemen pertama LinkedList}
            function first(): value;
            {Mengecek elemen terakhir LinkedList}
            function last(): value;
            {Mengecek panjang LinkedList}
            function length(): Word;
            {Menyisip ke elemen pertama}
            procedure insertFirst(value: value);
            {Menyisip elemen setelah nilai tertentu}
            procedure insertAfter(value: value; after: value);
            {Menyisip ke elemen terakhir}
            procedure insertLast(value: value);
            {Menghapus elemen pertama}
            procedure deleteFirst();
            {Menghapus elemen setelah nilai tertentu}
            procedure deleteAfter(after: value);
            {Menghapus elemen terakhir}
            procedure deleteLast();
            {Menyambungkan 2 linked list}
            procedure conjugate(var myLinkedList2: LinkedList);
            {Menampilkan seluruh isi linkedlist}
            procedure show();
            {Mengosongkan linked list}
            procedure empty();
    end;
    valid = array[0..(limit-1)] of Boolean;
    ll = array[0..(limit-1)] of LinkedList;