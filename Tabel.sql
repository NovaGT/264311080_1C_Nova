CREATE TABLE Lokasi_Kampus (
    id_lokasi    VARCHAR(10)  NOT NULL,
    nama_lokasi  VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_lokasi)
);

CREATE TABLE Admin_Lokasi (
    id_admin    VARCHAR(10)  NOT NULL,
    nama_admin  VARCHAR(100) NOT NULL,
    id_lokasi   VARCHAR(10)  NOT NULL,
    PRIMARY KEY (id_admin),
    FOREIGN KEY (id_lokasi) REFERENCES Lokasi_Kampus (id_lokasi)
);

CREATE TABLE Ruang (
    no_ruang    VARCHAR(10)  NOT NULL,
    jenis_ruang VARCHAR(50)  NOT NULL,
    id_lokasi   VARCHAR(10)  NOT NULL,
    PRIMARY KEY (no_ruang),
    FOREIGN KEY (id_lokasi) REFERENCES Lokasi_Kampus (id_lokasi)
);

CREATE TABLE Mahasiswa (
    nim             VARCHAR(15)  NOT NULL,
    nama_mahasiswa  VARCHAR(100) NOT NULL,
    kelas           VARCHAR(20)  NOT NULL,
    PRIMARY KEY (nim)
);

CREATE TABLE Pengajuan_Ruang (
    nomor_pengajuan    VARCHAR(15)  NOT NULL,
    nim                VARCHAR(15)  NOT NULL,
    no_ruang           VARCHAR(10)  NOT NULL,
    id_admin           VARCHAR(10)  NULL,      -- Boleh kosong(Menunggu admin))
    tanggal_penggunaan DATE         NOT NULL,
    jam_mulai          TIME         NOT NULL,
    jam_selesai        TIME         NOT NULL,
    tujuan_penggunaan  VARCHAR(255) NOT NULL,
    status_pengajuan   VARCHAR(30)  NOT NULL,
    alasan             VARCHAR(255) NULL,
    PRIMARY KEY (nomor_pengajuan),
    FOREIGN KEY (nim)      REFERENCES Mahasiswa (nim),
    FOREIGN KEY (no_ruang) REFERENCES Ruang (no_ruang),
    FOREIGN KEY (id_admin) REFERENCES Admin_Lokasi (id_admin)
);

CREATE TABLE Laporan_Kerusakan (
    id_laporan          VARCHAR(15)  NOT NULL,
    nomor_pengajuan     VARCHAR(15)  NOT NULL,
    tipe_kerusakan      VARCHAR(50)  NOT NULL,
    deskripsi_kerusakan VARCHAR(255) NOT NULL,
    status_laporan      VARCHAR(30)  NOT NULL,
    PRIMARY KEY (id_laporan),
    FOREIGN KEY (nomor_pengajuan) REFERENCES Pengajuan_Ruang (nomor_pengajuan)
);
