
**Troubleshooting Guide**   
----------------------------
 -  Sometimes, a process called `Infra-Solr` starts to run and consume a large amount of the CPU capacity. You should keep an eye on the CPU/Memory utilization of the VM. Usually, if no-one is running any exercises, the CPU should be between 5-10%.   
    Every now and then, use **root** and check the top processes running using command: `top`   
    <img  src="Screen%20Shot%202021-01-24%20at%204.02.11%20PM.png"  width="650" />   

    If you notice the infra-solr process is consuming a very high percentage, run the following:   
    `ps -ef | grep 4489`   
    <img  src="Screen%20Shot%202021-01-24%20at%204.02.41%20PM.png"  width="650" />   

    Kill Parent PID: `kill -9 25164`   
    Kill PID: `kill -9 4489`   

    After killing the two processes, confirm using `top` command that the process is no longer listed.   

    From Ambari, restart the Infra-Solr service:   
    <img  src="Screen%20Shot%202021-01-24%20at%204.06.06%20PM.png"  width="650" />   
    
    From Ambari, confirm the CPU usage is now normal:   
    <img  src="Screen%20Shot%202021-01-27%20at%209.58.42%20AM.png"  width="650" />  







