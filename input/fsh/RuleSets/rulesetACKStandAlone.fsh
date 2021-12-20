RuleSet: OperationOutcomeNot
* test[=].action[+].assert.description = "Confirm that the Bundle not containing a OperationOutcome"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(OperationOutcome).exists().not()"
* test[=].action[=].assert.warningOnly = false

RuleSet: OperationOutcome
* test[=].action[+].assert.description = "Confirm that the Bundle containing a OperationOutcome"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(OperationOutcome).exists()"
* test[=].action[=].assert.warningOnly = false