
#------- Filter POD wise statistics from KAARMANA namespace.
#------- Input files have TIMESTAMP, PODNAME, POD-CONTAINER, CPU LOAD and MEMORY
#------- Make TIME, CPU LOAD and MEMORY fields are filetered with AWK

echo "TIME;CPU-LOAD;MEMORY" > curedData/tograph-auth-db-0.csv
echo "TIME;CPU-LOAD;MEMORY" > curedData/tograph-dataservice-db-0.csv
echo "TIME;CPU-LOAD;MEMORY" > curedData/tograph-kaarmana-auth.csv
echo "TIME;CPU-LOAD;MEMORY" > curedData/tograph-kaarmana-business.csv
echo "TIME;CPU-LOAD;MEMORY" > curedData/tograph-kaarmana-client.csv
echo "TIME;CPU-LOAD;MEMORY" > curedData/tograph-kaarmana-dataservice.csv
echo "TIME;CPU-LOAD;MEMORY" > curedData/tograph-kaarmana-server.csv
echo "TIME;CPU-LOAD;MEMORY" > curedData/tograph-kaarmana-ticket.csv
echo "TIME;CPU-LOAD;MEMORY" > curedData/tograph-ticket-db-0.csv
echo "TIME;CPU-LOAD;MEMORY" > curedData/tograph-all-solver-pods.csv

cat windows/time-kaarmana-test-performance.log | grep auth-db-0 | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $1";"$4";"$5}' >> curedData/tograph-auth-db-0.csv
cat windows/time-kaarmana-test-performance.log | grep dataservice-db-0 | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $1";"$4";"$5}' >> curedData/tograph-dataservice-db-0.csv
cat windows/time-kaarmana-test-performance.log | grep kaarmana-auth | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $1";"$4";"$5}' >> curedData/tograph-kaarmana-auth.csv
cat windows/time-kaarmana-test-performance.log | grep kaarmana-business | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $1";"$4";"$5}' >> curedData/tograph-kaarmana-business.csv
cat windows/time-kaarmana-test-performance.log | grep kaarmana-client | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $1";"$4";"$5}' >> curedData/tograph-kaarmana-client.csv
cat windows/time-kaarmana-test-performance.log | grep kaarmana-dataservice | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $1";"$4";"$5}' >> curedData/tograph-kaarmana-dataservice.csv
cat windows/time-kaarmana-test-performance.log | grep kaarmana-server | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $1";"$4";"$5}' >> curedData/tograph-kaarmana-server.csv
cat windows/time-kaarmana-test-performance.log | grep kaarmana-ticket | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $1";"$4";"$5}' >> curedData/tograph-kaarmana-ticket.csv
cat windows/time-kaarmana-test-performance.log | grep ticket-db-0 | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $1";"$4";"$5}' >> curedData/tograph-ticket-db-0.csv
cat windows/time-solver-scalable-performance.log | grep solver | awk '{gsub(":", "\.", $1); gsub("m", "", $4); gsub("Mi", "", $5); print $1";"$4";"$5}' >> curedData/tograph-all-solver-pods.csv

#------- Convert filetered files to DOS mode for reading by EXCEL or other spreadsheet

unix2dos curedData/tograph-auth-db-0.csv
unix2dos curedData/tograph-dataservice-db-0.csv
unix2dos curedData/tograph-kaarmana-auth.csv
unix2dos curedData/tograph-kaarmana-business.csv
unix2dos curedData/tograph-kaarmana-client.csv
unix2dos curedData/tograph-kaarmana-dataservice.csv
unix2dos curedData/tograph-kaarmana-server.csv
unix2dos curedData/tograph-kaarmana-ticket.csv
unix2dos curedData/tograph-ticket-db-0.csv
unix2dos curedData/tograph-all-solver-pods.csv
