SELECT 
* 
FROM [bpjs-tagihan].DBO.TAGIHAN_BANTUAN_IURAN AS T
JOIN [bpjs-peserta].DBO.PESERTA P
ON T.PSNOKA = P.PSNOKA

where 
/*KRITERIA 1: BULAN DAN TAHUN Sama dg NIK*/
 SUBSTRING(T.NIK,9,6) <> FORMAT(T.TGLLHR, 'MMyyyy')
 OR
/*KRITERIA 2: TANGGAL Sama dg NIK*/
(
	(P.JENIS_KELAMIN = 1 AND SUBSTRING(T.NIK,7,2) <> day(t.tgllhr))
OR
	(P.JENIS_KELAMIN = 2 AND SUBSTRING(T.NIK,7,2) <> day(t.tgllhr)+40)
)