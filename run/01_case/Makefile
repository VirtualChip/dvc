run: clean
	mkdir -p log
	./run.csh | tee run.log
	grep -v "TIME:" run.log > log/run.log
	tree _ | tee log/tree.log

list:
	dvc_list_design

tree: golden
	tree _ | tee log/tree.log
		
diff: 
	@diff -r log golden | tee diff.log
	@echo "============================="
	@wc -l diff.log
clean:
	rm -fr :phase :block :stage :version :container
	rm -fr .dop _ svn_root testcase
	rm -fr log diff.log run.log
	

