# run like: R < ~/Documents/scripts/R/salary_estimator.R --no-save
variables = c(
  # For all yes/no questions, 1 = 'yes' and 0 = 'no'

  # What is the GDP per capita in your area? (in thousands of $) e.g. Cleveland, OH is 55.430
  # 2.6
  55.697,
  # Are you a female?
  # -7.8
  0,
  # How many years of experience do you have?
  # 3.8
  12,
  # How good are you at bargaining? (1-5)
  # 7.4
  3,
  # Are you 26-30 years old?
  # 17.2
  0,
  # Are you 31-35 years old?
  # 22.5
  0,
  # Are you 36-65 years old?
  # 24.8
  1,
  # Are you over 65 years old?
  # 38.5
  0,
  # Is your academic background in math, statistics, or physics?
  # 3.9
  1,
  # Do you have a PhD?
  # 12.2
  0,
  # Are you currently a student?
  # -9.7
  0,
  # Is software your industry?
  # 2.2
  1,
  # Is banking or finance your industry?
  # 3
  0,
  # Is advertising, marketing, or PR your industry?
  # -2
  0,
  # Is education your industry?
  # -24.5
  0,
  # Is computers/hardware your industry?
  # -3.9
  0,
  # Is search/social your industry?
  # 7.1
  0,
  # Do you work for a company with 501-10000 employees?
  # 3.6
  0,
  # Do you work for a company with over 10000 employees?
  # 7.7
  1,
  # Is your company over 10 years old?
  # -4.3
  1,
  # Do you spend 1-3 hours per week coding?
  # -8.2
  0,
  # Do you spend 4-20 hours per week coding?
  # -3
  0,
  # Do you spend over 20 hours per week coding?
  # -0.5 
  1,
  # Do you spend 1-3 hours per week in meetings?
  # 1
  0,
  # Do you spend 4-8 hours per week in meetings?
  # 9.2
  1,
  # Do you spend 9-20 hours per week in meetings?
  # 20.6
  0,
  # Do you spend over 20 hours per week in meetings?
  # 21.1
  0,
  # Do you work 46-60 hours per week?
  # 1
  0,
  # Do you work over 60 hours per week?
  # -2.4
  0,
  # Does your job title include 'Upper Management'?
  # 20.2
  0,
  # Does your job title include 'Engineer/Developer/Programmer'?
  # 0.9
  0,
  # Does your job title include 'Manager'?
  # 3.1
  0,
  # Does your job title include 'Researcher'?
  # -1
  0,
  # Does your job title include 'Architect'?
  # 14.3
  1,
  # Does your job title include 'Senior Engineer/Developer'?
  # 4.6
  0,
  # Is ETL a minor aspect of your job?
  # 4.5
  1,
  # Is ETL a major aspect of your job?
  # -1.9
  0,
  # Is setting up or maintaining data platforms an aspect of your job?
  # -4.9
  1,
  # Is developing prototype models a minor aspect of your job?
  # 4.4
  0,
  # Is developing prototype models a major aspect of your job?
  # 12.1
  1,
  # Is developing hardware or working on projects that require expert knowledge of hardware a major aspect of your job?
  # -1.3
  0,
  # Is organizing and guiding team projects a major aspect of your job?
  # 9.7
  0,
  # Is identifying business problems to be solved with analytics a minor aspect of your job?
  # 1.5
  0,
  # Is identifying business problems to be solved with analytics a major aspect of your job?
  # 6.7
  0,
  # Is communicating with people outside your company a major aspect of your job?
  # 5.4
  1,
  # Is most/all of your work done using cloud computing?
  # 3.2
  1,
  # Do you use python?
  # 4.6
  1,
  # Do you use javascript?
  # -2.2
  0,
  # Do you use excel?
  # -7.4
  0,
  # How many of the following do you use (max 4)? MySQL, PostgreSQL, SQLite, Redshift, Vertica, Redis, Ruby
  # 1.7
  4,
  # How many of the following do you use (max 5)? Spark, Unix, Spark MlLib, ElasticSearch, Scala, H2O, EMC/Greenplum, Mahout
  # 3.9
  1,
  # How many of the following do you use (max 5)? Hive, Apache Hadoop, Cloudera, Hortonworks, Hbase, Pig, Impala
  # 1.5
  5,
  # How many of the following do you use (max 3)? Tableau, Teradata, Netezza (IBM), Microstrategy, Aster Data (Teradata), Jaspersoft
  # 2.4
  0,
  # How many of the following do you use (max 4)? MongoDB, Kafka, Cassandra, Zookeeper, Storm, JavaScript InfoVis Toolkit, Go, Couchbase
  # 1.3
  1
)

coefficients = c(
  2.6, -7.8, 3.8, 7.4, 17.2,
  22.5, 24.8, 38.5, 3.9, 12.2,
  -9.7, 2.2, 3, -2, -24.5,
  -3.9, 7.1, 3.6, 7.7, -4.3,
  -8.2, -3, -0.5, 1, 9.2,
  20.6, 21.1, 1, -2.4, 20.2,
  0.9, 3.1, -1, 14.3, 4.6,
  4.5, -1.9, -4.9, 4.4, 12.1,
  -1.3, 9.7, 1.5, 6.7, 5.4,
  3.2, 4.6, -2.2, -7.4, 1.7,
  3.9, 1.5, 2.4, 1.3
)

# The most advanced predictive algorithm ever created in the history of mankind
yhat = 60 + sum(coefficients*variables)

# Output
salary = format(round(yhat^2), big.mark=",")
cat('Expected Salary = $', salary, sep = '')
