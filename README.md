# Buku Kas Kelompok

Aplikasi desktop offline untuk pencatatan keuangan kas kelompok masyarakat (PKK, Karang Taruna, Kelompok Tani, PPG, dll).

## Fitur Utama

- **Dual Kas**: Kelola Kas Tunai dan Kas Bank secara terpisah
- **9 Jenis Transaksi**: TRM, BLJ, STR, TRK, TRF, ADM, BNG, SDS, SDR
- **Saldo Berjalan**: Running balance otomatis untuk setiap transaksi
- **Pos Anggaran**: Kelola pos-pos anggaran dengan target dari musyawarah
- **Rekonsiliasi**: Bandingkan saldo fisik vs sistem
- **Laporan Bulanan**: Ringkasan dan export ke Excel
- **Offline**: Tidak memerlukan koneksi internet

## Screenshot

```
┌────────────────────────────────────────────────────────────┐
│  BUKU KAS KELOMPOK - Nama Kelompok                         │
├────────────────────────────────────────────────────────────┤
│  SALDO TUNAI      │  SALDO BANK       │  TOTAL KAS         │
│  Rp 5.000.000     │  Rp 10.000.000    │  Rp 15.000.000     │
├────────────────────────────────────────────────────────────┤
│ [Buku Kas] [Pos Anggaran] [Rekonsiliasi] [Laporan] [Setup] │
└────────────────────────────────────────────────────────────┘
```

## Cara Menjalankan

### Opsi 1: Jalankan dengan Python (Semua Platform)

```bash
# Pastikan Python 3.6+ terinstall
python kas_kelompok.py

# Untuk fitur export Excel
pip install openpyxl
```

### Opsi 2: Build Executable

#### Windows (.exe)
```batch
# Double-click file build.bat
# ATAU jalankan di Command Prompt:
build.bat
```

File `BukuKasKelompok.exe` akan dibuat di folder `dist/`

#### Linux/Mac
```bash
chmod +x build.sh
./build.sh
```

File executable akan dibuat di folder `dist/`

## Persyaratan Sistem

### Untuk Menjalankan Python Script
- Python 3.6 atau lebih baru
- Tkinter (biasanya sudah termasuk dengan Python)
- openpyxl (opsional, untuk export Excel)

### Untuk Build Executable
- Python 3.6+
- PyInstaller (`pip install pyinstaller`)

## Struktur Database

Aplikasi menggunakan SQLite dengan 4 tabel:

| Tabel | Fungsi |
|-------|--------|
| `pengaturan` | Nama kelompok, alamat, bendahara |
| `pos_anggaran` | Pos-pos anggaran dengan target |
| `buku_kas` | Semua transaksi dengan running balance |
| `rekonsiliasi` | Riwayat rekonsiliasi |

Database `kas_kelompok.db` otomatis dibuat saat aplikasi pertama dijalankan.

## Jenis Transaksi

| Kode | Nama | Efek |
|------|------|------|
| TRM | Terima Dana | +Tunai atau +Bank |
| BLJ | Belanja Tunai | -Tunai |
| STR | Setor ke Bank | -Tunai, +Bank |
| TRK | Tarik dari Bank | +Tunai, -Bank |
| TRF | Transfer via Bank | -Bank |
| ADM | Biaya Admin Bank | -Bank |
| BNG | Bunga/Jasa Giro | +Bank |
| SDS | Setor ke Desa | -Tunai/-Bank |
| SDR | Setor ke Daerah | -Tunai/-Bank |

## Lisensi

Open source untuk penggunaan kelompok masyarakat.

## Kontribusi

Silakan buat issue atau pull request untuk perbaikan dan penambahan fitur.
