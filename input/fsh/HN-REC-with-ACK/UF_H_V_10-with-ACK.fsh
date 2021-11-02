//STIN+STIN+SLHJ
Instance: TestinstanceUFHV10-with-ACK
InstanceOf: TestScript


* insert Metadata
* id = "UFHV10-with-ACK"
* name = "Patient is admitted at hospital, transferred to another hospital (another region), and finally discharged to home"
* title = "Patient is admitted at hospital, transferred to another hospital (another region), and finally discharged to home"
* description = "Testing correct use of admit and discharge"

//Once per testscript
* insert ACKFixture 

//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/STIN-UF_H_V_10.xml)

//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/STIN2-UF_H_V_10.xml)

//param: type, number fixture
* insert HospitalNotificationCreateTest(SLHJ, 3, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/SLHJ-UF_H_V_10.xml)

