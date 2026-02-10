(* Exp4 : Byte stuffing (Data link layer) *)

clc;
clear;

% ---------------- Input Data ----------------
original_data = {'A','B','ESC','RITIK','ESC','EXT','KASHYAP','ESC','G','H','ESC','STX','F'};

STX = 'STX';   % Start flag
ETX = 'ETX';   % End flag

% ---------------- OUTPUT 1 ----------------
disp('1) Original Data:');
disp(original_data)

% ---------------- Byte Stuffing ----------------
stuffed_data = {};

for i = 1:length(original_data)
    if strcmp(original_data{i}, 'ESC')
        stuffed_data{end+1} = 'ESC';
        stuffed_data{end+1} = 'ESC';
    else
        stuffed_data{end+1} = original_data{i};
    end
end

% ---------------- OUTPUT 2 ----------------
disp('2) Stuffed Data:');
disp(stuffed_data)

% ---------------- Add Flags ----------------
with_flag = [{STX}, stuffed_data, {ETX}];

% ---------------- OUTPUT 3 ----------------
disp('3) Data With Flags:');
disp(with_flag)

% ---------------- Remove Flags ----------------
without_flag = with_flag(2:end-1);

% ---------------- OUTPUT 4 ----------------
disp('4) Data Without Flags:');
disp(without_flag)

% ---------------- Byte Destuffing ----------------
destuffed_data = {};
i = 1;

while i <= length(without_flag)
    if strcmp(without_flag{i}, 'ESC') && ...
       i < length(without_flag) && strcmp(without_flag{i+1}, 'ESC')
        destuffed_data{end+1} = 'ESC';
        i = i + 2;
    else
        destuffed_data{end+1} = without_flag{i};
        i = i + 1;
    end
end

% ---------------- OUTPUT 5 ----------------
disp('5) Removed Stuffed Data at Receiver (Destuffed):');
disp(destuffed_data)

% ---------------- OUTPUT 6 ----------------
disp('6) Original Data Recovered at Receiver:');
disp(destuffed_data)

