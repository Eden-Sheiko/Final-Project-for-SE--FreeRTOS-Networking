# Final-Project-for-SE--FreeRTOS-Networking
Final Project for SE -FreeRTOS + Networking

This project involved simulating a "City Dispatch" unit using a TFTP server and client. The TFTP server held the events as files and the TFTP client on the EVB (Embedded Video Bridge) downloaded the events as images into the centralized city "dispatcher memory" using the LWIP (Lightweight Internet Protocol). The events were stored in a job-queue database for easy access and were downloaded one by one from the TFTP server in 100 millisecond intervals.

The events were sent to the appropriate department based on the "department field" and the severity of the event was taken into account with critical events being sent first. The number of events sent to each department was recorded and could be printed to the UART debugger upon request.

Each department was running a task that received the incoming events into its message queue and had a thread pool of 3 tasks to handle the events. One of the tasks from the department's thread pool read the event from the message queue, implemented it (by printing it to the debugger's UART and busy waiting for 300 milliseconds), and when not running, went to sleep in blocking mode.

A separate task was created to indicate that the STM32 device was active by toggling a LED as a heartbeat. Test cases were implemented to ensure the correctness of the project.
