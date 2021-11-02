//STAA+STIN K10
Instance: TestinstanceUFHV12-with-ACK
InstanceOf: TestScript


* insert Metadata
* id = "UFHV12-with-ACK"
* name = "Patient is in an emergency outpatient setting ay hospital, but ends up being admitted"
* title = "Patient is in an emergency outpatient setting ay hospital, but ends up being admitted"
* description = "Testing correct use of emergency admit and discharge"

//Once per testscript
* insert ACKFixture 

//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/STIN_2.xml)

//param: type, number fixture
* insert HospitalNotificationCreateTest(STAA, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/STAA_2.xml)