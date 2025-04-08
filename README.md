# **Machine Learning Classification of Stars, Quasars, and Galaxies**

## **1. Project Overview**
This project aims to develop a machine learning model that accurately classifies **stars, quasars, and galaxies** using data from the **Sloan Digital Sky Survey (SDSS)**. By leveraging machine learning algorithms and data visualization techniques, we seek to identify key distinguishing features of these celestial objects. This contributes to astrophysical research and enhances automated classification methods.

Please follow steps to create SQL database if you want to run the model.

## **2. Database Creation and Management**
### **Setting Up PostgreSQL Database**
1. Open **pgAdmin** and create a new database called **"StarsGalaxiesQuasars"**
2. Use the Query Tool to open `schema.sql` (from Resources) and run the script
3. Refresh Tables and select Import/Export option for `classification` table, import the file 'classification_sky_server.csv' (from Resources)
4. Select Import/Export option for `observation` table, import the file 'observation_sky_server.csv' (from Resources)
5. Open 'ML pipeline final.ipynb' and change Postgres password credentials
6. Run all cells in 'ML pipeline final.ipynb'

### **Database Connection**
- The code connects to a **PostgreSQL database** using **SQLAlchemy**.
- Data is retrieved by joining two tables:
  - **Observation**: Contains brightness measurements across five wavelengths (u, g, r, i, z).
  - **Classification**: Contains the object class (**STAR, GALAXY, or QSO**).


## **3. Data Acquisition and Features**
### **Data Source**
- **Sloan Digital Sky Survey (SDSS)**
- Dataset obtained from **Kaggle**, ensuring fair usage via an open API.

### **Key Features**
- **Photometric Magnitudes**: u, g, r, i, z bands
- **Redshift (z)**: Distance measurement indicator
- **Spatial Information**: Right Ascension (RA) and Declination (Dec)

## **4. Methodology**
### **Data Preprocessing**
- Removing unnecessary columns (e.g., observation ID, object ID)
- Encoding target variable (**STAR → 0, GALAXY → 1, QSO → 2**)
- Splitting dataset into **training (80%) and testing (20%)** sets
- Normalizing values using **StandardScaler**

### **Main Machine Learning Model Used**
| Model | Accuracy |
|----------------------|---------|
| **Gradient Boosting (GB)** | 88% (before tuning) |
| **Gradient Boosting (GB)** | 94% (after tuning) |

### **Other Machine Learning Models Used**
| Model | Accuracy |
|----------------------|---------|
| **Random Forest (RF)** | 94% |
| **Logistic Regression (LR)** | 94% |
| **Support Vector Machine (SVM)** | 94% |

### **Gradient Boosting Model Insights**
#### **Gradient Boosting (GB)**
After testing multiple models, Gradient Boosting was chosen due to its balance of accuracy and interpretability. Hyperparameter tuning using `RandomizedSearchCV` improved its accuracy from 88% to 94%

### **Hyperparameter Tuning**

- Used `RandomizedSearchCV` instead of `GridSearchCV` for efficiency
- Optimized `n_estimators`, `learning_rate`, `max_depth`, `min_samples_split`, and `min_samples_leaf`
- Achieved **6% improvement** in model accuracy

### **Exploratory Data Analysis (EDA) & Visualization**

- **Class Distribution:** Count plots showed an imbalance in class distribution
- **Feature Importance:** Z (Infrared) had the highest predictive power, likely due to its ability to detect distant objects
- **Confusion Matrix:** Most misclassifications occurred between Quasars and Galaxies, suggesting spectral similarities
- **3D Scatter Plot:** Visualized relationships between RA, DEC, and Redshift

## **Additional Experimentation with PCA**

To optimize performance further, we explored **Principal Component Analysis (PCA)**:

- **Advantages Considered:** Computational efficiency, overfitting prevention, and better visualization potential
- **Findings:** PCA reduced dimensionality but significantly lowered classification accuracy by **20%**
- **Conclusion:** PCA was not suitable for improving our dataset’s classification performance

## **6. Challenges and Solutions**
| Challenge | Solution |
|----------------------|---------|
| **Class Imbalance** | Applied **SMOTE** to balance dataset. |
| **Overfitting concerns** | Regularized model and applied cross-validation. |
| **Feature Selection** | Removed redundant features and applied PCA for efficiency. |
| **Hyperparameter Tuning** | Used **Randomized Search CV** for optimal results. |
| **Data Quality Issues** | Performed extensive **data cleaning and normalization**. |

## **7. Expected Outcomes**
- A machine learning model capable of effectively classifying celestial objects.
- Identification of key features that differentiate **stars, quasars, and galaxies**.
- Visual tools providing insightful representations of **SDSS data trends**.

## **8. Tools and Technologies**
- **Machine Learning**: Scikit-learn
- **Data Processing**: Pandas, NumPy, PostgreSQL
- **Visualization**: Matplotlib, Seaborn
- **Database**: PostgreSQL with pgAdmin

## **9. Conclusion**
This project integrates machine learning with astrophysical research to improve the classification of celestial objects. By identifying key distinguishing features and leveraging data visualization tools, we enhance the accuracy of automated classification methods. The findings can contribute to **astronomical research, automated object detection, and space exploration advancements**.

Using the Gradient Boosting Classifier, we successfully developed a machine learning model that classifies **stars, galaxies, and quasars** with high accuracy. Our approach combined **database management, data preprocessing, model evaluation, and hyperparameter tuning** to maximize performance. While PCA was explored for dimensionality reduction, it did not improve classification accuracy. Our findings contribute to the field of astrophysics by demonstrating the effectiveness of machine learning in automated object classification.

