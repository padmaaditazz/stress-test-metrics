
#------- Filter POD wise statistics from KAARMANA namespace.
#------- Input files have TIMESTAMP, PODNAME, POD-CONTAINER, CPU LOAD and MEMORY
#------- Make TIME, CPU LOAD and MEMORY fields are filetered with AWK

echo "POD-NAME;TIME;CPU-LOAD;MEMORY" > curedData/kaarmana-test.csv
echo "POD-NAME;TIME;CPU-LOAD;MEMORY" > curedData/kaarmana-solver-scalabale.csv

cat windows/time-kaarmana-test-performance.log | grep auth-db-0 | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $3";"$1";"$4";"$5}' >> curedData/kaarmana-test.csv
cat windows/time-kaarmana-test-performance.log | grep dataservice-db-0 | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $3";"$1";"$4";"$5}' >> curedData/kaarmana-test.csv
cat windows/time-kaarmana-test-performance.log | grep kaarmana-auth | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $3";"$1";"$4";"$5}' >> curedData/kaarmana-test.csv
cat windows/time-kaarmana-test-performance.log | grep kaarmana-business | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $3";"$1";"$4";"$5}' >> curedData/kaarmana-test.csv
cat windows/time-kaarmana-test-performance.log | grep kaarmana-client | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $3";"$1";"$4";"$5}' >> curedData/kaarmana-test.csv
cat windows/time-kaarmana-test-performance.log | grep kaarmana-dataservice | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $3";"$1";"$4";"$5}' >> curedData/kaarmana-test.csv
cat windows/time-kaarmana-test-performance.log | grep kaarmana-server | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $3";"$1";"$4";"$5}' >> curedData/kaarmana-test.csv
cat windows/time-kaarmana-test-performance.log | grep kaarmana-ticket | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $3";"$1";"$4";"$5}' >> curedData/kaarmana-test.csv
cat windows/time-kaarmana-test-performance.log | grep ticket-db-0 | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $3";"$1";"$4";"$5}' >> curedData/kaarmana-test.csv


cat windows/time-solver-scalable-performance.log | grep solver | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $2";"$1";"$4";"$5}' >> curedData/kaarmana-solver-scalable.csv

#------- Convert filetered files to DOS mode for reading by EXCEL or other spreadsheet

unix2dos curedData/kaarmana-test.csv
unix2dos curedData/kaarmana-solver-scalable.csv
