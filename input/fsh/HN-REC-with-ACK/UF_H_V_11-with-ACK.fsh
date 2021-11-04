//STIN+SLHJ+STIN
Instance: TestinstanceUFHV11-with-ACK
InstanceOf: TestScript


* insert Metadata
* id = "UFHV11-with-ACK"
* name = "Patient is admitted at hospital, transfers himself to another hospital (another region), and finally discharged to home"
* title = "Patient is admitted at hospital, transfers himself to another hospital (another region), and finally discharged to home"
* description = "Testing correct use of admit and discharge"

//Once per testscript
* insert ACKFixture 

//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_11.xml)

//param: type, number fixture
* insert HospitalNotificationCreateTest(SLHJ, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/HospitalNotificationMessage-SLHJ-UF_H_V_11.xml)

//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 3, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/HospitalNotificationMessage-STIN2-UF_H_V_11.xml)
