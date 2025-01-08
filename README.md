# CS5224 LLM Doctor Copilot on Amazon
Data Preprocessing Pipeline: Updated Workflow

This document outlines the evolution of the data preprocessing pipeline for the Generative AI Health Assistant project. The initial pipeline (referenced in the first diagram) underwent modifications to improve efficiency and data quality, resulting in the updated workflow (depicted in the second diagram). Below, we compare the two versions and highlight the key changes.

---

### Initial Workflow (First Diagram)
The earlier pipeline followed these steps:
1. **Exploration and Missing Data Cleaning**:
   - Loaded and cleaned the anamnesa dataset.
   - Checked for missing values and applied basic cleaning strategies (e.g., replacing "NaN").
2. **Combining and Cleaning**:
   - Merged datasets using inner joins for patient diagnosis information.
   - Mapped data attributes like `clinics → specialty`, `specialty → ICD-10`, and `family history codes → health conditions`.
3. **Feature Mapping and Column Operations**:
   - Added new columns through mapping, renamed columns, reordered them, and standardized formats (e.g., converting to lowercase).
4. **Sorting and Grouping**:
   - Sorted data by consultation date and grouped it by person ID for downstream EDA.
   
<img width="853" alt="Screenshot 2024-10-01 at 10 01 12 AM 1" src="https://github.com/user-attachments/assets/a6b6705d-4ec3-4853-87b4-82c7d1719b98">

---

### Updated Workflow (Second Diagram)
The updated pipeline introduces more granular cleaning steps and focuses on optimizing the dataset quality:

1. **Granular Column Cleaning**:
   - Cleaned and filtered each dataset (e.g., `admission`, `diagnosa`, `anamnesa`, `fisik`, etc.) independently for missing values.
   - Merged cleaned datasets into `merged_1.csv` with 33 columns.
   
2. **Refined Merging and Cleaning**:
   - Dropped unnecessary columns (e.g., `fisik`, `sex`) to reduce noise, creating `merged_2.csv` with 31 columns.
   - Consolidated `poli_name` and `poli_id` for better representation.

3. **Focused Filtering**:
   - Excluded rows with missing values in critical fields (`diagnosa` and `diagnosa_type`) to produce `merged_3.csv`.
   - Removed duplicates for `primer` (primary diagnosis) and `sekunder` (secondary diagnosis) to generate `merged_4.csv`.

4. **Validation of Primary Diagnoses**:
   - Removed rows where only `sekunder` (secondary diagnosis) was present, resulting in the final dataset `merged_5.csv` with 18,037 rows.
   - 
![未命名绘图 drawio](https://github.com/user-attachments/assets/76b6f388-5dd3-4d20-a1a6-bfb16ab90fd9) 

---

### Key Changes from Initial to Updated Workflow

1. **Granular Cleaning**:
   - The initial pipeline applied data cleaning on the combined dataset. The updated pipeline performs cleaning on individual datasets first, ensuring data consistency at the source level.

2. **Dataset Size Optimization**:
   - The updated workflow systematically reduces the dataset size by applying stricter filtering (e.g., handling missing `diagnosa`, removing duplicates, and validating primary diagnoses), whereas the earlier pipeline retained more rows for exploratory analysis.

3. **Improved Diagnosis Handling**:
   - The updated process includes a focused approach to validating diagnoses by distinguishing between `primer` and `sekunder`, ensuring only valid primary diagnoses are retained.

4. **Column Consolidation**:
   - Poli information (`poli_name` and `poli_id`) is merged in the updated workflow for simplified representation, a step absent in the initial pipeline.

5. **Output Focus**:
   - The final dataset in the updated workflow is smaller and more refined (18,037 rows × 31 columns), emphasizing quality over quantity for downstream tasks.

---

### Conclusion
The updated pipeline represents a significant improvement over the initial workflow, emphasizing cleaner, more structured data for enhanced analysis and model training. The changes address earlier inefficiencies, enabling better preprocessing for healthcare-focused AI applications.

---





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
