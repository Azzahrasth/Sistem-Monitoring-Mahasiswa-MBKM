-< [PAGE MAHASISWA] >-

-> [DASHBOARD MAHASISWA] <-
1. Query Identitas MAHASISWA
SELECT nim, nama_mhs, semester FROM mhs WHERE id_mhs = '$id';

2. SKS MK Pending
SELECT SUM(sks) as belum_diacc FROM mata_kuliah JOIN konversi_mk ON mata_kuliah.id_matkul = konversi_mk.id_matkul JOIN mhs ON mhs.id_mhs = konversi_mk.id_mhs WHERE mhs.id_mhs = '$id' AND konversi_mk.status_acc = 'Belum diacc';

3. SKS MK Valid
SELECT SUM(sks) as sudah_diacc FROM mata_kuliah JOIN konversi_mk ON mata_kuliah.id_matkul = konversi_mk.id_matkul JOIN mhs ON mhs.id_mhs = konversi_mk.id_mhs WHERE mhs.id_mhs = '$id' AND konversi_mk.status_acc = 'Sudah diacc';

4. Dosen Pembimbing
SELECT nim, nama_mhs, semester, nama_dosen FROM mhs JOIN pm ON mhs.id_pm = pm.id_pm JOIN dosen ON pm.id_dosen = dosen.id_dosen WHERE mhs.id_mhs = '$id';

5. Nama Program
SELECT nama_program, status_lolos FROM mhs JOIN mengikuti ON mhs.id_mhs = mengikuti.id_mhs JOIN program ON program.id_program = mengikuti.id_program WHERE mhs.id_mhs = '$id';


-> [TANDA TANGAN] <-
1. Nampilin Program Di Option
SELECT * FROM program;

2. Ngeupload file_lolos
INSERT INTO mengikuti VALUES('', '$id_program', '$id', '', 'Belum Lolos', '$namaFile', '');


-> [BUKTI LOLOS] <-
1. Nampilin Program Di Option
SELECT * FROM program;

2. Ngeupload bukti_lolos + tahun mengikuti program
UPDATE mengikuti SET status_lolos = 'Belum Dikonfirmasi', tahun = '$tahun', file_lolos = '$namaFile' WHERE id_program = '$id_program' AND id_mhs = '$id';


-> [Konversi Mata Kuliah] <-
1. Add mata kuliah yang akan di konversi
INSERT INTO konversi_mk VALUES ('', '$id_mhs', '$id_matkul', 'Belum diacc');

2. Cancel mata kuliah yang akan di konversi
DELETE FROM konversi_mk WHERE id_mhs = '$id_mhs' && id_matkul = '$id_matkul';

3. Tampilan mata kuliah yang mau di konversi
SELECT id_matkul, kode_matkul, nama_matkul, sks, semester_mk, nama_dosen from mata_kuliah JOIN dosen ON mata_kuliah.id_dosen = dosen.id_dosen order by nama_matkul ASC;

4. Cek apakah mahasiswa sudah lolos, untuk membuka halaman KMK
SELECT status_lolos FROM mengikuti WHERE id_mhs = '$id' AND status_lolos = 'Sudah Lolos';


-> [Laporan Konversi Mata Kuliah] <-
1. Nampilin MK yang Dikonversi Mahasiswa
SELECT kode_matkul, nama_matkul, sks, semester_mk, status_acc, nama_dosen from 
(SELECT kode_matkul, nama_matkul, sks, semester_mk, status_acc, id_dosen, id_mhs from konversi_mk, mata_kuliah where
konversi_mk.id_matkul = mata_kuliah.id_matkul ) as x , dosen where x.id_dosen = dosen.id_dosen && x.id_mhs = '$id'



-< [PAGE DOSEN] >-

-> [DASHBOARD DOSEN] <-
1.Query Identitas Dosen
SELECT * FROM dosen WHERE id_dosen = '$id'

2. Query Mahasiswa yang Dibimbing
SELECT jumlah_mhs_mbkm FROM mhs JOIN pm ON mhs.id_pm = pm.id_pm JOIN dosen ON pm.id_dosen = dosen.id_dosen WHERE dosen.id_dosen = '$id'

3. Kategori Progres
create view v_progres as SELECT COUNT(status_mbkm) as progres FROM mhs WHERE status_mbkm = 'Progres';
select * from v_progres;

4. Kategori Sedang
create view v_sedang as SELECT COUNT(jumlah_sks) as sedang FROM mhs WHERE status_mbkm = 'Sedang';
select * from v_sedang;

5. Kategori Tercapai
create view v_tercapai as SELECT COUNT(jumlah_sks) as tercapai FROM mhs WHERE status_mbkm = 'Tercapai';
select * from v_tercapai


-> [ACC MK] <-
1. List Mahasiswa Yang Mengkonversi MK yang Diampu Dosen
SELECT distinct mhs.id_mhs, mhs.nim, mhs.nama_mhs, mhs.semester, mhs.jumlah_sks, mhs.status_mbkm, mata_kuliah.id_dosen FROM mata_kuliah JOIN konversi_mk ON mata_kuliah.id_matkul = konversi_mk.id_matkul JOIN mhs ON mhs.id_mhs = konversi_mk.id_mhs WHERE mata_kuliah.id_dosen = '$id'


-> [ACC MK DETAIL] <-
1. Tabel Mata Kuliah diacc 
SELECT distinct mhs.id_mhs, mhs.nim, mhs.nama_mhs, mhs.semester, mhs.jumlah_sks, mhs.status_mbkm, mata_kuliah.id_dosen FROM mata_kuliah JOIN konversi_mk ON mata_kuliah.id_matkul = konversi_mk.id_matkul JOIN mhs ON mhs.id_mhs = konversi_mk.id_mhs WHERE mata_kuliah.id_dosen = '$id';

2. Update Status_ACC Tabel Konversi_MK
UPDATE konversi_mk SET status_acc = 'Sudah diacc' WHERE id_mhs = '$id_mhs' AND id_matkul = '$id_mk';



-< [PAGE ADMIN] >-
-> [DASHBOARD ADMIN] <-
1. Kategori Progres
create view v_progres as SELECT COUNT(status_mbkm) as progres FROM mhs WHERE status_mbkm = 'Progres';
select * from v_progres;

2. Kategori Sedang
create view v_sedang as SELECT COUNT(jumlah_sks) as sedang FROM mhs WHERE status_mbkm = 'Sedang';
select * from v_sedang;

3. Kategori Tercapai
create view v_tercapai as SELECT COUNT(jumlah_sks) as tercapai FROM mhs WHERE status_mbkm = 'Tercapai';
select * from v_tercapai

4. Kategori Belum Dikonfirmasi
SELECT COUNT(status_lolos) as belum_dikonfirmasi FROM mengikuti WHERE status_lolos = 'Belum Dikonfirmasi';

5. Kategori Belum Lolos
SELECT COUNT(status_lolos) as belum_lolos FROM mengikuti WHERE status_lolos = 'Belum Lolos';

6. Kategori Sudah Lolos
SELECT COUNT(status_lolos) as sudah_lolos FROM mengikuti WHERE status_lolos = 'Sudah Lolos';


-> [BUKTI LOLOS ADMIN] <-
1. Nampilin Tabel Mahasiswa yang Udah Upload Bukti Lolos MBKM
SELECT file_lolos, id_mengikuti, status_lolos, mhs.id_pm, mhs.id_mhs, nim, nama_mhs, semester, nama_program, file_lolos FROM mhs JOIN mengikuti ON mhs.id_mhs = mengikuti.id_mhs JOIN program ON program.id_program = mengikuti.id_program WHERE file_lolos != 'NULL';


-> [BUKTI LOLOS PM ADMIN] <-
1. Nampilin List Dosen
SELECT dosen.id_dosen, dosen.nip, dosen.nama_dosen, pm.jumlah_mhs_mbkm FROM dosen, pm WHERE dosen.id_dosen = pm.id_dosen;

2. Update PM di Tabel "Mahasiswa"
UPDATE mhs SET id_pm = '$id_dosen' WHERE id_mhs = '$id_mhs';

3. Update Status_Lolos di Tabel "Mengikuti"
UPDATE mengikuti SET status_lolos = 'Sudah Lolos' WHERE id_mengikuti = '$id_mengikuti'