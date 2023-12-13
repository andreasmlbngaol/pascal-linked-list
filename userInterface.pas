{Ukuran Terminal}
function GetTerminalSize: TCoord;
var
  consoleHandle: THandle;
  consoleInfo: CONSOLE_SCREEN_BUFFER_INFO;
begin
  consoleHandle := GetStdHandle(STD_OUTPUT_HANDLE);

  if GetConsoleScreenBufferInfo(consoleHandle, consoleInfo) then
    exit(consoleInfo.dwSize)
  else
    exit(Default(TCoord));
end;

procedure fullscreen();
begin
    while(GetTerminalSize.Y < 25) do begin
        ClrScr();
        writeln('TOLONG PERBESAR UKURAN TERMINAL ANDA! (FULL SCREEN)');
        delay(500);
    end;
end;


{Memberikan warna terminal}
procedure colorize(color: Byte; backgroundColor: Byte);
begin
    TextColor(color);
    TextBackground(backgroundColor);
end;

procedure defaultColor();
begin
    TextColor(White);
    TextBackground(Black);
end;

procedure input(var variableName: Integer);
begin
    try
        write('-> '); readln(variableName);
    except
        on E: Exception do
            variableName := -1;
    end;
end;

procedure clear();
var
    i: Integer;
begin
    ClrScr();
    writeln(DateToStr(Now),' ~ SELAMAT DATANG DI iLoveLinkedList ~ ', TimeToStr(Now));
    for i := 1 to (length(DateToSTr(Now)) + length(' ~ SELAMAT DATANG DI iLoveLinkedList ~ ') + length(TimeToStr(Now))) do begin
        write('=');
    end;
    writeln();
end;

procedure welcome();
begin
    write('Ini adalah Program simulasi operasi pada ');
    colorize(Red, Black);
    writeln('Linked List');
    defaultColor();
    writeln('Disini kamu akan diberikan beberapa opsi yang dapat kamu pilih untuk menggunakan fitur tertentu');
    write('Masukkan ');
    colorize(Red, Black);
    write('angka dari pilihan');
    defaultColor();
    writeln(' dari fitur yang ingin kamu gunakan');
    write('Tekan tombol enter untuk mulai...'); readln();
end;

procedure showAll(myLinkedList: ll; validLinkedList: valid; linkedListCount: Word);
var
    i: Integer;
begin
    for i := 0 to (limit - 1) do begin
        if(validLinkedList[i] = TRUE) then begin
            colorize(Black, White);
            write('List [');
            colorize(Red, White);
            write(i + 1);
            colorize(Black, White);
            write(']');
            defaultColor();
            write(' (Jumlah Elemen: ');
            colorize(Cyan, Black);
            write(myLinkedList[i].length());
            defaultColor();
            writeln( '):');
            myLinkedList[i].show();
            writeln();
        end else begin
            break;
        end;
    end;
end;

procedure menu(linkedListCount: Word);
begin
    writeln('[0]. Buat Linked List baru');
    if(linkedListCount > 0) then begin
        writeln('[1]. Masukkan nilai ke dalam Linked List');
        writeln('[2]. Hapus elemen di linked list');
    end;
    if(linkedListCount >= 2) then begin
        writeln('[3]. Gabungkan 2 Linked List');
    end;
    writeln('[23]. Keluar dari Program')
end;

procedure createLinkedList(var myLinkedList: ll; var validLinkedList: valid; var linkedListCount: Word);
var
    i: value;
begin
    for i := 0 to (limit-1) do begin
        if(validLinkedList[i] = FALSE) then begin
            myLinkedList[i] := LinkedList.Create;
            linkedListCount += 1;
            validLinkedList[i] := TRUE;
            colorize(White, Green);
            writeln('Linked List berhasil dibuat!'); 
            write('Tekan enter untuk kembali...'); 
            defaultColor();
            readln();
            break;
        end;
        if(i = (limit-1)) then begin
            colorize(White, Yellow);
            writeln('Gagal! Batas Linked List adalah ', limit); 
            write('Tekan enter untuk kembali...');
            defaultColor();
            readln();

        end;
    end;
end;

procedure insertValue(var myLinkedList: ll; linkedListCount: Word);
var
    order: Integer;
    val: value;
    method: Integer;
    after: Integer;
begin
    if(linkedListCount > 1) then begin
        repeat
            writeln('Ingin memasukkan nilai ke Linked List berapa?');
            input(order);
        until((order > 0) AND (order <= linkedListCount));
        order -= 1;
    end else begin
        order := 0;
    end;
    writeln('Masukkan nilai yang ingin dimasukkan!');
    input(val);
    if(myLinkedList[order].length() = 0) then begin
        myLinkedList[order].insertFirst(val);
        exit;
    end;
    writeln('[1]. Masukkan menjadi elemen pertama');
    writeln('[2]. Masukkan menjadi elemen terakhir');
    if(myLinkedList[order].length() > 1) then begin
        writeln('[3]. Masukkan setelah elemen dengan nilai tertentu');
    end;
    writeln('Masukkan metode yang ingin anda gunakan');
    input(method);
    case (method) of
        1: myLinkedList[order].insertFirst(val);
        2: myLinkedList[order].insertLast(val);
        3: begin
            writeln('Dimasukkan setelah nilai apa?');
            readln(after);
            myLinkedList[order].insertAfter(val, after);
        end;
    end;
end;

procedure deleteValue(var myLinkedList: ll; linkedListCount: Word);
var
    order: Integer;
    method: Integer;
    after: value;
begin
    if(linkedListCount > 1) then begin
        repeat
            writeln('Ingin menghapus elemen di Linked List berapa?');
            input(order);
        until((order > 0) AND (order <= linkedListCount));
        order -= 1;
    end else begin
        order := 0;
    end;
    if(myLinkedList[order].length() = 0) then begin
        colorize(Black, Yellow);
        writeln('List Kosong');
        write('Tekan enter untuk kembali...');
        defaultColor();
        readln();
        exit;
    end;
    writeln('[0]. Kosongkan Linked List');
    if(myLinkedList[order].length() > 1) then begin
        writeln('[1]. Hapus elemen pertama');
        writeln('[2]. Hapus elemen terakhir');
    end;
    if(myLinkedList[order].length() > 2) then begin
        writeln('[3]. Hapus elemen SETELAH nilai tertentu');
    end;
    writeln('Pilih Metode Penghapusan!');
    input(method);
    case (method) of
        0: begin
            myLinkedList[order].empty();
            colorize(White, Green);
            writeln('List berhasil dikosongkan');
            write('Tekan enter untuk kembali');
            defaultColor();
            readln();
        end;
        1: myLinkedList[order].deleteFirst();
        2: myLinkedList[order].deleteLast();
        3: begin
            writeln('Masukkan nilai sebelumnya dari elemen yang ingin dihapus: ');
            input(after);
            myLinkedList[order].deleteAfter(after);
        end;
    end;
end;

procedure conjugateList(var myLinkedList: ll; linkedListCount: Word);
var
    list1: Integer;
    list2: Integer;
begin
    repeat
        writeln('Masukkan Linked List pertama yang ingin digabungkan: ');
        input(list1);
    until((list1 > 0) AND (list1 <= linkedListCount));
    list1 -= 1;

    repeat
        writeln('Masukkan Linked List kedua yang ingin digabungkan: ');
        input(list2);
    until((list2 > 0) AND (list2 <= linkedListCount));
    list2 -= 1;

    myLinkedList[list1].conjugate(myLinkedList[list2]);
end;

procedure closeProgram();
begin
    writeln('Terima kasih telah menggunakan program iLoveLinkedList.');
    write('Program akan tertutup dalam ');
    colorize(Black, Green);
    write('3... ');
    delay(1000);
    colorize(Black, Yellow);
    write('2... ');
    delay(1000);
    colorize(Black, Red);
    writeln('1... ');
    delay(1000);
    defaultColor();
    writeln('GoodBye');
    halt;
end;