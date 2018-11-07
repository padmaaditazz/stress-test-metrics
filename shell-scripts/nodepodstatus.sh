
	rm ./unix/kaarmana-nodes-pods-status.csv

	echo TIMESTAMP\;NUMBER-OF-NODES\;SOLVER-RUNNING\;SOLVER-PENDING\;ROUTER-RUNNING\;ROUTER-PENDING
while true;
do
	numnodes=$(kubectl top nodes | wc -l)
	solverrunning=$(kubectl get pods --field-selector=status.phase=Running -n kaarmana-solver-scalable | wc -l)
	solverpending=$(kubectl get pods --field-selector=status.phase=Pending -n kaarmana-solver-scalable | wc -l)
	routerrunning=$(kubectl get pods --field-selector=status.phase=Running -n kaarmana-router-scalable | wc -l)
	routerpending=$(kubectl get pods --field-selector=status.phase=Pending -n kaarmana-router-scalable | wc -l)

	if [ $numnodes -gt 0 ]
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

	if [ $routerrunning -gt 0 ]
	then
		routerrunning=$(expr "$routerrunning" - 1 )
	fi

	if [ $routerpending -gt 0 ]
	then
		routerpending=$(expr "$routerpending" - 1 )
	fi

	echo $(date "+%T")\;$numnodes\;$solverrunning\;$solverpending\;$routerrunning\;$routerpending | tee -a ./unix/kaarmana-nodes-pods-status.csv
	sleep 2
done

