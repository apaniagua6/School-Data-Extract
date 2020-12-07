# School Data from https://educationdata.urban.org/

Thank you to https://educationdata.urban.org/ for providing a clean data sets that  harmonizes data from all major federal datasets, including the US Department of Education Common Core of Data, the US Department of Education Civil Rights Data Collection, the US Department of Education EDFacts, the US Census Bureau Small Area Income and Poverty Estimates, the US Department of Education Integrated Postsecondary Education Data System, the US Department of Education College Scorecard, and the National Historical Geographic Information System.

Since the data set's are in the hundreds of Megabytes and in the gigabytes this repository can serve as the inital extract point for any ETL workflow. 

## Parquet files

The first step will be extracting all the csv files and landing them into more compact formats. 

The parquet format was choosen since it provides a smaller size and the column store properties lend themselves well to the types of operations that data scientists might need to do. 

# School Districts Data (CCD)

This district-level database contains data on school districts from the National Center for Education Statistics’ Common Core of Data (CCD) and the US Census Small Area Income and Poverty Estimates (SAIPE). The CCD contains information on district characteristics, revenue, and spending, and SAIPE reports the number and share of children ages 5 to 17 in poverty in each school district.

### Enrollment of students by School Districts  (CCD)
Contains student membership data for each school district by grade.

1. schools_ccd_lea_enrollment_1986_2018_df_pyarrow.parquet.gzip  - Contains student membership data for each school district by grade from 1986 to 2018. 

This is based from the Common Core of Data. CCD is the US Department of Education's primary database on public elementary and secondary education. It provides directory and enrollment information at the school level and directory, enrollment, and finance data at the school district level. https://nces.ed.gov/ccd/

The file data structure looks like the following table:

| variable   | format  | label                                               |
|------------|---------|-----------------------------------------------------|
| leaid      | string  | Local education agency identification number (NCES) |
| year       | numeric | Academic year (fall semester)                       |
| fips       | fips    | Federal Information Processing Standards state code |
| grade      | grade   | Grade                                               |
| race       | race    | Race and ethnicity                                  |
| sex        | sex     | Sex                                                 |
| enrollment | numeric | Student enrollment                                  |

The Variable mapping can be seen in the following excel file (the second sheet named values): [school_districts/codebook_districts_ccd_enrollment.xls](school_districts/codebook_districts_ccd_enrollment.xls)

Here is a sample of some of the variable mappings. 

| format  | code | code_label                       |   |
|---------|------|----------------------------------|---|
| fips    | 6    | California                       |   |
| fips    | 7    | Canal Zone                       |   |
| grade   | -2   | Not applicable                   |   |
| grade   | -1   | Pre-K                            |   |
| grade   | 0    | Kindergarten                     |   |
| grade   | 1    | 1                                |   |
| grade   | 2    | 2                                |   |
| grade   | 14   | Adult education                  |   |
| grade   | 15   | Ungraded                         |   |
| grade   | 99   | Total                            |   |
| grade   | 999  | Not specified                    |   |
| numeric | -3   | Suppressed data                  |   |
| numeric | -2   | Not applicable                   |   |
| numeric | -1   | Missing/not reported             |   |
| race    | 1    | White                            |   |
| race    | 2    | Black                            |   |
| race    | 3    | Hispanic                         |   |
| race    | 4    | Asian                            |   |
| race    | 5    | American Indian or Alaska Native |   |
| sex     | -2   | Not applicable                   |   |
| sex     | -1   | Missing/not reported             |   |
| sex     | 1    | Male                             |   |
| sex     | 2    | Female                           |   |
| sex     | 9    | Unknown                          |   |
| sex     | 99   | Total                            |   |
| string  | -3   | Suppressed data                  |   |
| string  | -2   | Not applicable                   |   |
| string  | -1   | Missing/not reported             |   |

In order to remain true to good [ETL engineering practices](https://gtoonstra.github.io/etl-with-airflow/principles.html), we will rest the data as a parquet file before adding any additional columns or trying to map out the variables into human readable formats. 

todo: provide further information of types of statistics and graphs that can be obtained with this data set. 


## District Directory data (CCD)

Contains school district (local education agency identification)-level geographic and mailing information, agency type, highest and lowest grades offered, special education students and English language learners, and full-time equivalent teachers and other staff.

## District Finance Data (CCD)
contains district level finance data including revenues from federal, state, and local governments and expenditures.


## Poverty Estimates Data (SAIPE)
contains district level data on the size of the population, the size of the school age population, and the size of the school age population that is in poverty.

## State Asssements Data (EDFACTS) 

contains district-level achievement results for state assessments in mathematics and reading or language arts, by grade. It includes the number of students who completed each assessment for whom a proficiency level was assigned and the proficiency share. The proficiency share is reported as a range, unless there are more than 300 students in the subgroup, with the magnitude of the range decreasing as the number of students reported increases. States can change their statewide assessments, academic standards, or thresholds for proficiency levels, leading to changes in the proficiency share from year to year. The proficiency shares for Virginia's 2016–17 grade 5–8 math assessments are too low. Users should instead refer to the Virginia Department of Education's Statistics and Reports website for accurate data.