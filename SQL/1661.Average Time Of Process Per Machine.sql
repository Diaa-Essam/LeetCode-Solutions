SELECT a1.machine_id, ROUND(AVG(a2.timestamp - a1.timestamp), 3) AS processing_time
FROM Activity a1, Activity a2
WHERE a1.machine_id = a2.machine_id && a1.process_id = a2.process_id && a2.activity_type = "end" && a1.activity_type = "start"
GROUP BY machine_id;