/*
Risiko 2.D
Adanya tagihan yang memiliki NIK tidak valid. NIK merupakan identifikasi utama yang dapat
dipergunakan untuk menguji status kependudukan peserta tersebut. BPJS perlu memastikan
bahwa NIK masing-masing peserta yang terdaftar adalah NIK yang valid. Pengujian validitas NIK
sederhana adalah dengan membandingkan tanggal lahir peserta dengan kode tanggal lahir pada
digit ke-7 sampai dengan 12 NIK. Jika penduduk tersebut laki-laki, maka digit ke-7 sampai dengan
12 dari NIK adalah tanggal lahir. Namun jika penduduk tersebut perempuan, maka komponen
tanggal lahir NIK tersebut ditambah 40.
Contoh:
- Ahmad seorang laki-laki yang memiliki tanggal lahir 10 Juli 1978, digit ke-7 s.d. 14 NIK Ahmad
adalah 10071978
- Bunga seorang perempuan yang memiliki tanggal lahir 12 September 1986, digit ke-7 s.d. 14
NIK Bunga adalah 52091986. Karena komponen tanggal lahirnya, yakni 12 akan ditambah
dengan 40. 
*/

SELECT t.*, p.JENIS_KELAMIN
FROM [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN t
LEFT JOIN [bpjs-peserta].dbo.PESERTA p
ON p.PSNOKA=t.PSNOKA
WHERE 
/*BULAN LAHIR TIDAK SAMA DENGAN DIGIT 9 DAN 10*/
MONTH(t.TGLLHR)!= CAST(SUBSTRING(t.NIK,9,2) AS INT) 
/*TAHUN LAHIR TIDAK SAMA DENGAN DIGIT 11 S.D 14*/
OR YEAR(t.TGLLHR)!=CAST(SUBSTRING(t.NIK,11,4) AS INT) 
/*TANGGAL LAHIR TIDAK SAMA DENGAN DIGIT 7 DAN 8, DAN JIKA PEREMPUAN DITAMBAH 40*/
OR(p.JENIS_KELAMIN=1 AND DAY(t.TGLLHR)!=CAST(SUBSTRING(t.NIK,7,2) AS INT)) OR (p.JENIS_KELAMIN=2 AND DAY(t.TGLLHR)+40!=CAST(SUBSTRING(t.NIK,7,2) AS INT) )