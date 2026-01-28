#!/bin/bash
# ============================================
# Build Script untuk Buku Kas Kelompok
# Jalankan di Linux/Mac untuk membuat executable
# ============================================

echo ""
echo "========================================"
echo "  BUKU KAS KELOMPOK - Build Script"
echo "========================================"
echo ""

# Cek Python
if ! command -v python3 &> /dev/null; then
    echo "[ERROR] Python3 tidak ditemukan!"
    echo "Install dengan: sudo apt install python3 python3-pip python3-tk"
    exit 1
fi

echo "[1/3] Menginstall dependensi..."
pip3 install pyinstaller openpyxl

echo ""
echo "[2/3] Membuat file executable..."
pyinstaller --onefile --windowed --name "BukuKasKelompok" --clean kas_kelompok.py

echo ""
echo "[3/3] Build selesai!"
echo ""

if [ -f "dist/BukuKasKelompok" ]; then
    echo "========================================"
    echo "  BUILD BERHASIL!"
    echo "========================================"
    echo ""
    echo "File executable: dist/BukuKasKelompok"
    echo ""
    echo "Jalankan dengan: ./dist/BukuKasKelompok"
    chmod +x dist/BukuKasKelompok
else
    echo "[WARNING] Executable tidak ditemukan di folder dist"
fi
