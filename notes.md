# deploy datasette

 csvs-to-sqlite sample_csv district_data_sample.db
 

 docker run -p 8001:8001 -v `pwd`:/mnt \
    datasetteproject/datasette \
    datasette -p 8001 -h 0.0.0.0 mnt/district_data_sample.db