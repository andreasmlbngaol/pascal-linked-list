{$MODE OBJFPC}

{$I declaration.pas}
{$I userInterface.pas}
{$I operation.pas}

var
    myLinkedList: ll;   
    validLinkedList: valid;
    linkedListCount: Word = 0;
    option: Integer;

begin
    fullscreen();
    clear();
    welcome();
    validDefault(validLinkedList);
    while (TRUE) do begin
        clear();
        showAll(myLinkedList, validLinkedList, linkedListCount);
        menu(linkedListCount);
        writeln();
        writeln('Pilih fitur yang ingin digunakan:');
        input(option);
        case (option) of
            0: createLinkedList(myLinkedList, validLinkedList, linkedListCount);
            1: insertValue(myLinkedList, linkedListCount);
            2: deleteValue(myLinkedList, linkedListCount);
            3: conjugateList(myLinkedList, linkedListCount);
            23: closeProgram();
        end;
    end;
end.