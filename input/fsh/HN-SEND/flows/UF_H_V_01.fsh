Instance: HN-send-UF_H_V_01
InstanceOf: TestScript
* insert Metadata
* id = "HN-UFHV-01"
* name = "Start hospital admit-emergency"
* title = "HN-UF-H_V_01"
* description = "Patient is admitted at hospital and a week after discharged to home (inpatient) Flow: STIN+SLHJ"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_1.xml,
 admit-inpatient, IMP, in-progress, NA, source) 
* insert createHNSendTest(SLHJ-IMP, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-SLHJ.xml,
 discharge-inpatient-home, IMP, finished, headerResourceReferenceSTIN1, derivation)