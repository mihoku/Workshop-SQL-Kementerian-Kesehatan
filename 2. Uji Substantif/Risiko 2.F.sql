/*
Risiko 2.F
Terdapat tagihan yang beririsan dengan tagihan untuk PBI JK. Auditor perlu menguji penagihan
ganda bantuan iuran dengan membandingkan dengan data tagihan PBI JK yang juga disediakan
oleh BPJS. Tagihan ganda diidentifikasi dari kesamaan PSNOKA dan periode penagihan (BLNTAG). 
*/

SELECT T.*, P.KETJNSPESERTA KETJNSPESERTA2, P.BANTUAN_IURAN_PUSAT BANTUAN_IURAN_PUSAT_PBIJK
FROM [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN T
JOIN [bpjs-tagihan].dbo.TAGIHAN_PBIJK P
ON P.PSNOKA = T.PSNOKA AND MONTH(T.BLNTAG) = MONTH(P.BLNTAG) AND YEAR(T.BLNTAG) = YEAR(P.BLNTAG)