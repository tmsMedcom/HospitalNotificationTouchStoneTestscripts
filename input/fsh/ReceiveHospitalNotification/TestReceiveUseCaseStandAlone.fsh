//Read STIN
Instance: HospitalNotification-Receive-STIN
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-stin"
* name = "Read start hospital stay-admission"
* title = "Read start hospital stay-admission - STIN"
* description = "Testing correct receiving of HospitalNotification Message."
// Fixturen indeholder en placeholder ved MessageHeader.destination.endpoint.
* insert createMessageSetup(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationSTIN-Placeholder.xml)
* insert readMessage(STIN, 02)

//Read RE-STIN
Instance: HospitalNotification-Receive-RE-STIN
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-re-stin"
* name = "Read revision of start hospital stay-admission"
* title = "Read revision of start hospital stay-admission - RE_STIN"
* description = "Testing correct receiving of HospitalNotification Message."
// Fixturen indeholder en placeholder ved MessageHeader.destination.endpoint, hvilket gør endpointet unikt for hver bruger.
* insert createMessageSetup(RE-STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationRE-STIN-Placeholder.xml)
* insert readMessage(RE-STIN, 02)

//Read AN-STIN
Instance: HospitalNotification-Receive-AN-STIN
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-an-stin"
* name = "Read cancellation of start hospital stay-admission"
* title = "Read cancellation of  start hospital stay-admission - AN_STIN"
* description = "Testing correct receiving of HospitalNotification Message."
// Fixturen indeholder en placeholder ved MessageHeader.destination.endpoint, hvilket gør endpointet unikt for hver bruger.
* insert createMessageSetup(AN-STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/fixtureHospitalNotificationAN-STIN-Placeholder.xml)
* insert readMessage(AN-STIN, 02)