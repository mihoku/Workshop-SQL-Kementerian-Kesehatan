/*
Risiko 2.B
Adanya tagihan bantuan iuran atas periode di luar berlakunya program bantuan iuran. Program
bantuan iuran JKN mulai berlaku sejak 1 Juli 2020. Auditor perlu menguji bilamana terdapat
tagihan yang memiliki BLNTAG kurang dari 1 Juli 2020.
*/

SELECT * FROM [bpjs-tagihan].dbo.TAGIHAN_BANTUAN_IURAN t
WHERE BLNTAG < '2020-07-01'