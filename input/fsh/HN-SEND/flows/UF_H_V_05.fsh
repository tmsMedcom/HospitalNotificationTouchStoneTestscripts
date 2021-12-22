Instance: HN-send-UF_H_V_05
InstanceOf: TestScript
* insert Metadata
* id = "HN-UFHV-05"
* name = "Cancellation"
* title = "HN-UF-H_V_05"
* description = "Cancellation: Wrong patient has been admitted Flow:STIN+STIN "
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_1.xml,
 admit-inpatient, IMP, in-progress, NA, source)

* insert createHNSendTest(AN-STIN, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-AN_STIN.xml,
 cancel-admit-inpatient, IMP, entered-in-error, headerResourceReferenceSTIN1, derivation)