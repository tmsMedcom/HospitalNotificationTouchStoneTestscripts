Instance: HN-send-UF_H_V_06
InstanceOf: TestScript
* insert Metadata
* id = "HN-UFHV-06"
* name = "corection"
* title = "HN-UF-H_V_06"
* description = "Correction: Patient is admitted but the hospital department registered is incorrect Flow: STIN+STIN"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_1.xml,
 admit-inpatient, IMP, in-progress, NA, source)

* insert createHNSendTest(RE-STIN, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-RE_STIN.xml,
 revise-admit-inpatient, IMP, in-progress, headerResourceReferenceSTIN1, derivation)