{Menampilkan alamat dari suatu node linked list}
function addressOf(node: address): String;
var
    addr: String;
begin
    if(node <> nil) then begin
        addr := IntToHex(PtrUInt(node));
        exit(addr[5] + addr[6] + addr[7] + addr[8]);
    end;
    exit('Nil');
end;

constructor LinkedList.Create;
begin
    start := nil;
end;

function LinkedList.createNode(value: value): address;
begin
    new(createNode);
    createNode^.value := value;
    createNode^.next := nil;
    exit(createNode);
end;

function LinkedList.isEmpty(): Boolean;
begin
    exit(start = nil);
end;

function LinkedList.first(): value;
begin
    try
        exit(start^.value);
    except
        writeln('Linked List kosong');
    end;
end;

function LinkedList.last(): value;
var
    node: address;
begin
    try
        node := start;
        while(node^.next <> nil) do begin
            node := node^.next;
        end;
        exit(node^.value);
    except
        writeln('Linked List Kosong');
    end;
end;

function LinkedList.length(): Word;
var
    node: address;
    count: Word = 0;
begin
    node := start;
    while(node <> nil) do begin
        count += 1;
        node := node^.next;
    end;
    exit(count);
end;

procedure LinkedList.insertFirst(value: value);
var
    newNode: address;
begin
    newNode := createNode(value);
    {Jika Linked List kosong}
    if(isEmpty()) then begin
        start := newNode;
    {Jika Linked List tidak kosong}
    end else begin
        newNode^.next := start;
        start := newNode;
    end;
    colorize(White, Green);
    writeln('Berhasil Memasukkan ', value); 
    write('Tekan enter untuk kembali...'); readln();
    defaultColor();
end;

procedure LinkedList.insertAfter(value: value; after: value);
var
    newNode: address;
    found: Boolean = false; {Elemen tertentu ditemukan atau tidak}
    traversal: address; {Untuk traversal}
begin
    newNode := createNode(value);
    if(isEmpty()) then begin
        writeln('Linked List kosong');
        exit;
    end;
    traversal := start;
    repeat
        if(traversal^.value = after) then begin
            newNode^.next := traversal^.next;
            traversal^.next := newNode;
            found := true;
            break;
        end else begin
            traversal := traversal^.next;
        end;
    until(traversal = nil);

    if(not found) then begin
        colorize(Black, Yellow);
        writeln('Gagal menyisip ', value, ' karena ', after, ' tidak ditemukan');
    end else begin
        colorize(White, Green);
        writeln('Berhasil Memasukkan ', value); 
    end;
    write('Tekan enter untuk kembali...'); readln();
    defaultColor();
end;

procedure LinkedList.insertLast(value: value);
var
    newNode: address;
    traversal: address;
begin
    newNode := createNode(value);
    traversal := start;
    if(isEmpty()) then begin
        start := newNode;
        exit;
    end;

    while(traversal^.next <> nil) do begin
        traversal := traversal^.next;
    end;
    traversal^.next := newNode;
end;

procedure LinkedList.deleteFirst();
var
    node: address;
begin
    if(isEmpty()) then begin
        writeln('Gagal menghapus karena Linked List kosong');
        exit;
    end;

    node := start; {Penyimpanan sementara elemen pertama}
    start := start^.next; {Mengubah start menjadi elemen ke-2}
    dispose(node); {Membebaskan memori}

    colorize(White, Green);
    writeln('Berhasil menghapus elemen pertama');
    write('Tekan enter untuk kembali...');
    defaultColor();
    readln();
end;

procedure LinkedList.deleteAfter(after: value);
var
    node: address;
    traversal: address;
    found: Boolean = false;
begin
    if(isEmpty()) then begin
        writeln('Gagal menghapus karena Linked List kosong');
        exit;
    end;
    traversal := start;
    while(traversal^.next <> nil) do begin
        if(traversal^.value = after) then begin
            node := traversal^.next;
            traversal^.next := node^.next;
            dispose(node);
            found := true;

            colorize(White, Green);
            writeln('Berhasil menghapus elemen setelah ', after);
            write('Tekan enter untuk kembaali...');
            defaultColor();
            readln();

            exit;
        end;
        traversal := traversal^.next;
    end;
    if(not found) then begin
        colorize(Black, Yellow);
        writeln('Gagal menghapus karena elemen setelah ', after, ' tidak ditemukan');
        write('Tekan enter untuk kembali...');
        defaultColor();
        readln();
    end;
end;

procedure LinkedList.deleteLast();
var
    node:address;
    traversal: address;
begin
    if(isEmpty()) then begin
        writeln('Gagal menghapus karena Linked List kosong');
        exit;
    end;

    traversal := start;
    node := nil;

    while(traversal^.next <> nil) do begin
        node := traversal;
        traversal := traversal^.next;
    end;

    if(node = nil) then begin
        start := nil;
        dispose(traversal);
        exit;
    end;

    node^.next := nil;
    dispose(traversal);

    colorize(White, Green);
    writeln('Berhasil menghapus elemen terakhir');
    write('Tekan enter untuk kembaali...');
    defaultColor();
    readln();
end;    

procedure LinkedList.show();
var
    traversal: address;
begin
    if(isEmpty()) then begin
        colorize(Black, Magenta);
        writeln('|Nil|');
        defaultColor();
        exit;
    end;

    traversal := start;
    colorize(Black, Green);
    write('|', addressOf(traversal), '|');
    defaultColor();
    write(' -> ');

    repeat
        write(traversal^.value, ' ');
        if(addressOf(traversal^.next) = 'Nil') then begin
            colorize(Black, Red);
        end else begin
            colorize(Black, Yellow);
        end;
        write('|', addressOf(traversal^.next) ,'|');
        defaultColor();

        if(traversal^.next <> nil) then begin
            write(' -> ');
        end;
        traversal := traversal^.next;
    until(traversal = nil);
    writeln();
end;

{Mengosongkan list}
procedure LinkedList.empty();
var
    traversal: address;
    node: address;
begin
    if(length() = 0) then begin
        writeln('List Kosong');
        exit;
    end;
    if(length() = 1) then begin
        start := nil;
        exit;
    end;

    traversal := start;
    repeat
        node := traversal;
        traversal := traversal^.next;
        dispose(node);
    until (traversal = nil);
    start := nil;
end;

{Menggabungkan Linked List}
procedure LinkedList.conjugate(var myLinkedList2: LinkedList);
var
    traversal: address;
begin
    if(myLinkedList2.start = nil) then begin
        exit;
    end;
    if (start = nil) then begin
        start := myLinkedList2.start;
    end;
    traversal := start;
    while(traversal^.next <> nil) do begin
        traversal := traversal^.next;
    end;
    traversal^.next := myLinkedList2.start;
    colorize(White, Green);
    writeln('List berhasil disambungkan');
    write('Tekan enter untuk kembali');
    defaultColor();
    readln();
    myLinkedList2.start :=  Nil;
end;

procedure validDefault(var validLinkedList: valid);
var
    i: Integer;
begin
    for i := 0 to limit-1 do begin
        validLinkedList[i] := FALSE;
    end;
end;