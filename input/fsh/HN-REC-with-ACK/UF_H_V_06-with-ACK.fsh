//STIN+STOR+SLHJ
Instance: TestinstanceUFHV6-with-ACK
InstanceOf: TestScript


* insert Metadata
* id = "UFHV06-with-ACK"
* name = "never returns after leave"
* title = "Patient is admitted at hospital, goes on leave from hospital but never returns after leave"
* description = "Testing correct use of admit and discharge"

//Once per testscript
* insert ACKFixture 
//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_06.xml)
//param: type, number fixture
* insert HospitalNotificationCreateTest(STOR, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/HospitalNotificationMessage-STOR-UF_H_V_06.xml)
//param: type, number fixture
* insert HospitalNotificationCreateTest(SLHJ, 3, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/HospitalNotificationMessage-SLHJ-UF_H_V_06.xml)


