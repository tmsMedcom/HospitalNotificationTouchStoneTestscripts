//STIN+SLHJ+STIN
Instance: TestinstanceUFHV9-with-ACK
InstanceOf: TestScript


* insert Metadata
* id = "UFHV09-with-ACK"
* name = "Admitted, transferred and discharged to home"
* title = "Patient is admitted at hospital, transfers himself to another hospital (same region), and finally dicharged to home"
* description = "Testing correct use of admit and discharge"

//Once per testscript
* insert ACKFixture 

//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_09.xml)

//param: type, number fixture
* insert HospitalNotificationCreateTest(SLHJ, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/HospitalNotificationMessage-SLHJ-UF_H_V_09.xml)

//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 3, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/HospitalNotificationMessage-STIN2-UF_H_V_09.xml)
