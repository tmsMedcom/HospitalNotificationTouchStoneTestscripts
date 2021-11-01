RuleSet: createAckTest(testId,fixtureid, bundleResourceid, MessageHeaderIdentifier, ProvenanceID)
* insert CrateVariabels({fixtureid}, {bundleResourceid}, {MessageHeaderIdentifier}, {ProvenanceID} )

* test[+].id = "{testId}ACK-{fixtureid}" //Name change
* test[=].name = "{testId} Post Acknowledgement-{fixtureid}" //Name change
* test[=].description = "GET ACK" //Name change
* test[=].action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[=].action[=].operation.type.code = #create
* test[=].action[=].operation.resource = #Bundle
* test[=].action[=].operation.description = "Post a acknowledgement"
* test[=].action[=].operation.accept = #xml
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.sourceId = "bundle-create-ack-OK" 

* test[=].action[+].assert.description = "Confirm that the client request payload contains a Bundle resource type."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.resource = #Bundle
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the MessageHeader response code is OK"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(MessageHeader).response.code"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "ok"
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the request resource contains the expected evetCoding code."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(MessageHeader).event.as(Coding).select(code = 'acknowledgment-message').allTrue()"
* test[=].action[=].assert.warningOnly = false

* insert OperationOutcomeNot

* test[=].action[+].assert.description = "Confirm that the MessageHeader.response.identifier is equal to Id of original message "
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(MessageHeader).response.identifier"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "${{bundleResourceid}}" //Change
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the reference original Provenance.entity.what is equal to Id of original messageheader.identifier"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Provenance).where(entity.what.reference ='${{MessageHeaderIdentifier}}')" //Change
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the there are two Provenances"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Provenance).count() = 2" //Change
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the id of the original message provenance exist in the ack"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Provenance).where(id='${{ProvenanceID}}').exists()" //Change
* test[=].action[=].assert.warningOnly = false

RuleSet: ACKFixture 
//only one per script
* fixture[+].id = "bundle-create-ack-OK"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "/FHIRSandbox/MedCom/401-Acknowledgement/_reference/resources/Acknowledgement-ok.xml"

//Type = e.g. SLHJ, STIn 
RuleSet: CrateVariabels(fixtureid, bundleResourceid, MessageHeaderIdentifier, ProvenanceID)
// test2 ack - SKAL MED I TBD indvi 
/** variable[+].name = "{bundleResourceid}"
* variable[=].expression = "Bundle.id"
* variable[=].sourceId = "{fixtureid}"*/
// test2 ack - SKAL MED I TBD indvi
* variable[+].name = "{MessageHeaderIdentifier}"
* variable[=].expression = "Bundle.entry[0].fullUrl"
* variable[=].sourceId = "{fixtureid}"

// test1 ack - SKAL MED I TBD indvi
* variable[+].name = "{ProvenanceID}"
* variable[=].expression = "Bundle.entry.resource.ofType(Provenance).id"
* variable[=].sourceId = "{fixtureid}"

