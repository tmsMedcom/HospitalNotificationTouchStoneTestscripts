Instance: HN-send-UF_H_V_18
InstanceOf: TestScript
* insert Metadata
* id = "HN-UFHV-18"
* name = "MORS"
* title = "HN-UF-H_V_18"
* description = "Patient dies upon arrival at the hospital Flow:MORS"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTestDecased(AN-SLHJ-EMER-mors, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-MORS.xml,
 cancel-discharge-emergency-home, EMER, finished, NA, source,true)
