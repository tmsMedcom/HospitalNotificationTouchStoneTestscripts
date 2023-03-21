/* //Get RE-STIN
Instance: HospitalNotification-TestScript-receive-RE-STIN
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-re-stin"
* name = "Receive: Update Start hospital stay - admission"
* title = "Receive: Update Start hospital stay - admission - RE_STIN"
* description = "Test of receiving of HospitalNotification Message."
// Fixturen indeholder en placeholder ved MessageHeader.destination.endpoint.
* insert createInitialMessageSetup(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STIN.xml, destinationUri-STIN)
* insert createMessageSetup(RE-STIN, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-RE-STIN.xml, destinationUri-RE-STIN)
* insert readMessage(STIN, 01, destinationUri-STIN)
* insert readMessage(RE-STIN, 02, destinationUri-RE-STIN)


//Get RE-SLHJ-imp
Instance: HospitalNotification-TestScript-receive-RE-SLHJ-imp
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-re-slhj-imp"
* name = "Receive: Update End hospital stay – patient completed to home/primary sector"
* title = "Receive: Update End hospital stay – patient completed to home/primary sector - RE-SLHJ"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STIN.xml, destinationUri-STIN)
* insert createMessageSetup(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-SLHJ-imp.xml, destinationUri-SLHJ)
* insert createMessageSetup(RE-SLHJ, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-RE-SLHJ-imp.xml, destinationUri-RE-SLHJ)
* insert readMessage(STIN, 01, destinationUri-STIN)
* insert readMessage(SLHJ, 02, destinationUri-SLHJ)
* insert readMessage(RE-SLHJ, 03, destinationUri-RE-SLHJ)


//Get RE-STAA
Instance: HospitalNotification-TestScript-receive-RE-STAA
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-re-staa"
* name = "Receive: Update Start hospital stay - acute ambulant"
* title = "Receive: Update Start hospital stay - acute ambulant - RE-STAA"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STAA.xml, destinationUri-STAA)
* insert createMessageSetup(RE-STAA, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-RE-STAA.xml, destinationUri-RE-STAA)
* insert readMessage(STAA, 01, destinationUri-STAA)
* insert readMessage(RE-STAA, 02, destinationUri-RE-STAA)

//Get RE-SLHJ-emer
Instance: HospitalNotification-TestScript-receive-RE-SLHJ-emer
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-re-slhj-emer"
* name = "Receive: Update End hospital stay – patient completed to home/primary sector"
* title = "Receive: Update End hospital stay – patient completed to home/primary sector - RE-SLHJ"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STAA.xml, destinationUri-STAA)
* insert createMessageSetup(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-SLHJ-emer.xml, destinationUri-SLHJ)
* insert createMessageSetup(RE-SLHJ, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-RE-SLHJ-emer.xml, destinationUri-RE-SLHJ)
* insert readMessage(STAA, 01, destinationUri-STAA)
* insert readMessage(SLHJ, 02, destinationUri-SLHJ)
* insert readMessage(RE-SLHJ, 03, destinationUri-RE-SLHJ)

//Get RE-STOR
Instance: HospitalNotification-TestScript-receive-RE-STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-re-stor"
* name = "Receive: Update Start leave"
* title = "Receive: Update Start leave - RE-STOR"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STIN.xml, destinationUri-STIN)
* insert createMessageSetup(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STOR.xml, destinationUri-STOR)
* insert createMessageSetup(RE-STOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-RE-STOR.xml, destinationUri-RE-STOR)
* insert readMessage(STIN, 01, destinationUri-STIN)
* insert readMessage(STOR, 02, destinationUri-STOR)
* insert readMessage(RE-STOR, 03, destinationUri-RE-STOR)

//Get RE-SLOR
Instance: HospitalNotification-TestScript-receive-RE-SLOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-re-slor"
* name = "Receive: Update End leave"
* title = "Receive: Update End leave	- RE-SLOR"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STIN.xml, destinationUri-STIN)
* insert createMessageSetup(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STOR.xml, destinationUri-STOR)
* insert createMessageSetup(SLOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-SLOR.xml, destinationUri-SLOR)
* insert createMessageSetup(RE-SLOR, 04, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-RE-SLOR.xml, destinationUri-RE-SLOR)
* insert readMessage(STIN, 01, destinationUri-STIN)
* insert readMessage(STOR, 02, destinationUri-STOR)
* insert readMessage(SLOR, 03, destinationUri-SLOR)
* insert readMessage(RE-SLOR, 04, destinationUri-RE-SLOR)

//Get RE-MORS
Instance: HospitalNotification-TestScript-receive-RE-MORS
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-re-mors"
* name = "Receive: Update Deceased - is dead at arrival to the hospital"
* title = "Receive: Update Deceased - is dead at arrival to the hospital - RE-MORS"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(MORS, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-MORS.xml, destinationUri-MORS)
* insert createMessageSetup(RE-MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-RE-MORS.xml, destinationUri-RE-MORS)
* insert readMessage(MORS, 01, destinationUri-MORS)
* insert readMessage(RE-MORS, 02, destinationUri-RE-MORS)

//Get RE-MORS-imp
Instance: HospitalNotification-TestScript-receive-RE-MORS-imp
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-re-mors-imp"
* name = "Receive: Update Deceased - dies during hospital stay"
* title = "Receive: Update Deceased - dies during hospital stay - RE-MORS"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STIN.xml, destinationUri-STIN)
* insert createMessageSetup(MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-MORS-imp.xml, destinationUri-MORS)
* insert createMessageSetup(RE-MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-RE-MORS-imp.xml, destinationUri-RE-MORS)
* insert readMessage(STIN, 01, destinationUri-STIN)
* insert readMessage(MORS, 02, destinationUri-MORS)
* insert readMessage(RE-MORS, 03, destinationUri-RE-MORS)

 
//Get RE-MORS-emer
Instance: HospitalNotification-TestScript-receive-RE-MORS-emer
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-re-mors-emer"
* name = "Receive: Update Deceased - dies during acute ambulant"
* title = "Receive: Update Deceased - dies during acute ambulant - RE-MORS"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STAA.xml, destinationUri-STAA)
* insert createMessageSetup(MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-MORS-emer.xml, destinationUri-MORS)
* insert createMessageSetup(RE-MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-RE-MORS-emer.xml, destinationUri-RE-MORS)
* insert readMessage(STAA, 01, destinationUri-STAA)
* insert readMessage(MORS, 02, destinationUri-MORS)
* insert readMessage(RE-MORS, 03, destinationUri-RE-MORS)

//Get RE-MORS_STOR
Instance: HospitalNotification-TestScript-receive-RE-MORS-STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-re-mors-stor"
* name = "Receive: Update Deceased - dies during a period of leave"
* title = "Receive: Update Deceased - dies during a period of leave - RE-MORS"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STIN.xml, destinationUri-STIN)
* insert createMessageSetup(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STOR.xml, destinationUri-STOR)
* insert createMessageSetup(MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-MORS-STOR.xml, destinationUri-MORS)
* insert createMessageSetup(RE-MORS, 04, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-RE-MORS-STOR.xml, destinationUri-RE-MORS)
* insert readMessage(STIN, 01, destinationUri-STIN)
* insert readMessage(STOR, 02, destinationUri-STOR)
* insert readMessage(MORS, 03, destinationUri-MORS)
* insert readMessage(RE-MORS, 04, destinationUri-RE-MORS)
 */