/*
Risiko 2.C
Besaran tagihan yang tidak sesuai. Untuk tagihan tahun 2020, pemerintah membayarkan
sebesar Rp16.500 sebagai bantuan iuran kepada peserta yang berhak. Besaran bantuan iuran
tersebut turun pada tahun 2021, yakni menjadi sebesar Rp4.200 karena pembagian kewajiban
dengan pemerintah daerah. Periode tagihan dapat diidentifikasi pada kolom BLNTAG. Auditor 
perlu menguji bila terdapat tagihan untuk BLNTAG selain tahun 2020 namun ditagihkan bantuan
iuran sebesar Rp16.500.
*/

SELECT * FROM [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN t
WHERE BLNTAG>'2020-12-31' AND BANTUAN_IURAN_PUSAT=16500