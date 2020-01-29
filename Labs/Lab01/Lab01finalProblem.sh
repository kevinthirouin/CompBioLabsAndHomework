#isolate the column headers
grep time PredPreyData.csv > header.csv
#subset original data file to columns of interest
cut -f 2-4 -d , PredPreyData.csv > subsetdata.csv
#further subset to last ten lines
tail subsetdata.csv > taildata.csv
#append subsetted data under headers
cat header.csv taildata.csv > newdata.csv