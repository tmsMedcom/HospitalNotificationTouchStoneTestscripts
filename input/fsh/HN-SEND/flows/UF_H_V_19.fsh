Instance: HN-send-UF_H_V_19
InstanceOf: TestScript
* insert Metadata
* id = "HN-UFHV-19"
* name = "STINMORS"
* title = "HN-UF-H_V_19"
* description = "Patient is admitted and dies at the hospital Flow:STIN+MORS"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader

* insert createHNSendTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_1.xml,
 admit-inpatient, IMP, in-progress, NA, source) 

* insert createHNSendTestDecased(AN-STIN-IMP-mors, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-MORS.xml,
 cancel-discharge-inpatient-home, IMP, finished, headerResourceReferenceSTIN1, derivation,true)
