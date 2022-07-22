
SELECT T.*, ANOMALY.JUMLAH_TAGIH
from [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN T
JOIN
(
	select PSNOKA, month(BLNTAG) BULAN_TAGIH, year(BLNTAG) TAHUN_TAGIH, count(*) JUMLAH_TAGIH 
	from [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN t
	group by PSNOKA, month(BLNTAG), year(BLNTAG)
	HAVING count(*)>1
)ANOMALY
ON T.PSNOKA = ANOMALY.PSNOKA AND MONTH(T.BLNTAG)=ANOMALY.BULAN_TAGIH AND YEAR(T.BLNTAG)=ANOMALY.TAHUN_TAGIH
ORDER BY PSNOKA, BLNTAG