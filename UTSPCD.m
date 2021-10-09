a = input('Tuliskan Nama Anda = ','S');
b = input('Tuliskan Nim Anda =');
d = fix(b/1000000000);
d1 = mod(b, 100);

n = d * 100 + d1;
for x = 1:n
    c1 = fix(rand(5,5) * 100);
    c2 = fix(rand(5,5) * 100);
    c3 = fix(rand(5,5) * 100);
end
R = c1
G = c2
B = c3

save(a,'b','R','G','B');

%SOAL 2
[kolom, baris] = size(R);
NAkhir = zeros(kolom, baris);
NBesar = 0;

for x = 1 : kolom
    for y = 1 : baris
        NAkhir(x, y) = round(R(x, y) * 0.4 + 0.32 + B(x, y) * 0.28);
        
        if NBesar < NAkhir(x, y)
            NBesar = NAkhir(x, y);
        end
    end
end

NAkhir

%SOAL 3 - HISTOGRAM
[kolom, baris] = size (NAkhir);
Histogram = zeros(1,NBesar);

for x = 1 : kolom
    for y = 1 : baris
        p = NAkhir(x, y);
        Histogram(p) = Histogram(p) + 1;
    end
end

figure(1)
bar(Histogram)
grid on

%SOAL 3 - DISTRIBUTIF KOMULATIF
Komulatif = zeros(1, NBesar);
for q = 1 : NBesar
    Komulatif(q) = sum(Histogram(1:q));
end

figure(2)
bar(Komulatif)
grid on

%SOAL 4 - EQUALISASI
Equalisasi = zeros(1, NBesar);
for e = 1 : NBesar
    Equalisasi(e) = round(Komulatif(e) * 7 / (kolom * baris));
end

figure(3)
bar(Equalisasi)
grid on

%SOAL 5 - LOW PASS FILTER
k = [1 1 1;1 4 1;1 1 1]
[kolom, baris] = size(NAkhir);
s = zeros(kolom, baris);
[kolom_x, baris_y] = size(k);

for x = 1 : kolom
    for y = 1 : baris
        for m1 = 1 : kolom_x
            for m2 = 1 : baris_y
                cc = x - 2 + m1;
                ii = y - 2 + m2;
                
                if cc == 0 || ii == 0 || cc == kolom + 1 ||  ii == kolom + 1
                    s(x, y) = s(x, y) + k(m1, m2) * 0;
                else
                    s(x, y) = s(x, y) + k(m1, m2) * NAkhir(cc, ii);
                end
            end
        end
    end
end

s