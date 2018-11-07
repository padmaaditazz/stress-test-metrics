
	rm ./unix/kaarmana-test-performance.log
	rm ./unix/solver-scalable-performance.log
	rm ./unix/router-scalable-performance.log
while true;
do
	echo TIMESTAMP: $(date "+%T") | tee -a ./unix/kaarmana-test-performance.log
	kubectl top pods -n kaarmana-scalable-arch -test --containers | tee -a ./unix/kaarmana-test-performance.log
	sleep 1
	echo TIMESTAMP: $(date "+%T") | tee -a ./unix/solver-scalable-performance.log
	kubectl top pods -n kaarmana-solver-scalable --containers | tee -a ./unix/solver-scalable-performance.log
	sleep 1
	echo TIMESTAMP: $(date "+%T") | tee -a ./unix/router-scalable-performance.log
	kubectl top pods -n kaarmana-router-scalable --containers | tee -a ./unix/router-scalable-performance.log
done

