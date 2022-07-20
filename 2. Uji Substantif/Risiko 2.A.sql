/*
Risiko 2.A
Adanya peserta yang ditagihkan bantuan iurannya lebih dari satu kali. BPJS Kesehatan
menagihkan bantuan iuran JKN kepada pemerintah sesuai dengan tanggungan premi yang telah
dibayar lunas secara mandiri oleh peserta tersebut, yang tercermin pada kolom BLNTAG. Auditor
perlu menguji, jika ada 2 atau lebih tagihan yang memiliki BLNTAG sama, ditagihkan atas PSNOKA
yang sama, namun pada BULAN yang berbeda. Artinya, atas peserta tersebut BPJS telah
menagihkan bantuan iurannya pada periode sebelumnya, namun pada periode selanjutnya
ditagihkan kembali.
*/

SELECT T.*, ANOMALY.JUMLAH_TAGIH
from [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN T
JOIN
(select PSNOKA, month(BLNTAG) BULAN_TAGIH, year(BLNTAG) TAHUN_TAGIH, count(*) JUMLAH_TAGIH 
from [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN t
group by PSNOKA, month(BLNTAG), year(BLNTAG)
HAVING count(*)>1)ANOMALY
ON T.PSNOKA = ANOMALY.PSNOKA AND MONTH(T.BLNTAG)=ANOMALY.BULAN_TAGIH AND YEAR(T.BLNTAG)=ANOMALY.TAHUN_TAGIH
ORDER BY PSNOKA, BLNTAG