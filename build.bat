@echo off
REM ============================================
REM Build Script untuk Buku Kas Kelompok
REM Jalankan di Windows untuk membuat file .exe
REM ============================================

echo.
echo ========================================
echo   BUKU KAS KELOMPOK - Build Script
echo ========================================
echo.

REM Cek apakah Python terinstall
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python tidak ditemukan!
    echo Silakan install Python dari https://www.python.org/downloads/
    pause
    exit /b 1
)

echo [1/3] Menginstall dependensi...
pip install pyinstaller openpyxl

echo.
echo [2/3] Membuat file executable...
pyinstaller --onefile --windowed --name "BukuKasKelompok" --icon=icon.ico --clean kas_kelompok.py 2>nul || pyinstaller --onefile --windowed --name "BukuKasKelompok" --clean kas_kelompok.py

echo.
echo [3/3] Build selesai!
echo.

if exist "dist\BukuKasKelompok.exe" (
    echo ========================================
    echo   BUILD BERHASIL!
    echo ========================================
    echo.
    echo File executable: dist\BukuKasKelompok.exe
    echo.
    echo Anda bisa menjalankan aplikasi dengan double-click
    echo file BukuKasKelompok.exe di folder dist
    echo.
) else (
    echo [WARNING] File .exe tidak ditemukan di folder dist
    echo Periksa output di atas untuk error
)

pause
