---
name: xlsx
description: "Comprehensive spreadsheet creation, editing, and analysis with support for formulas, formatting, data analysis, and visualization. When Claude needs to work with spreadsheets (.xlsx, .xlsm, .csv, .tsv, etc) for: (1) Creating new spreadsheets with formulas and formatting, (2) Reading or analyzing data, (3) Modify existing spreadsheets while preserving formulas, (4) Data analysis and visualization in spreadsheets, or (5) Recalculating formulas"
license: Proprietary. LICENSE.txt has complete terms
---

# 🎨 ZUMA-SPECIFIC CUSTOMIZATIONS

**⚠️ This skill has been customized for Zuma Indonesia workflows**

## Zuma Brand Colors

Use Zuma brand colors for visual elements and highlights:

- **Primary Brand Color (Dark Teal)**: `#002A3A` (RGB: 0,42,58)
  - Use for: Headers, titles, main branding elements
  - Excel fill: `002A3A`
  
- **Secondary Brand Color (Bright Green)**: `#00E273` (RGB: 0,226,115)
  - Use for: Highlights, positive indicators, success states
  - Excel fill: `00E273`

### When to Use Zuma Colors:
- Dashboard headers → Primary (#002A3A)
- KPI highlights (positive) → Secondary (#00E273)
- Report titles → Primary (#002A3A)
- Success metrics → Secondary (#00E273)

## Sheet Naming Convention

**MANDATORY:** All sheet names MUST follow this format:

```
clwdbt_[sheet_title]
```

### Naming Rules:
- ✅ **Always prefix:** `clwdbt_`
- ✅ **Short & direct:** Describe what the sheet contains
- ✅ **No long names:** Max 30 characters total
- ❌ **No spaces in prefix:** Use underscore after prefix
- ❌ **No generic names:** Be specific about content

### Examples:
```
✅ GOOD:
- clwdbt_sales_summary
- clwdbt_inventory
- clwdbt_daily_report
- clwdbt_kpi_dashboard
- clwdbt_product_analysis

❌ BAD:
- sales_summary (missing prefix)
- clwdbt sales summary (space instead of underscore)
- clwdbt_detailed_monthly_sales_performance_report (too long)
- clwdbt_data (too generic)
- Sheet1 (no meaningful name)
```

---

# Requirements for Outputs

## All Excel files

### Zero Formula Errors
- Every Excel model MUST be delivered with ZERO formula errors (#REF!, #DIV/0!, #VALUE!, #N/A, #NAME?)

### Formula-First Approach (MANDATORY)
**⚠️ CRITICAL RULE: Always use formulas, NEVER hard-coded values in Google Sheets/Excel outputs**

When creating analysis sheets or dashboards:
- ✅ **USE:** Excel formulas (SUMIFS, COUNTIFS, VLOOKUP, INDEX-MATCH, etc.) that reference source data
- ❌ **NEVER:** Hard-coded text/numbers calculated in Python then pasted as static values
- **WHY:** Users need to see the logic, verify calculations, and have auto-updating sheets

**When to use Python vs Excel formulas:**
- **Python (for chat summaries):** Use pandas/calculations to analyze and REPORT findings directly in chat
  - Good: "Based on analysis, top store is X with Rp Y revenue"
  - User gets instant insight without opening files
  
- **Excel formulas (for sheets/files):** Use SUMIFS/COUNTIFS/etc. in the actual Google Sheet/Excel file
  - Good: `=SUMIFS(DATABASE!J:J, DATABASE!B:B, A2)` - shows logic, auto-updates
  - Bad: Hardcoded "Rp 148,404,000" - user can't verify or update

**Example - Correct Approach:**
```
Sheet: clwdbt_top_stores
A2: Store name
B2: =SUMIFS(DATABASE!$J:$J, DATABASE!$B:$B, A2)  ← Formula-based revenue
C2: =COUNTIFS(DATABASE!$B:$B, A2)               ← Formula-based count
D2: =B2/SUM($B$2:$B$50)                         ← Formula-based percentage
```

**Bottom line:** 
- Python analysis → for giving insights to user in chat (no file needed)
- Google Sheets/Excel → MUST use formulas (so user sees the logic)

### Preserve Existing Templates (when updating templates)
- Study and EXACTLY match existing format, style, and conventions when modifying files
- Never impose standardized formatting on files with established patterns
- Existing template conventions ALWAYS override these guidelines

## Financial models

### Color Coding Standards
Unless otherwise stated by the user or existing template

#### Zuma Brand Colors (Visual Elements)
Use for headers, titles, and visual highlights:
- **Primary (Dark Teal) #002A3A**: Headers, section titles, branding
- **Secondary (Bright Green) #00E273**: Positive KPIs, highlights, success indicators

#### Industry-Standard Color Conventions (Functional Use)
Use for data categorization and formula tracking:
- **Blue text (RGB: 0,0,255)**: Hardcoded inputs, and numbers users will change for scenarios
- **Black text (RGB: 0,0,0)**: ALL formulas and calculations
- **Green text (RGB: 0,128,0)**: Links pulling from other worksheets within same workbook
- **Red text (RGB: 255,0,0)**: External links to other files
- **Yellow background (RGB: 255,255,0)**: Key assumptions needing attention or cells that need to be updated

**Note:** Zuma brand colors are for visual design. Standard functional colors remain for data categorization.

### Number Formatting Standards

#### Required Format Rules
- **Years**: Format as text strings (e.g., "2024" not "2,024")
- **Currency**: Use $#,##0 format; ALWAYS specify units in headers ("Revenue ($mm)")
- **Zeros**: Use number formatting to make all zeros "-", including percentages (e.g., "$#,##0;($#,##0);-")
- **Percentages**: Default to 0.0% format (one decimal)
- **Multiples**: Format as 0.0x for valuation multiples (EV/EBITDA, P/E)
- **Negative numbers**: Use parentheses (123) not minus -123

### Formula Construction Rules

#### Assumptions Placement
- Place ALL assumptions (growth rates, margins, multiples, etc.) in separate assumption cells
- Use cell references instead of hardcoded values in formulas
- Example: Use =B5*(1+$B$6) instead of =B5*1.05

#### Formula Error Prevention
- Verify all cell references are correct
- Check for off-by-one errors in ranges
- Ensure consistent formulas across all projection periods
- Test with edge cases (zero values, negative numbers)
- Verify no unintended circular references

#### Documentation Requirements for Hardcodes
- Comment or in cells beside (if end of table). Format: "Source: [System/Document], [Date], [Specific Reference], [URL if applicable]"
- Examples:
  - "Source: Company 10-K, FY2024, Page 45, Revenue Note, [SEC EDGAR URL]"
  - "Source: Company 10-Q, Q2 2025, Exhibit 99.1, [SEC EDGAR URL]"
  - "Source: Bloomberg Terminal, 8/15/2025, AAPL US Equity"
  - "Source: FactSet, 8/20/2025, Consensus Estimates Screen"

# XLSX creation, editing, and analysis

## Overview

A user may ask you to create, edit, or analyze the contents of an .xlsx file. You have different tools and workflows available for different tasks.

## Important Requirements

**LibreOffice Required for Formula Recalculation**: You can assume LibreOffice is installed for recalculating formula values using the `recalc.py` script. The script automatically configures LibreOffice on first run

## Reading and analyzing data

### Data analysis with pandas
For data analysis, visualization, and basic operations, use **pandas** which provides powerful data manipulation capabilities:

```python
import pandas as pd

# Read Excel
df = pd.read_excel('file.xlsx')  # Default: first sheet
all_sheets = pd.read_excel('file.xlsx', sheet_name=None)  # All sheets as dict

# Analyze
df.head()      # Preview data
df.info()      # Column info
df.describe()  # Statistics

# Write Excel
df.to_excel('output.xlsx', index=False)
```

## Excel File Workflows

## CRITICAL: Use Formulas, Not Hardcoded Values

**Always use Excel formulas instead of calculating values in Python and hardcoding them.** This ensures the spreadsheet remains dynamic and updateable.

### ❌ WRONG - Hardcoding Calculated Values
```python
# Bad: Calculating in Python and hardcoding result
total = df['Sales'].sum()
sheet['B10'] = total  # Hardcodes 5000

# Bad: Computing growth rate in Python
growth = (df.iloc[-1]['Revenue'] - df.iloc[0]['Revenue']) / df.iloc[0]['Revenue']
sheet['C5'] = growth  # Hardcodes 0.15

# Bad: Python calculation for average
avg = sum(values) / len(values)
sheet['D20'] = avg  # Hardcodes 42.5
```

### ✅ CORRECT - Using Excel Formulas
```python
# Good: Let Excel calculate the sum
sheet['B10'] = '=SUM(B2:B9)'

# Good: Growth rate as Excel formula
sheet['C5'] = '=(C4-C2)/C2'

# Good: Average using Excel function
sheet['D20'] = '=AVERAGE(D2:D19)'
```

This applies to ALL calculations - totals, percentages, ratios, differences, etc. The spreadsheet should be able to recalculate when source data changes.

## ⚠️ MANDATORY FEEDBACK LOOP WORKFLOW

**Every Excel operation MUST follow this pattern:**

1. **Try operation** → Make changes to Excel file
2. **Read back** → Load the file and inspect what actually happened
3. **Verify** → Check if changes are correct (formulas, values, formatting)
4. **Report** → Tell user what you found and what worked/failed

### Why This Matters
Excel libraries don't always behave as expected:
- Cell references might be off by one
- Column letters might not match (BL vs BK)
- Formulas might have syntax errors
- Data might be in unexpected locations

**NEVER assume your code worked. ALWAYS verify.**

### Example Workflow
```python
# 1. Try operation
sheet['B5'] = '=SUM(A2:A10)'
wb.save('output.xlsx')

# 2. Read back
wb_check = load_workbook('output.xlsx')
sheet_check = wb_check.active
actual_formula = sheet_check['B5'].value

# 3. Verify
print(f"Cell B5 contains: {actual_formula}")
if actual_formula == '=SUM(A2:A10)':
    print("✅ Formula correct")
else:
    print(f"❌ Expected =SUM(A2:A10), got {actual_formula}")

# 4. Report to user
# Tell them exactly what's in the file
```

**Bottom line:** Write code → Save file → Open file → Check what's actually there → Report findings

## Common Workflow
1. **Choose tool**: pandas for data, openpyxl for formulas/formatting
2. **Create/Load**: Create new workbook or load existing file
3. **Modify**: Add/edit data, formulas, and formatting
4. **Save**: Write to file
5. **Recalculate formulas (MANDATORY IF USING FORMULAS)**: Use the recalc.py script
   ```bash
   python recalc.py output.xlsx
   ```
6. **Verify and fix any errors**: 
   - The script returns JSON with error details
   - If `status` is `errors_found`, check `error_summary` for specific error types and locations
   - Fix the identified errors and recalculate again
   - Common errors to fix:
     - `#REF!`: Invalid cell references
     - `#DIV/0!`: Division by zero
     - `#VALUE!`: Wrong data type in formula
     - `#NAME?`: Unrecognized formula name
7. **🔄 FEEDBACK LOOP (MANDATORY)**: Read back the file to verify changes actually worked as intended

### Creating new Excel files

```python
# Using openpyxl for formulas and formatting
from openpyxl import Workbook
from openpyxl.styles import Font, PatternFill, Alignment

wb = Workbook()
sheet = wb.active

# Add data
sheet['A1'] = 'Hello'
sheet['B1'] = 'World'
sheet.append(['Row', 'of', 'data'])

# Add formula
sheet['B2'] = '=SUM(A1:A10)'

# Formatting
sheet['A1'].font = Font(bold=True, color='FF0000')
sheet['A1'].fill = PatternFill('solid', start_color='FFFF00')
sheet['A1'].alignment = Alignment(horizontal='center')

# Column width
sheet.column_dimensions['A'].width = 20

wb.save('output.xlsx')
```

### Editing existing Excel files

```python
# Using openpyxl to preserve formulas and formatting
from openpyxl import load_workbook

# Load existing file
wb = load_workbook('existing.xlsx')
sheet = wb.active  # or wb['SheetName'] for specific sheet

# Working with multiple sheets
for sheet_name in wb.sheetnames:
    sheet = wb[sheet_name]
    print(f"Sheet: {sheet_name}")

# Modify cells
sheet['A1'] = 'New Value'
sheet.insert_rows(2)  # Insert row at position 2
sheet.delete_cols(3)  # Delete column 3

# Add new sheet
new_sheet = wb.create_sheet('NewSheet')
new_sheet['A1'] = 'Data'

wb.save('modified.xlsx')
```

## Recalculating formulas

Excel files created or modified by openpyxl contain formulas as strings but not calculated values. Use the provided `recalc.py` script to recalculate formulas:

```bash
python recalc.py <excel_file> [timeout_seconds]
```

Example:
```bash
python recalc.py output.xlsx 30
```

The script:
- Automatically sets up LibreOffice macro on first run
- Recalculates all formulas in all sheets
- Scans ALL cells for Excel errors (#REF!, #DIV/0!, etc.)
- Returns JSON with detailed error locations and counts
- Works on both Linux and macOS

## Formula Verification Checklist

Quick checks to ensure formulas work correctly:

### Essential Verification
- [ ] **Test 2-3 sample references**: Verify they pull correct values before building full model
- [ ] **Column mapping**: Confirm Excel columns match (e.g., column 64 = BL, not BK)
- [ ] **Row offset**: Remember Excel rows are 1-indexed (DataFrame row 5 = Excel row 6)

### Common Pitfalls
- [ ] **NaN handling**: Check for null values with `pd.notna()`
- [ ] **Far-right columns**: FY data often in columns 50+ 
- [ ] **Multiple matches**: Search all occurrences, not just first
- [ ] **Division by zero**: Check denominators before using `/` in formulas (#DIV/0!)
- [ ] **Wrong references**: Verify all cell references point to intended cells (#REF!)
- [ ] **Cross-sheet references**: Use correct format (Sheet1!A1) for linking sheets

### Formula Testing Strategy
- [ ] **Start small**: Test formulas on 2-3 cells before applying broadly
- [ ] **Verify dependencies**: Check all cells referenced in formulas exist
- [ ] **Test edge cases**: Include zero, negative, and very large values

### Interpreting recalc.py Output
The script returns JSON with error details:
```json
{
  "status": "success",           // or "errors_found"
  "total_errors": 0,              // Total error count
  "total_formulas": 42,           // Number of formulas in file
  "error_summary": {              // Only present if errors found
    "#REF!": {
      "count": 2,
      "locations": ["Sheet1!B5", "Sheet1!C10"]
    }
  }
}
```

## Best Practices

### Library Selection
- **pandas**: Best for data analysis, bulk operations, and simple data export
- **openpyxl**: Best for complex formatting, formulas, and Excel-specific features

### Working with openpyxl
- Cell indices are 1-based (row=1, column=1 refers to cell A1)
- Use `data_only=True` to read calculated values: `load_workbook('file.xlsx', data_only=True)`
- **Warning**: If opened with `data_only=True` and saved, formulas are replaced with values and permanently lost
- For large files: Use `read_only=True` for reading or `write_only=True` for writing
- Formulas are preserved but not evaluated - use recalc.py to update values

### Working with pandas
- Specify data types to avoid inference issues: `pd.read_excel('file.xlsx', dtype={'id': str})`
- For large files, read specific columns: `pd.read_excel('file.xlsx', usecols=['A', 'C', 'E'])`
- Handle dates properly: `pd.read_excel('file.xlsx', parse_dates=['date_column'])`

## Code Style Guidelines
**IMPORTANT**: When generating Python code for Excel operations:
- Write minimal, concise Python code without unnecessary comments
- Avoid verbose variable names and redundant operations
- Avoid unnecessary print statements

**For Excel files themselves**:
- Add comments to cells with complex formulas or important assumptions
- Document data sources for hardcoded values
- Include notes for key calculations and model sections