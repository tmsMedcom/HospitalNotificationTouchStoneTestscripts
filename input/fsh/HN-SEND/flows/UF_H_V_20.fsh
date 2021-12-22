Instance: HN-send-UF_H_V_20
InstanceOf: TestScript
* insert Metadata
* id = "HN-UFHV-20"
* name = "leaveReturnDischarged"
* title = "HN-UF-H_V_20"
* description = "Patient is admitted, goes on leave from the hospital and dies during leave Flow:STIN+STOR+SLOR+MORS"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_1.xml,
 admit-inpatient, IMP, in-progress, NA, source) 

* insert createHNSendTest(STOR, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STOR.xml,
 start-leave-inpatient, IMP, on-leave, headerResourceReferenceSTIN1, derivation)

* insert createHNSendTest(SLOR, 3, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-SLOR.xml,
 end-leave-inpatient, IMP, in-progress, headerResourceReferenceSTIN1, derivation)

* insert createHNSendTestDecased(AN-STIN-IMP-mors, 4, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-MORS.xml,
 cancel-discharge-inpatient-home, IMP, finished, headerResourceReferenceSTIN1, derivation,true)