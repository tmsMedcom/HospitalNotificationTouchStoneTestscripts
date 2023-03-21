/* //Get AN-STIN
Instance: HospitalNotification-TestScript-receive-AN-STIN
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-an-stin"
* name = "Receive: Cancellation Start hospital stay - admission"
* title = "Receive: Cancellation Start hospital stay - admission - AN-STIN"
* description = "Test of receiving of HospitalNotification Message."
// Fixturen indeholder en placeholder ved MessageHeader.destination.endpoint.
* insert createInitialMessageSetup(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STIN.xml, destinationUri-STIN)
* insert createMessageSetup(AN-STIN, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-AN-STIN.xml, destinationUri-AN-STIN)
* insert readMessage(STIN, 01, destinationUri-STIN)
* insert readMessage(AN-STIN, 02, destinationUri-AN-STIN)

//Get AN-SLHJ-imp
Instance: HospitalNotification-TestScript-receive-AN-SLHJ-imp
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-an-slhj-imp"
* name = "Receive: Cancellation End hospital stay – patient completed to home/primary sector"
* title = "Receive: Cancellation End hospital stay – patient completed to home/primary sector - AN-SLHJ"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STIN.xml, destinationUri-STIN)
* insert createMessageSetup(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-SLHJ-imp.xml, destinationUri-SLHJ)
* insert createMessageSetup(AN-SLHJ, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-AN-SLHJ-imp.xml, destinationUri-AN-SLHJ)
* insert readMessage(STIN, 01, destinationUri-STIN)
* insert readMessage(SLHJ, 02, destinationUri-SLHJ)
* insert readMessage(AN-SLHJ, 03, destinationUri-AN-SLHJ)


//Get AN-STAA
Instance: HospitalNotification-TestScript-receive-AN-STAA
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-an-staa"
* name = "Receive: Cancellation Start hospital stay - acute ambulant"
* title = "Receive: Cancellation Start hospital stay - acute ambulant - AN-STAA"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STAA.xml, destinationUri-STAA)
* insert createMessageSetup(AN-STAA, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-AN-STAA.xml, destinationUri-AN-STAA)
* insert readMessage(STAA, 01, destinationUri-STAA)
* insert readMessage(AN-STAA, 02, destinationUri-AN-STAA)

//Get AN-SLHJ-emer
Instance: HospitalNotification-TestScript-receive-AN-SLHJ-emer
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-an-slhj-emer"
* name = "Receive: Cancellation End hospital stay – patient completed to home/primary sector"
* title = "Receive: Cancellation End hospital stay – patient completed to home/primary sector - AN-SLHJ"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STAA.xml, destinationUri-STAA)
* insert createMessageSetup(SLHJ, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-SLHJ-emer.xml, destinationUri-SLHJ)
* insert createMessageSetup(AN-SLHJ, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-AN-SLHJ-emer.xml, destinationUri-AN-SLHJ)
* insert readMessage(STAA, 01, destinationUri-STAA)
* insert readMessage(SLHJ, 02, destinationUri-SLHJ)
* insert readMessage(AN-SLHJ, 03, destinationUri-AN-SLHJ)

//Get AN-STOR
Instance: HospitalNotification-TestScript-receive-AN-STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-an-stor"
* name = "Receive: Cancellation Start leave"
* title = "Receive: Cancellation Start leave - AN-STOR"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STIN.xml, destinationUri-STIN)
* insert createMessageSetup(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STOR.xml, destinationUri-STOR)
* insert createMessageSetup(AN-STOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-AN-STOR.xml, destinationUri-AN-STOR)
* insert readMessage(STIN, 01, destinationUri-STIN)
* insert readMessage(STOR, 02, destinationUri-STOR)
* insert readMessage(AN-STOR, 03, destinationUri-AN-STOR)

//Get AN-SLOR
Instance: HospitalNotification-TestScript-receive-AN-SLOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-an-slor"
* name = "Receive: Cancellation End leave"
* title = "Receive: Cancellation End leave	- AN-SLOR"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STIN.xml, destinationUri-STIN)
* insert createMessageSetup(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STOR.xml, destinationUri-STOR)
* insert createMessageSetup(SLOR, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-SLOR.xml, destinationUri-SLOR)
* insert createMessageSetup(AN-SLOR, 04, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-AN-SLOR.xml, destinationUri-AN-SLOR)
* insert readMessage(STIN, 01, destinationUri-STIN)
* insert readMessage(STOR, 02, destinationUri-STOR)
* insert readMessage(SLOR, 03, destinationUri-SLOR)
* insert readMessage(AN-SLOR, 04, destinationUri-AN-SLOR)

//Get AN-MORS
Instance: HospitalNotification-TestScript-receive-AN-MORS
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-an-mors"
* name = "Receive: Cancellation Deceased - is dead at arrival to the hospital"
* title = "Receive: Cancellation Deceased - is dead at arrival to the hospital - AN-MORS"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(MORS, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-MORS.xml, destinationUri-MORS)
* insert createMessageSetup(AN-MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-AN-MORS.xml, destinationUri-AN-MORS)
* insert readMessage(MORS, 01, destinationUri-MORS)
* insert readMessage(AN-MORS, 02, destinationUri-AN-MORS)

//Get AN-MORS-imp
Instance: HospitalNotification-TestScript-receive-AN-MORS-imp
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-an-mors-imp"
* name = "Receive: Cancellation Deceased - dies during hospital stay"
* title = "Receive: Cancellation Deceased - dies during hospital stay - AN-MORS"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STIN.xml, destinationUri-STIN)
* insert createMessageSetup(MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-MORS-imp.xml, destinationUri-MORS)
* insert createMessageSetup(AN-MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-AN-MORS-imp.xml, destinationUri-AN-MORS)
* insert readMessage(STIN, 01, destinationUri-STIN)
* insert readMessage(MORS, 02, destinationUri-MORS)
* insert readMessage(AN-MORS, 03, destinationUri-AN-MORS)

 
//Get AN-MORS-emer
Instance: HospitalNotification-TestScript-receive-AN-MORS-emer
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-an-mors-emer"
* name = "Receive: Cancellation Deceased - dies during acute ambulant"
* title = "Receive: Cancellation Deceased - dies during acute ambulant - AN-MORS"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(STAA, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STAA.xml, destinationUri-STAA)
* insert createMessageSetup(MORS, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-MORS-emer.xml, destinationUri-MORS)
* insert createMessageSetup(AN-MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-AN-MORS-emer.xml, destinationUri-AN-MORS)
* insert readMessage(STAA, 01, destinationUri-STAA)
* insert readMessage(MORS, 02, destinationUri-MORS)
* insert readMessage(AN-MORS, 03, destinationUri-AN-MORS)

//Get AN-MORS_STOR
Instance: HospitalNotification-TestScript-receive-AN-MORS-STOR
InstanceOf: TestScript
* insert Metadata
* id = "hospitalnotification-receive-an-mors-stor"
* name = "Receive: Cancellation Deceased - dies during a period of leave"
* title = "Receive: Cancellation Deceased - dies during a period of leave - AN-MORS"
* description = "Test of receiving of HospitalNotification Message."
* insert createInitialMessageSetup(STIN, 01, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STIN.xml, destinationUri-STIN)
* insert createMessageSetup(STOR, 02, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-STOR.xml, destinationUri-STOR)
* insert createMessageSetup(MORS, 03, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-MORS-STOR.xml, destinationUri-MORS)
* insert createMessageSetup(AN-MORS, 04, /FHIRSandbox/MedCom/HospitalNotificationTMS/HospitalNotification-fixture-AN-MORS-STOR.xml, destinationUri-AN-MORS)
* insert readMessage(STIN, 01, destinationUri-STIN)
* insert readMessage(STOR, 02, destinationUri-STOR)
* insert readMessage(MORS, 03, destinationUri-MORS)
* insert readMessage(AN-MORS, 04, destinationUri-AN-MORS)
 */