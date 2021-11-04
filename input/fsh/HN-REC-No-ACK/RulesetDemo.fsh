/*Instance: TestinstanceACKOK
InstanceOf: TestScript
//IF NOT ok send operationOutcome ruleset ELSE send OperationOutcomeNot
* insert ACKRule(83e8e271-ced4-4ca7-ad4b-256ca00ed07f,ok, Metadata, OperationOutcomeNot)

Instance: TestinstanceACKtransient-error
InstanceOf: TestScript
//IF NOT ok send operationOutcome ruleset ELSE send OperationOutcomeNot
* insert ACKRule(92446d93-ec60-4151-b550-3ef6a1b37e08,transient-error, Metadata, OperationOutcome)

Instance: TestinstanceACKfatal-error
InstanceOf: TestScript
//IF NOT ok send operationOutcome ruleset ELSE send OperationOutcomeNot
* insert ACKRule(3e345dfd-32bb-4b0f-92f4-b5798f7c27e4,fatal-error, Metadata, OperationOutcome)
*/