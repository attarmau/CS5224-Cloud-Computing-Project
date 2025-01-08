# CS5224 LLM Doctor Copilot on Amazon


<img width="853" alt="Screenshot 2024-10-01 at 10 01 12 AM 1" src="https://github.com/user-attachments/assets/a6b6705d-4ec3-4853-87b4-82c7d1719b98">


![未命名绘图 drawio](https://github.com/user-attachments/assets/76b6f388-5dd3-4d20-a1a6-bfb16ab90fd9)
Here’s an updated explanation of the data preprocessing pipeline based on the new flowchart:

---

## Data Preprocessing Pipeline

This pipeline outlines the preprocessing steps for preparing datasets for analysis and training in the Generative AI Health Assistant project. Each step ensures the data is cleaned, merged, and structured for effective usage.

### Step-by-Step Process:

### 1. **Column Filtering and Missing Value Cleaning**
   - Apply individual filtering and cleaning processes to the following datasets:
     - **Admission**
     - **Diagnosis**
     - **Anamnesa**
     - **Fisik** (Physical Examination)
     - **Fisik Gigi** (Dental Examination)
     - **Fisik Mata** (Eye Examination)
     - **Tarda Vital** (Vital Signs)
     - **Allergy**
   - Combine cleaned datasets into a single file: `merged_1.csv` (995,755 rows × 33 columns).

### 2. **Drop Irrelevant Columns**
   - Remove unnecessary columns like `fisik`, `sex`, etc., resulting in:
     - `merged_2.csv` (995,755 rows × 31 columns).

### 3. **Combine Poli Information**
   - Merge columns `poli_name` and `poli_id` to create consolidated poli information in the dataset.

### 4. **Filter Missing Diagnoses**
   - Exclude rows where `diagnosa` or `diagnosa_type` is missing, resulting in:
     - `merged_3.csv` (66,264 rows × 31 columns).

### 5. **Filter Duplicate Diagnoses**
   - Remove rows with duplicate `primer` (primary) and `sekunder` (secondary) diagnoses:
     - `merged_4.csv` (18,191 rows × 31 columns).

### 6. **Filter Missing Primary Diagnoses**
   - Exclude rows where only secondary diagnoses (`sekunder`) are present without a corresponding primary diagnosis (`primer`):
     - `merged_5.csv` (18,037 rows × 31 columns).

Summary of Changes at Each Stage:
   - **Merged 1:** Full dataset with all columns (33 columns).
   - **Merged 2:** Reduced dataset after removing irrelevant columns (31 columns).
   - **Merged 3:** Filtered dataset excluding missing `diagnosa` and `diagnosa_type`.
   - **Merged 4:** Deduplicated dataset for `primer` and `sekunder`.
   - **Merged 5:** Final dataset retaining only rows with valid primary diagnoses (`primer`).
