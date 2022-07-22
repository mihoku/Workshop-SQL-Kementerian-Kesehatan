SELECT T.*, J.*, JT.KETJNSPESERTA JENIS_PST_KONFIRMASI 
FROM [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN t
cross apply
(
	SELECT TOP 1 *
		FROM [bpjs-peserta].[dbo].[JNSPESERTA_PRESENT] J
		WHERE J.TMTPEG <= t.BLNTAG AND J.NOKA = t.NOKA
		ORDER BY J.TMTPEG DESC
) J
JOIN [bpjs-peserta].DBO.JNSPESERTA_TBL JT
ON J.KDJNSPESERTA=JT.KDJNSPESERTA
where J.KDJNSPESERTA NOT IN (14,22,23,24,25)