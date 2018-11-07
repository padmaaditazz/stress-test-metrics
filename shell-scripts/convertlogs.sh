
mv ./unix/kaarmana-test-performance.log ./windows/kaarmana-test-performance.log
mv ./unix/solver-scalable-performance.log ./windows/solver-scalable-performance.log
mv ./unix/kaarmana-pending.log ./windows/kaarmana-pending.log
mv ./unix/solver-pending.log ./windows/solver-pending.log


unix2dos ./windows/kaarmana-test-performance.log
unix2dos ./windows/solver-scalable-performance.log
unix2dos ./windows/kaarmana-pending.log
unix2dos ./windows/solver-pending.log
