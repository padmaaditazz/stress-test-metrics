	
	rm ./unix/kaarmana-node-pod-status.csv

	echo TIMESTAMP\;NUMBER-OF-NODES\;SOLVER-RUNNING\;SOLVER-PENDING\;ROUTER-RUNNING\;ROUTER-PENDING
while true;
do
	numnodes-$(kubectl top nodes | wc -l)
	solverrunning=$(kubectl get pods --field-selector=status.phase=Running -n kaarmana-solver-scalable | wc -l)
	solverpending=$(kubectl get pods --field-selector=status.phase=Pending -n kaarmana-solver-scalable | wc -l)
	routerrunning=$(kubectl get pods --field-selector=status.phase=Running -n kaarmana-router-scalable | wc -l)
	routerpending=$(kubectl get pods --field-selector=status.phase=Pending -n kaarmana-router-scalable | wc -l)

	if [ $numnodes -gt 0]
	then
		numnodes=$(expr "$numnodes" - 1)
	fi
	
	if [ $solverrunning -gt 0 ]
	then
		solverrunning=$(expr "$solverrunning" - 1 )
	fi

	if [ $solverpending -gt 0 ]
	then
		solverpending=$(expr "$solverpending" - 1 )
	fi

	#echo TIMESTAMP: $(date "+%T")  RUNNING: $r  PENDING: $p | tee -a ./unix/kaarmana-solver-scalable-pod-status.log
	echo $(date "+%T")\;$solverrunning\;$solverpending | tee -a ./unix/kaarmana-solver-scalable-pod-status.csv
	sleep 1
	
	r=$(kubectl get pods --field-selector=status.phase=Running -n kaarmana-router-scalable | wc -l)
	p=$(kubectl get pods --field-selector=status.phase=Pending -n kaarmana-router-scalable | wc -l)


	if [ $r -gt 0 ]
	then
		r=$(expr "$r" - 1 )
	fi

	if [ $p -gt 0 ]
	then
		p=$(expr "$p" - 1 )
	fi

	#echo TIMESTAMP: $(date "+%T")  RUNNING: $r  PENDING: $p | tee -a ./unix/kaarmana-router-scalable-pod-status.log
	echo $(date "+%T")\;$r\;$p | tee -a ./unix/kaarmana-router-scalable-pod-status.csv
	sleep 1
done

