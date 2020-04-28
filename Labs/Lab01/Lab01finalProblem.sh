#This works if I copy/paste in one line at a time. I can't get the script to run in the shell.

#isolate the column headers
grep time PredPreyData.csv > header.csv
#subset original data file to columns of interest
cut -f 2-4 -d , PredPreyData.csv > subsetdata.csv
#further subset to last ten lines
tail subsetdata.csv > taildata.csv
#append subsetted data under headers
cat header.csv taildata.csv > newdata.csv