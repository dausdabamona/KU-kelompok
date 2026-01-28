# CLAUDE.md - AI Assistant Guidelines

> This document provides context and conventions for AI assistants working with this repository.

## Project Overview

**Repository:** KU-kelompok
**Project:** Buku Kas Kelompok (Community Cash Book Application)
**Status:** Active development
**Last Updated:** 2026-01-28

### Purpose
Aplikasi Buku Kas Kelompok adalah aplikasi desktop offline untuk pencatatan keuangan kas kelompok masyarakat seperti PKK, Karang Taruna, Kelompok Tani, PPG, dan organisasi serupa. Aplikasi ini membantu bendahara atau pengelola keuangan untuk:
- Mengelola dua jenis kas: Kas Tunai dan Kas Bank
- Mencatat semua transaksi keuangan dengan saldo berjalan (running balance)
- Mengelola pos-pos anggaran hasil musyawarah
- Melakukan rekonsiliasi berkala
- Membuat laporan bulanan dengan export ke Excel

---

## Repository Structure

```
KU-kelompok/
├── CLAUDE.md           # AI assistant guidelines (this file)
├── kas_kelompok.py     # Main application (single-file Python app)
└── kas_kelompok.db     # SQLite database (auto-generated on first run)
```

---

## Tech Stack

| Technology | Purpose |
|-----------|---------|
| Python 3 | Main programming language |
| Tkinter (ttk) | GUI framework with modern themed widgets |
| SQLite | Local database for offline storage |
| openpyxl | Excel export functionality (optional dependency) |

---

## Database Schema

### Tables

1. **pengaturan** - Application settings
   - `id`, `nama_kelompok`, `alamat`, `nama_bendahara`

2. **pos_anggaran** - Budget posts
   - `id`, `kode_pos` (unique, max 5 chars), `nama_pos`, `target_anggaran`, `keterangan`

3. **buku_kas** - Transaction records
   - `id`, `tanggal`, `uraian`, `jenis_transaksi`, `jumlah`, `sumber_kas`, `pos_id`, `arah_pos`, `saldo_tunai_setelah`, `saldo_bank_setelah`, `created_at`

4. **rekonsiliasi** - Reconciliation records
   - `id`, `tanggal`, `tunai_fisik`, `tunai_sistem`, `selisih_tunai`, `bank_fisik`, `bank_sistem`, `selisih_bank`, `keterangan`, `created_at`

### Transaction Types (jenis_transaksi)

| Code | Name | Effect |
|------|------|--------|
| TRM | Terima Dana | Adds to cash OR bank |
| BLJ | Belanja Tunai | Reduces cash, requires budget post |
| STR | Setor ke Bank | Cash to bank transfer |
| TRK | Tarik dari Bank | Bank to cash withdrawal |
| TRF | Transfer via Bank | Reduces bank, requires budget post |
| ADM | Biaya Admin Bank | Reduces bank |
| BNG | Bunga/Jasa Giro | Adds to bank |
| SDS | Setor ke Desa | Reduces cash/bank, requires budget post |
| SDR | Setor ke Daerah | Reduces cash/bank, requires budget post |

---

## Development Workflow

### Branch Naming Convention
- Feature branches: `feature/<description>`
- Bug fixes: `fix/<description>`
- Documentation: `docs/<description>`
- AI-assisted work: `claude/<session-id>`

### Commit Message Format
Follow conventional commits:
```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, no logic change)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

### Pull Request Guidelines
1. Create a descriptive PR title
2. Include a summary of changes
3. Reference related issues (if any)
4. Test the application manually before merging

---

## Code Conventions

### Python Style
- Follow PEP 8 style guidelines
- Use descriptive variable and function names in Indonesian where appropriate for domain-specific terms
- Class names in PascalCase (e.g., `BukuKasApp`, `TransaksiDialog`)
- Function/method names in snake_case (e.g., `add_transaksi`, `refresh_saldo`)
- Constants in UPPER_SNAKE_CASE (e.g., `JENIS_TRANSAKSI`, `WARNA_TRANSAKSI`)

### GUI Conventions
- Use ttk widgets for modern appearance
- Consistent padding and spacing
- Format currency as: `Rp 1.000.000` (Indonesian format with dot separator)
- Use color coding for transaction types:
  - Green: Income (TRM, BNG)
  - Red: Expenses (BLJ, TRF, ADM)
  - Blue: Internal transfers (STR, TRK)
  - Yellow: Government deposits (SDS, SDR)

### Database Conventions
- Date format: `YYYY-MM-DD` (ISO 8601)
- Monetary values stored as REAL (float)
- Running balances recalculated on any transaction modification

---

## AI Assistant Guidelines

### When Working on This Repository

1. **Read Before Modifying**
   - Always read `kas_kelompok.py` before making changes
   - Understand the existing class structure and method relationships

2. **Maintain Single-File Structure**
   - Keep all code in `kas_kelompok.py` unless explicitly requested otherwise
   - The single-file design is intentional for easy distribution

3. **Data Integrity**
   - Never allow negative balances
   - Always recalculate running balances after modifications
   - Validate required fields (especially budget post selection)

4. **UI Consistency**
   - Maintain Indonesian language in UI labels
   - Keep consistent Rupiah formatting
   - Preserve color coding conventions

5. **Testing**
   - Test manually by running `python kas_kelompok.py`
   - Verify all CRUD operations work correctly
   - Check running balance calculations

### Commands Reference

```bash
# Run the application
python kas_kelompok.py

# Install optional Excel export dependency
pip install openpyxl
```

---

## Environment Setup

### Prerequisites
- Python 3.6 or higher
- Tkinter (usually included with Python)
- Git (for version control)

### Optional Dependencies
```bash
pip install openpyxl  # For Excel export feature
```

### Getting Started
1. Clone the repository
2. Navigate to the project directory
3. Run: `python kas_kelompok.py`
4. Database `kas_kelompok.db` will be created automatically on first run

---

## Key Files Reference

| File | Purpose |
|------|---------|
| `CLAUDE.md` | AI assistant guidelines and project overview |
| `kas_kelompok.py` | Main application - GUI, database, business logic |
| `kas_kelompok.db` | SQLite database (auto-generated) |

---

## Application Features

### Tab 1: Buku Kas (Cash Book)
- View all transactions with running balances
- Add/Edit/Delete transactions
- Filter by date range
- Color-coded transaction rows

### Tab 2: Pos Anggaran (Budget Posts)
- CRUD operations for budget posts
- Track budget utilization (% used)
- Over-budget warning (highlighted in red)

### Tab 3: Rekonsiliasi (Reconciliation)
- Compare physical cash/bank vs system records
- Record reconciliation history
- Highlight discrepancies

### Tab 4: Laporan Bulanan (Monthly Report)
- Summary of monthly transactions
- Budget post recap
- Government deposit list
- Export to Excel

### Tab 5: Pengaturan (Settings)
- Organization name
- Address
- Treasurer name

---

## Notes for AI Assistants

### Important Reminders
- This application runs offline - no internet required
- Single user application - no authentication needed
- Database is SQLite file stored locally
- All monetary calculations use float (Decimal would be more precise for production)

### Common Tasks
- Adding new transaction type: Update `JENIS_TRANSAKSI` dict and handle in `add_transaksi`/`recalculate_all_saldo`
- Adding new report: Create method in `BukuKasApp` class, add UI in `create_tab_laporan`
- Changing validation rules: Update `validate_transaksi` method in `Database` class

---

## Changelog

### 2026-01-28
- Initial CLAUDE.md created
- Created comprehensive Buku Kas Kelompok application
- Implemented all five tabs: Buku Kas, Pos Anggaran, Rekonsiliasi, Laporan Bulanan, Pengaturan
- Added Excel export functionality
- Database schema with four tables

---

*This document should be updated as the project evolves. AI assistants should refer to this file at the start of each session to understand the current state and conventions of the repository.*
