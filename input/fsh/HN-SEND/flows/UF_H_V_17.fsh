Instance: HN-send-UF_H_V_17
InstanceOf: TestScript
* insert Metadata
* id = "HN-UFHV-17"
* name = "EMERAdmit"
* title = "HN-UF-H_V_17"
* description = "Patient is in an emergency outpatient setting at hospital, but ends up being admitted Flow:STAA+STIN"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(STAA, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STAA.xml,
 admit-emergency, EMER, in-progress, NA, source) 

* insert createHNSendTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_1.xml,
 admit-inpatient, IMP, in-progress, headerResourceReferenceSTAA1, derivation) 