Instance: HN-send-UF_H_V_11
InstanceOf: TestScript
* insert Metadata
* id = "HN-UFHV-11"
* name = "neverReturnsAfterLeave"
* title = "HN-UF-H_V_11"
* description = "Patient is admitted at hospital, goes on leave from hospital but never returns after leave and is discharged to home Flow:STIN+STOR+SLHJ"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_1.xml,
 admit-inpatient, IMP, in-progress, NA, source) 

* insert createHNSendTest(STOR, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STOR.xml,
 start-leave-inpatient, IMP, on-leave, headerResourceReferenceSTIN1, derivation)

* insert createHNSendTest(SLHJ-IMP, 3, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-SLHJ.xml,
 discharge-inpatient-home, IMP, finished, headerResourceReferenceSTIN1, derivation)