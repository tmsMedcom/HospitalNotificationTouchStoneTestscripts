//STIN+STIN+SLHJ
Instance: TestinstanceUFHV8-with-ACK
InstanceOf: TestScript


* insert Metadata
* id = "UFHV08-with-ACK"
* url = "http://build.fhir.org/ig/hl7dk/dk-medcom/"
* name = "Admitted, transferred and discharged to home"
* title = "Patient is admitted at hospital, transferred to another hospital (same region), and finally discharged to home"
* description = "Testing correct use of admit and discharge"

//Once per testscript
* insert ACKFixture 
//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_15.xml)
//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN2-UF_H_V_15.xml)
//param: type, number fixture
* insert HospitalNotificationCreateTest(SJHJ, 3, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-SLHJ-UF_H_V_15.xml)
