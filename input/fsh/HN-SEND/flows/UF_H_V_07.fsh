Instance: HN-send-UF_H_V_07
InstanceOf: TestScript
* insert Metadata
* id = "HN-UFHV-07"
* name = "discharged"
* title = "HN-UF-H_V_07"
* description = "Patient is admitted at hospital and a day after discharged (emergency) Flow:STAA+SLHJ"
//params createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus, whatRefference, role)
//Once per testscript whatRefference= first is NA efterwards preveious messageheader
* insert createHNSendTest(STAA, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STAA.xml,
 admit-emergency, EMER, in-progress, NA, source) 

* insert createHNSendTest(SLHJ-EMER, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-SLHJ.xml,
 discharge-emergency-home, EMER, finished, headerResourceReferenceSTAA1, derivation)