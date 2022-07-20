/*a. Buat query untuk menguji ketepatan jumlah total peserta yang ditagihkan.*/
SELECT COUNT(*)JUMLAH_PESERTA FROM [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN 

/*b. Buat query untuk menguji ketepatan jumlah total besaran nilai tagihan.*/
SELECT SUM(BANTUAN_IURAN_PUSAT) NILAI_TAGIHAN FROM [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN 

/*c. Buat query untuk menguji ketepatan jumlah peserta per periode tagih.*/
SELECT BULAN, COUNT(*) JUMLAH_PESERTA FROM [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN 
GROUP BY BULAN

/*d. Buat query untuk menguji ketepatan besaran nilai tagihan per periode tagih.*/
SELECT BULAN, SUM(BANTUAN_IURAN_PUSAT) NILAI_TAGIHAN FROM [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN 
GROUP BY BULAN

/*e. Buat query untuk menguji ketepatan jumlah peserta per segmentasi.*/
SELECT KETJNSPESERTA, COUNT(*) JUMLAH_PESERTA FROM [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN 
GROUP BY KETJNSPESERTA

/*f. Buat query untuk menguji ketepatan jumlah peserta per segmentasi dan per periode tagih.*/
SELECT KETJNSPESERTA, BULAN, COUNT(*) JUMLAH_PESERTA FROM [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN 
GROUP BY KETJNSPESERTA, BULAN

/*g. Buat query untuk menguji ketepatan besaran nilai tagihan per segmentasi dan per periode tagih.*/
SELECT KETJNSPESERTA, BULAN, SUM(BANTUAN_IURAN_PUSAT) NILAI_TAGIHAN FROM [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN 
GROUP BY KETJNSPESERTA, BULAN