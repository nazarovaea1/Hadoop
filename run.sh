#!/usr/bin/env bash

OUT_DIR="mapred1_result"
NUM_REDUCERS=4

hdfs dfs -rm -r -skipTrash ${OUT_DIR} > /dev/null

yarn jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar > /dev/null \
	-D mapred.job.name="mapreducetask1_step1" \
	-D mapreduce.job.reduces=${NUM_REDUCERS} \
	-files mapper.py,reducer.py \
	-mapper "python3 ./mapper.py" \
	-reducer "python3 ./reducer.py" \
	-input /data/ids \
	-output ${OUT_DIR}

hdfs dfs -ls ${OUT_DIR} >/dev/null
hdfs dfs -cat ${OUT_DIR}/part-0* | head -50
