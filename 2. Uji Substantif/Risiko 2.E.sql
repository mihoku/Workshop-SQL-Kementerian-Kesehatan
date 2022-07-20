/*
Risiko 2.E
Adanya tagihan bantuan iuran JKN atas peserta dengan jenis (segmentasi) selain PBPU, BP,
ataupun PD Pemda. Program bantuan iuran ditujukan kepada peserta dengan segmentasi PBPU,
BP, dan PD Pemda. Auditor perlu menguji adanya tagihan kepada peserta yang berasal dari
segmentasi selainnya, dengan menelusuri segmentasi yang masih berlaku atas peserta tersebut
pada table JNSPESERTA sesuai kolom TMTPEG.
*/

SELECT ANOMALY.*, JT.KETJNSPESERTA
FROM
	(SELECT T.*, SEGMENTASI.KDJNSPESERTA KDJNSPESERTA2, SEGMENTASI.TMTPEG
	FROM [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN T
	CROSS APPLY(
		SELECT TOP 1 * FROM [bpjs-peserta].dbo.JNSPESERTA_PRESENT J
		WHERE J.NOKA=T.NOKA AND J.TMTPEG<=T.BLNTAG
		ORDER BY TMTPEG DESC
	) SEGMENTASI
	WHERE SEGMENTASI.KDJNSPESERTA NOT IN (14,22,23,24,25)
	) ANOMALY
JOIN [bpjs-peserta].dbo.JNSPESERTA_TBL JT
ON ANOMALY.KDJNSPESERTA2=JT.KDJNSPESERTA