# Shift Example - Node Version : v12.18.1 with Visual Studio Code
# Brief
This project is developed as a nodejs web application built upon expressjs(backend) and pugjs(frontend). The main application is created as a form, where 2 fields are expected to be provided by the user, namely, the Shift Code and Shift Group Code. Upon submission of the form, the instruction is serviced as a post request, where the inputs will be used by the query builder to retrieve a list of results, returning a positive result if there is a presence of results retrieved.
# 1.1)Installation and Running the application
```sh
  1. Open Terminal
  2. Change Destination to Project Folder (Open Folder)
  3. Type (without Quotations) "NPM install" in Terminal to load missing dependencies
  4. Wait for download to complete
  5. Type (without Quotations) "NPM start" in Terminal to launch application
```
# 1.2)Using the application
```sh
  1. Visit http://localhost:3000/ in a web browser
  2. Input the Shift Code and Shift Group Code in their respective fields
  3. Click on the check button
  4. Observe the displayed message if shift code is present in shift group
```
# 2) Project Structure
| Folder/File | Description |
| ------ | ------ |
| README.md |This file |
| exampleshift.sql | Exported mysql DB structure|
| routes -> api.js | contains the required API and functions |
| views | folder containing the views of the project|
|app.js|main router definitions|
|dbconfig.js| file containing db information for db operations|

base URL route is implemented as http://localhost:3000
# 3)Database Information - MySQL Community Server 8.0.20
The following are the defaults database values used for this project, if required, please update dbconfig.js with your local changes :
| Setting | Value |
| ------ | ------ |
| Hostname | 127.0.0.1 |
| Username | root |
| password | 123123 |

Please import the required tables through importing exampleshift.sql

# 4) Core packages utilized for this project
| Package | Purpose |
| ------ | ------ |
| knex | db operations |
|string-sanitizer|input sanitization|

# 5) Implemented API routes

| API | Status | API Endpoint
| ------ | ------ |------|
| /checkshift | Implemented |[Post] /api/checkshift|

# 6) Explaining the Relationship between the tables
There are 3 main tables present, namely shift, shift grouping, and shift group.
In all three tables, there appears to be a primary key labelled as id present, however, it appears that it is a surrogate key, as it does not appear to be application data driven for uniqueness, and it appears to not be used in linking the tables.

Shift grouping appears to be the intermediate table for a many-to-many relationship between shift and shift group. shift_group_code and shift_code appears to be foreign keys in reference to the code field in shift and shift group.

Code in shift_group appears to be linked to shift_group_code and shift_code in the tables, 2 possible reasons could be why : 
1.The displayed relationship is unnormalized, where shift_code itself should be directly based solely from the shift table and nowhere else to preserve atomicity
or 
2.Code in shift_group is an amalgation of shift_group_code + shift_code as a single string to be formed, but only after the shift_grouping relationship has been formed elsewhere, with shift_group_code coming from another source. Atomicity will be violated as the primary key used in shift_grouping is a surrogate key with no tangible and obvious relationship, which may cause redundancy to occur.

# 7)Assumptions and Decisions

The following assumption had been made in this project : 
| Assumption |
| ------ |
|Assumed that Atomicity is inherently required|
|Assumed that the project is based off Case 1, where normalization has to be done |
|Assumed that the ids present are surrogate keys, as no further context is given|
|Assumed that prior input  has been done to insert records from another API, and that these data are santized beforehand|
|Assumed that shift_group_code and shift_code are foreign keys|
|Assumed that internet connectivity is available, bootstrap and jquery CDN versions are used|
|Assumed that special characters and spaces are not allowed as inputs|

code present in shift group : G1,G2,G3,G4,G5
code present in shift : S1,S2,S3,S4,S5
relationships present in shift grouping : G1-S1,G2-S2,G3-S3,G4-S4,G5-S5,G5-S1

| Decision|Rationale/Justification|
| ------ |-------|
|Project Developed in nodejs|Brief stated any programming language, double checked with HR Executive|
|Used Async Await to obtain result from DB|While the result is obtained near instantenously currently, that might not be true in bigger datasets in a production environment|
|Using an ORM query builder|For dynamically generation of queries, if the project wishes to be switched to another system that is not mysql, no need to rewrite entire segments immediately|
|Decided to go with Case 1|The intermediate table would serve as the best resolution in this case, as foreign key constraint would at least ensure consistency in the existence of the keys, where as in case 2 there may or may not have referential integrity. Due to the prescence of the surrogate key, there is a possibility of redundancy in both cases, however the table can be extended to contain other information in the future|
|Sanitized inputs|SQL Injection can be a possiblity, simple input sanitization is done to lower that possibility|



