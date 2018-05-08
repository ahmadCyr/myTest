#!/bin/sh

NOW=$(date +"%m-%d-%Y-%H-%M-%S")

sqoop import --connect jdbc:mysql://mqtt.ctoakukezm9f.us-west-2.rds.amazonaws.com:3306/MQTT \
--username Ahmed \
--password 12345678 \
--table data \
--as-textfile \
--target-dir=s3://mqttproject/input_${NOW} \
--num-mappers 1 \

hadoop jar SortValues.jar SortValues s3://mqttproject/input_${NOW}/part-m-00000 s3://mqttproject/output_${NOW}
