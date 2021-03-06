
**Troubleshooting Guide**   
----------------------------
## YARN NodeManager is Stopped
 - If you notice any error notification on the YARN service, you need to resolve it immediatly. One common situation that we saw couple of times before is that the NodeManager component is stopped and everytime you try to start it, it starts successfully then, in less than a minute, it stop again. The NodeManager component is critical for most of the exercises. Follow the following steps to resolve the issue:   
    **Update a parameter in YARN configurations:**   
    a. Click **\>** next to **Services** section to expand it   
    b. Select the **YARN** service to open the **Summary** page   
    c. In the **YARN Summary**, click the **CONFIGS** tab   
    d. In the search field, type **yarn.nodemanager.linux-container-executor.resources-handler.class** and click **Enter**   
    e. Change the value of the parameter to **org.apache.hadoop.yarn.server.nodemanager.util.DefaultLCEResourcesHandler**   
    f. Click the **SAVE** button at the button right, type a comment in the popup dialog, and click **SAVE**   
    g. Then you will get another pop up, click **“PROCEED ANYWAY”**   
    h. Check the list of services, and if you see any service that requires restart, make sure the maintenance mode is turned off (put it back in maintenance mode after you complete the restart and stop it if it was stopped)   
    i. In the **Services** section, click the **"..."** next to services, and click **"Restart All Required"** and wait for the operation to complete (usually ~15min)  
    If starting the services fail to start IBM Db2 Big SQL service, click the **"..."** next to services, and click **"Restart All Required"** and wait for the operation to complete (usually ~15min).   

## Infra Solr Consuming CPU Capacity
 -  Sometimes, a process called `Infra-Solr` starts to run and consume a large amount of the CPU capacity. You should keep an eye on the CPU/Memory utilization of the VM. Usually, if no-one is running any exercises, the CPU should be between 5-10%.   
    Every now and then, use **root** and check the top processes running using command: `top`   
    <img  src="Screen%20Shot%202021-01-24%20at%204.02.11%20PM.png"  width="650" />   

    If you notice the infra-solr process is consuming a very high percentage, run the following:   
    `ps -ef | grep 4489` (4489 is the process ID reported by the `top` opmmand)   
    <img  src="Screen%20Shot%202021-01-24%20at%204.02.41%20PM.png"  width="650" />   

    Then kill both the Infr-solr process and its parent process:   
    First, kill Parent PID: `kill -9 25164`   
    Then, kill PID: `kill -9 4489`   

    After killing the two processes, confirm using `top` command that the process is no longer listed.   

    From Ambari, restart the Infra-Solr service:   
    <img  src="Screen%20Shot%202021-01-24%20at%204.06.06%20PM.png"  width="650" />   
    
    From Ambari, confirm the CPU usage is now normal:   
    <img  src="Screen%20Shot%202021-01-27%20at%209.58.42%20AM.png"  width="650" />     

## Infra Solr Consuming CPU Capacity
 -  Similar to the above, a process called `yumBackend.py` could start at any time and consume a large amount of the CPU capacity. You should keep an eye on the CPU/Memory utilization of the VM. Usually, if no-one is running any exercises, the CPU should be between 5-10%.   

    Every now and then, use **root** and check the top processes running using command: `top`  

    Look for the `yumBackend.py` process, you should see a line like this if the process is running:   
    <img  src="yumBackend.png"  width="650" />   
    
    To stop the process, run the following commands:   
    `systemctl stop packagekit.service`    
    `systemctl disable packagekit.service`   
    
    After stopping the processe, confirm using `top` command that the process is no longer listed.   
    (Although the service has been disabled, for some reason, it can start again. So you need to keep an eye on the running processes even after completing the above procedure).   
    
