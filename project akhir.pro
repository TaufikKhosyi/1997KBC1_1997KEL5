DOMAINS
pertanyaan = string
posisi = symbol
stack = char
hasil = string
identitas = string
Nama = string
Umur = string
list = symbol*

DATABASE
dbjawabanya(posisi)
dbjawabantidak(posisi)
dbjawabansalah(posisi)

PREDICATES
cetak_list(list)
ulangin
jalankan
%nondeterm identitas(nama)
%nondeterm identitas2(umur)
nondeterm jawaban(pertanyaan, posisi)
nondeterm posisi(posisi)
nondeterm tanya(pertanyaan, posisi, stack)
clear_fakta
simpan(posisi, stack)
nondeterm validasi(stack)
nondeterm kesimpulan(hasil)
output(hasil)

CLAUSES
/* OUTPUT SCREEN  */
cetak_list([]).

cetak_list([H|T]):-
write(H),nl,
cetak_list(T).
/* REPEAT */
ulangin:-
write("		==========================================================================="),
nl,
write("		                                 =Program Penyeleksian Posisi Pemain Sepak Bola FKTI="),
nl,
write("		==========================================================================="),nl,
write("			           -------------------- Created By Kelompok 5 C1 2015 --------------------    "),nl,
write("				          1. Taufikurrahman Khosyi [1515015120]    "),nl,
write("				          2. Arif Dwi Syafutra [1515015117]    "),nl,
write("				          3. Gino Favian Leonardo [1515015101]    "),nl,
write("			           ----------------------------------------------------------------------------------------------    "),nl,
write("				                            ~ Copyright 2017 ~   "),nl,
nl,nl,

cetak_list(["-------------------------------------------------------------------------------------------"," PERTANYAAN INI MENGANDUNG SOAL TENTANG :        ",
" 1. STRIKER   "," 2. MIDFIELDER   "," 3. DEFENDER   "," 4. KEEPER   ","------------------------------------------------------------------------------------------"]),nl,

jalankan, /* START */
nl, /* NEW LINE  */ 
write("Ingin mencoba lagi ? (y/t)"),
nl,
readchar(Timpa),  /* membaca input user dan di tumpuk ke variabel Timpa */
Timpa = 'y', /* jika y */
ulangin. /* kembali lagi ulang jika semua syarat ulang dipenuhi */

	
/* persiapkan bagaimana pertanyaan dimunculkan dan dibagi sehingga dapat disimpan */
%jawaban(Y,Y):-!.
%jawaban(_,_):-fail.

jawaban(Pertanyaan,Posisi):-
	not(dbjawabantidak(Posisi)),
	tanya(Pertanyaan,Posisi,Stack),
	Stack='y'.
	
jawaban(_,Posisi):-
	dbjawabanya(Posisi),
	!.

	
/* FAKTA UNTUK MENGHAPUS JAWABAN YANG DISIMPAN */ 
clear_fakta:-
	retract(dbjawabanya(_)),fail.
	
clear_fakta:-
	retract(dbjawabantidak(_)),fail.
	clear_fakta.

/* FAKTA UNTUK MENYIMPAN JAWABAN */ 
simpan(Posisi,'y'):-
	assert(dbjawabanya(Posisi)).
	
simpan(Posisi,'Y'):-
	assert(dbjawabanya(Posisi)).

simpan(Posisi,'t'):-
	assert(dbjawabantidak(Posisi)).
	
simpan(Posisi,'T'):-
	assert(dbjawabantidak(Posisi)).
	
tanya(Pertanyaan, Posisi, Stack):-
	write(Pertanyaan),
	readchar(Stack),
	write(Stack),nl,
	validasi(Stack),
	nl,
	simpan(Posisi,Stack).
	
validasi(Stack):-
	Stack='y';Stack='Y';Stack='t';Stack='T'.

validasi(Stack):-
	Stack<>'y',Stack<>'t',Stack<>'Y',Stack<>'T',
	write("Inputan Salah"),exit.
	
/* START QUESTION */
jalankan:-
	write("Masukkan Nama Anda : "),
 	readln(Nama),
        write("Masukkan Umur Anda : "),
        readln(Umur),nl,
        write("Anda dengan Nama ",Nama," dan Umur ",Umur," bersedia menjawab dan menerima konsekuensi jika keterangan yang anda inputkan tidak benar"),nl,
        write("******************************************************************************************************************************************************"),nl,nl,
        
kesimpulan(_),
save("project_akhir_AI.txt"), 
!,

clear_fakta.

jalankan:-
write("=========================================================================================="),nl,
write("Mohon Maaf, Jawaban yang anda masukkan tidak memenuhi kriteria yang sudah dicantumkan."), 
clear_fakta.

posisi(Posisi):-
dbjawabantidak(Posisi).
        
posisi(posisi1):-
jawaban("Apakah anda mempunyai Skill untuk membuka ruang tendangan kearah gawang (y/t)?",pertanyaan1).

posisi(posisi2):-
jawaban("Apakah anda memiliki sifat disiplin menjaga suatu pos ketika diserang oleh tim lawan (y/t)?",pertanyaan2).

posisi(posisi3):-
jawaban("Apakah anda memiliki akurasi umpan yang sangat baik (y/t)?",pertanyaan3).

posisi(posisi4):-
jawaban("Apakah anda memiliki reflek yang cepat ketika bola datang kearah gawang (y/t)?",pertanyaan4).

posisi(posisi5):-
jawaban("Apakah anda dapat menjadi targetman dalam kerja sama tim dalam upaya menyerang (y/t)?",pertanyaan5).

posisi(posisi6):-
jawaban("Apakah anda dapat mengatur pola permainan saat diserang maupun menyerang (y/t)?",pertanyaan6).

posisi(posisi7):-
jawaban("Apakah anda memiliki konsentrasi yang tinggi dalam membaca pergerakan lawan (y/t)?",pertanyaan7).

posisi(posisi8):-
jawaban("Apakah anda dapat mencetak gol dengan kepala, kaki kanan dan kaki kiri (y/t)?",pertanyaan8).

posisi(posisi9):-
jawaban("Apakah anda memliki akurasi shooting jarak jauh (y/t)?",pertanyaan9).

posisi(posisi10):-
jawaban("Apakah Anda memiliki balance dan stamina yang kuat dalam keadaan duel man to man (y/t)?",pertanyaan10).

posisi(posisi11):-
jawaban("Apakah Anda siap mental ketika bertabrakan badan dengan musuh, rekan, atau bola yang mengarah ke anda (y/t)?",pertanyaan11).

posisi(posisi12):-
jawaban("Apakah anda memiliki kemampuan determinasi yang cukup baik (y/t)?",pertanyaan12).


/* KESIMPULAN DITENTUKAN BERDASARKAN SYARAT DAN HASIL */ 
/* KESIMPULAN DIDAPAT SETELAH BEBERAPA SYARAT YANG TERPENUHI */

kesimpulan("Striker1"):-
posisi(posisi1),
posisi(posisi5),
%posisi(posisi8),
output("striker"), 
write("Jawaban yang anda masukkan memenuhi kriteria sebagai seorang STRIKER"),nl.

kesimpulan("Striker2"):-
%posisi(posisi1),
posisi(posisi8),
output("striker"), 
write("Jawaban yang anda masukkan memenuhi kriteria sebagai seorang STRIKER"),nl.


%------------------------------------------------------------------------------------------------.

kesimpulan("Midfielder1"):-
posisi(posisi3),
posisi(posisi6),
%posisi(posisi9),
output("midfielder"),
write("Jawaban yang anda masukkan memenuhi kriteria sebagai seorang MIDFIELDER"),nl.

kesimpulan("Midfielder2"):-
posisi(posisi9),
%posisi(posisi3),
output("midfielder"),
write("Jawaban yang anda masukkan memenuhi kriteria sebagai seorang MIDFIELDER"),nl.

%-------------------------------------------------------------------------------------------------

kesimpulan("Defender1"):-
posisi(posisi2),
posisi(posisi7),
%posisi(posisi10),
output("defender"),
write("Jawaban yang anda masukkan memenuhi kriteria sebagai seorang DEFENDER"),nl.

kesimpulan("Defender2"):-
%posisi(posisi7),
posisi(posisi10),
output("defender"),
write("Jawaban yang anda masukkan memenuhi kriteria sebagai seorang DEFENDER"),nl.


%-------------------------------------------------------------------------------------------------

kesimpulan("Keeper1"):-
posisi(posisi4),
posisi(posisi11),
%posisi(posisi12),
output("keeper"),
write("Jawaban yang anda masukkan memenuhi kriteria sebagai seorang KEEPER"),nl.

kesimpulan("Keeper2"):-
%posisi(posisi4),
posisi(posisi12),
output("keeper"),
write("Jawaban yang anda masukkan memenuhi kriteria sebagai seorang KEEPER"),nl.


output(Hasil):-
upper_lower(Keputusan, Hasil),nl,nl,
write("==============================================================================================================="),nl,
write("Anda layak menjadi ", Keputusan),nl.

%output2(Hasil2):-
%write("Anda dapat menempati Posisi sebagai ",Hasil2),nl.

%identitas(Nama):-
%write("Nama ", Nama),nl,
%identitas2(Umur):-
%write("Umur ", Umur),nl.
%write("Anda dengan Nama ",Nama,"dan", Umur),nl.


goal
/* GOAL HERE */
ulangin.
