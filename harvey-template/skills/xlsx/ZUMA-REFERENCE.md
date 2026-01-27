# 🎨 Zuma Quick Reference

**Excel & Google Sheets formatting for Zuma Indonesia**

---

## 🎨 Brand Colors

### Primary: Dark Teal
```
HEX: #002A3A
RGB: 0, 42, 58
Excel: 002A3A
```
**Use for:** Headers, titles, main branding

### Secondary: Bright Green
```
HEX: #00E273
RGB: 0, 226, 115
Excel: 00E273
```
**Use for:** Highlights, positive KPIs, success metrics

---

## 📝 Sheet Naming

**Format:** `clwdbt_[sheet_title]`

### Examples:
- `clwdbt_sales_summary`
- `clwdbt_inventory`
- `clwdbt_daily_report`
- `clwdbt_kpi_dashboard`

### Rules:
- Always start with `clwdbt_`
- Keep titles short (max 30 chars total)
- Use underscores, not spaces
- Be specific, not generic

---

## 🎨 Excel Color Palette Code

### Apply Zuma Colors in Python (openpyxl):

```python
from openpyxl.styles import PatternFill, Font

# Zuma Primary (Dark Teal) - Headers
primary_fill = PatternFill(start_color='002A3A', end_color='002A3A', fill_type='solid')
header_font = Font(color='FFFFFF', bold=True)  # White text on dark teal

# Zuma Secondary (Bright Green) - Highlights
secondary_fill = PatternFill(start_color='00E273', end_color='00E273', fill_type='solid')
highlight_font = Font(color='002A3A', bold=True)  # Dark teal text on green

# Apply to cells
sheet['A1'].fill = primary_fill
sheet['A1'].font = header_font

sheet['B10'].fill = secondary_fill
sheet['B10'].font = highlight_font
```

### Google Sheets Color Format:

```python
# Zuma Primary (Dark Teal)
{
  "red": 0.0,
  "green": 0.164,
  "blue": 0.227
}

# Zuma Secondary (Bright Green)
{
  "red": 0.0,
  "green": 0.886,
  "blue": 0.451
}
```

---

## 📊 Dashboard Header Template

```python
# Create Zuma-branded header
def create_zuma_header(sheet, title):
    # Title cell
    sheet['A1'] = title
    sheet['A1'].font = Font(color='FFFFFF', bold=True, size=14)
    sheet['A1'].fill = PatternFill(start_color='002A3A', end_color='002A3A', fill_type='solid')
    sheet['A1'].alignment = Alignment(horizontal='center', vertical='center')
    
    # Merge cells for header
    sheet.merge_cells('A1:E1')
    sheet.row_dimensions[1].height = 30
```

---

## ✅ Checklist for Zuma Reports

- [ ] Sheet name starts with `clwdbt_`
- [ ] Headers use Zuma Primary (#002A3A)
- [ ] Positive KPIs highlighted with Zuma Secondary (#00E273)
- [ ] Standard functional colors for data categorization
- [ ] All formulas error-free
- [ ] Currency format: $#,##0
- [ ] Zeros display as "-"

---

**Last Updated:** 2026-01-27
**Applies to:** Excel (.xlsx) & Google Sheets
