### Background

In this Implementation Guide (IG), testscripts for sending and receiving [HospitalNotifications](https://medcomdk.github.io/dk-medcom-hospitalnotification) are included.
The testscripts are created by MedCom for testing in [Touchstone](https://touchstone.aegis.net/touchstone/) during MedCom test and certification, both self- and livetest. However, they may be used locally by vendors in their own testsetup. 

Testscripts presented in this IG are all based on the [Testscript FHIR resource](https://www.hl7.org/fhir/testscript.html). They are profiled by MedCom using FSH and published using the FHIR publisher. 

### Before getting started

Use cases described in the [use case document](https://medcomdk.github.io/dk-medcom-hospitalnotification/#12-use-cases) will be referenced throughout this IG and they are the basis for the tests. 

As a supplementary for testscripts based on the use cases, testscripts testing **Patient flows** are included. These testscripts will test different and in some cases extended flows of the HospitalNotification, that hasn't been tested in the use cases. They will of course only test within the boundaries of the HospitalNotification standard and governance. 

#### TouchStone and API
Before getting started with testscript execution, it is nessecary to have an account on TouchStone and to create a testsystem. Please follow [this guide to steup an account and testsystem](https://medcomdk.github.io/MedComLandingPage/assets/documents/TouchStoneGettingStarted.html).

#### Abbreviations and naming
The term 'inpatient' and abbreviation 'imp' refers to a patient that is hospitalised as an inpatient (Danish: indlagt) and the term 'emergency' or abbreviation 'emer' refers to a patient that is hospitalised as acute ambulant (Danish: akut ambulant).

The abbreviation 'tec' is used when testing the patient flow, to indicate that the testscript has a tecnical character. 

The system under test is abbreviated 'SUT'.

**Testscript naming:**

**Use cases:** Most of the send testscripts requires that SUT has executed one or more use cases in advance. These use cases are listed in the 'Precondition' columns in the tables. 
The name of the testscripts are constituted by HospitalNotification-[send/receive]-[type]-[imp/emer or alternative flow or precondition], describing the type of messaging being sent, or receveived. 'HospitalNotifciation-' is not shown in the naming below.

**Patient flow:** These will be named HospitalNotification-PF-[send/receive]-[imp/emer/tec]-[number]. 'HospitalNotifciation-' is not shown in the naming below. 


### Send Hospitalnotification testscripts
When sending a HospitalNotification, a POST operation is required for all types of messages, valid for both the precondition messages and actual messages being tested. 

#### Use Cases

| **Testscript** | **Use case code** | **Use case description** | **Type** | **Precondition** |
|---|---|---|---|---|
| **Inpatient** |  |  |  |  |
| STIN | S1 | Indlæg patient og send ‘Advis om sygehusophold’ | STIN |  |
| STIN-A1 | S1.A1 | Indlæg patient og send ‘Advis om sygehusophold’ uden anmodning om indlæggelsesrapport | STIN |  |
| STOR-imp | S3 | Registrér patient på orlov og send ‘Advis om sygehusophold’ | STOR | STIN |
| SLOR-imp | S4 | Registrér patient som returneret fra orlov og send ‘Advis om sygehusophold’ | SLOR | STIN, STOR |
| SLHJ-imp | S6 | Udskriv/afslut patient og send ‘Advis om sygehusophold’ | SLHJ | STIN |
| MORS | S7 | Send ‘Advis om sygehusophold’ ved patientens død - død ved ankomst | MORS | |
| MORS-imp | S7 | Send ‘Advis om sygehusophold’ ved patientens død - patient død under indlæggelse | MORS | STIN |
| MORS-STOR | S7 | Send ‘Advis om sygehusophold’ ved patientens død - patient død under orlov | MORS | STIN, STOR |
| **Emergency** |  |  |  |  |
| STAA | S2 | Registrér patient som akut ambulant og send ‘Advis om sygehusophold’ | STAA |  |
| SLHJ-emer | S6 | Udskriv/afslut patient og send ‘Advis om sygehusophold’ | SLHJ | STAA |
| MORS-emer | S7 | Send ‘Advis om sygehusophold’ ved patientens død | MORS | STAA |
| **Inpatient** |  |  |  |  |
| RE_STIN | S.CORR | Ret sygehusophold og send rettelsesadvis | RE_STIN | STIN |
| RE_STOR | S.CORR | Ret sygehusophold og send rettelsesadvis | RE_STOR | STIN, STOR |
| RE_SLOR | S.CORR | Ret sygehusophold og send rettelsesadvis | RE_SLOR | STIN, STOR, SLOR |
| RE_SLHJ-imp | S.CORR | Ret sygehusophold og send rettelsesadvis | RE_SLHJ | STIN, SLHJ |
| RE_MORS | S.CORR | Send ‘Advis om sygehusophold’ ved patientens død - død ved ankomst | RE_MORS | MORS |
| RE_MORS-imp | S.CORR | Send ‘Advis om sygehusophold’ ved patientens død - patient død under indlæggelse | RE_MORS | STIN, MORS |
| RE_MORS-STOR | S.CORR | Send ‘Advis om sygehusophold’ ved patientens død - patient død under orlov | RE_MORS | STIN, STOR, MORS |
| **Emergency** |  |  |  |  |
| RE_STAA | S.CORR | Ret sygehusophold og send rettelsesadvis | RE_STAA | STAA |
| RE_SLHJ-emer | S.CORR | Ret sygehusophold og send rettelsesadvis | RE_SLHJ | STAA, SLHJ |
| RE_MORS-emer | S.CORR | Ret sygehusophold og send rettelsesadvis | RE_MORS | STAA, MORS |
| **Inpatient** |  |  |  |  |
| AN_STIN | S.CANC | Annullér en allerede afsendt ‘Advis om sygehusophold’ | AN_STIN | STIN |
| AN_STOR-imp | S.CANC | Annullér en allerede afsendt ‘Advis om sygehusophold’ | AN_STOR | STIN, STOR |
| AN_SLOR-imp | S.CANC | Annullér en allerede afsendt ‘Advis om sygehusophold’ | AN_SLOR | STIN, STOR, SLOR |
| AN_SLHJ-imp | S.CANC | Annullér en allerede afsendt ‘Advis om sygehusophold’ | AN_SLHJ | STIN, SLHJ |
| AN_MORS | S.CANC | Send ‘Advis om sygehusophold’ ved patientens død - død ved ankomst | AN_MORS | MORS |
| AN_MORS-imp | S.CANC | Send ‘Advis om sygehusophold’ ved patientens død - patient død under indlæggelse | AN_MORS | STIN, MORS |
| AN_MORS-STOR | S.CANC | Send ‘Advis om sygehusophold’ ved patientens død - patient død under orlov | AN_MORS | STIN, STOR, MORS |
| **Emergency** |  |  |  |  |
| AN_STAA | S.CANC | Annullér en allerede afsendt ‘Advis om sygehusophold’ | AN_STAA | STAA |
| AN_SLHJ-emer | S.CANC | Annullér en allerede afsendt ‘Advis om sygehusophold’ | AN_SLHJ | STAA, SLHJ |
| AN_MORS-emer | S.CANC | Annullér en allerede afsendt ‘Advis om sygehusophold’ | AN_MORS | STAA, MORS |


#### Patient Flow

| **Testscript** | **Description** | **Type** |
|---|---|---|
| **Inpatient** |  |  |
| PF-send-imp-01 | Admit patient, register patient as being on leave, register patient as returned from leave, discharge patient. | STIN, STOR, SLOR, SLHJ |
| PF-send-imp-02 | Admit patient, register patient as being on leave, patient doesn’t return from leave, discharge patient. | STIN, STOR, SLHJ |
| PF-send-imp-03 | Admit patient, register patient as being on leave, patient returns from leave, patient dies | STIN, STOR, SLOR, MORS |
| PF-send-imp-04 | Admit patient, *register patient as being on leave, patient returns from leave*, * to * x2  | STIN,  STOR, SLOR, STOR, SLOR |
| PF-send-imp-05 | Admit patient, correct message due to incorrect hospital department | STIN, RE_STIN |
| PF-send-imp-06 | Admit patient, correct message due to incorrect time of admission | STIN, RE_STIN |
| **Emergency** |  |  |
| PF-send-emer-01 | Admit patient, correct message due to incorrect hospital department | STAA, RE_STAA |
| PF-send-emer-02 | Admit patient, correct message due to incorrect time of admission | STAA, RE_STAA |
| **Emergency/Inpatient** |  |  |
| PF-send-emer/imp-01 | Admit patient as emergency, Admit patient as inpatient, discharge patient | STAA, STIN, SLHJ |
| **Technical** |  |  |
| PF-send-tec-01 | Send dublet: Admit patient, doesn't get acknowledged, send admit patient. Ids are handled correct | STIN, STIN |
| PF-send-tec-02 | Cancel a correction: Admit patient, correct admit patient and cancel the correction | STIN, RE_STIN, AN_STIN |
| PF-send-tec-03 | Evaluating on included MustSuppot elements | STIN |



### Receive HospitalNotification message
When receiving a HospitalNotification, a GET operation is required for all types of messages, valid for both the precondition messages and actual messages being tested. 

**Test examples:**
Test examples are, in TouchStone testing, called fixtures. These fixtures are uploaded to TouchStone and during setup of the testscript, all relevant fixtures will be uploadet to the server. 

**HospitalNotifications:** 
The timestamps in the Encounter, Provenance and Bundle, are between the 28th of feburary 2023 and 7th of march 2023. All revise and cancellation messages are sent one hour after the message it revises or cancels.

#### Placeholders
[Placeholders](https://touchstone.aegis.net/touchstone/userguide/html/testscript-authoring/placeholders.html?highlight=placeholder) are used in the fixtures. Placeholders are use to ensure uniqueness in the fixture and to ensure that vendors testing at the same time wont interfere with eachother. 

**UUID:**
Bundle.id will be generate during the test setup. The following line is included in the fixtures.
  `<id value="${UUID}"/>`

**Placeholder:**
MessageHeader.destination.endpoint and id of the MessageHeader, used in the elements MessageHeader.id, Provenance.target and Provenance.entity.what includes the placeholder D6. 
The following line is included in the fixtures.
  `<id value="hefc6d95-6161-4493-99c9-f35948${D6}"/>`


#### Use Cases

| **Testscript** | **Use case code** | **Use case description** | **Type** | **Precondition** |
|---|---|---|---|---|
| **Inpatient** |  |  |  |  |
| STIN | R1 | Modtag advisering om indlæggelse og send indlæggelsesrapport | STIN |  |
| STIN-A1 | R1.A1 | Modtag advisering om indlæggelse uden afsendelse af indlæggelsesrapport | STIN |  |
| STOR-imp | R3 | Modtag advisering om orlov | STOR | STIN |
| SLOR-imp | R4 | Modtag advisering om afslutning af orlov | SLOR | STIN, STOR |
| SLHJ-imp | R6 | Modtag advisering om afslutning/udskrivelse | SLHJ | STIN |
| MORS | R7 | Modtag advisering om borgerens død - borger død ved ankomst | MORS | |
| MORS-imp | R7 | Modtag advisering om borgerens død - borger død under indlæggelse | MORS | STIN |
| MORS-STOR | R7 | Modtag advisering om borgerens død - borger død under orlov | MORS | STIN, STOR |
| **Emergency** |  |  |  |  |
| STAA | R2 | Modtag advisering om akut ambulant sygehusophold og send indlæggelsesrapport | STAA |  |
| SLHJ-emer | R6 | Modtag advisering om afslutning/udskrivelse | SLHJ | STAA |
| MORS-emer | R7 | Modtag advisering om borgerens død | MORS | STAA |
| **Inpatient** |  |  |  |  |
| RE_STIN | R.CORR | Modtag advisering om rettet ‘Advis om sygehusophold’ | RE_STIN | STIN |
| RE_STOR-imp | R.CORR | Modtag advisering om rettet ‘Advis om sygehusophold’ | RE_STOR | STIN, STOR |
| RE_SLOR-imp | R.CORR | Modtag advisering om rettet ‘Advis om sygehusophold’ | RE_SLOR | STIN, STOR, SLOR |
| RE_SLHJ-imp | R.CORR | Modtag advisering om rettet ‘Advis om sygehusophold’ | RE_SLHJ | STIN, SLHJ |
| RE_MORS | R.CORR | Modtag advisering om borgerens død - borger død ved ankomst | RE_MORS | MORS |
| RE_MORS-imp | R.CORR | Modtag advisering om borgerens død - borger død under indlæggelse | RE_MORS | STIN, MORS |
| RE_MORS-STOR | R.CORR | Modtag advisering om borgerens død - borger død under orlov | RE_MORS | STIN, STOR, MORS |
| **Emergency** | | | |  |
| RE_STAA | R.CORR | Modtag advisering om rettet ‘Advis om sygehusophold’ | RE_STAA | STAA |
| RE_SLHJ-imp | R.CORR | Modtag advisering om rettet ‘Advis om sygehusophold’ | RE_SLHJ | STAA, SLHJ |
| RE_MORS-imp | R.CORR | Modtag advisering om rettet ‘Advis om sygehusophold’ | RE_MORS | STAA, MORS |
| **Inpatient** |  |  |  |  |
| AN_STIN | R.CANC | Modtag advisering om annulleret ‘Advis om sygehusophold’ | AN_STIN | STIN |
| AN_STOR-imp | R.CANC | Modtag advisering om annulleret ‘Advis om sygehusophold’ | AN_STOR | STIN, STOR |
| AN_SLOR-imp | R.CANC | Modtag advisering om annulleret ‘Advis om sygehusophold’ | AN_SLOR | STIN, STOR, SLOR |
| AN_SLHJ-imp | R.CANC | Modtag advisering om annulleret ‘Advis om sygehusophold’ | AN_SLHJ | STIN, SLHJ |
| AN_MORS | R.CANC | Modtag advisering om borgerens død - borger død ved ankomst | AN_MORS | MORS |
| AN_MORS-imp | R.CANC | Modtag advisering om borgerens død - borger død under indlæggelse | AN_MORS | STIN, MORS |
| AN_MORS-STOR | R.CANC | Modtag advisering om borgerens død - borger død under orlov | AN_MORS | STIN, STOR, MORS |
| **Emergency** |  |  |  |  |
| AN_STAA | R.CANC | Modtag advisering om annulleret ‘Advis om sygehusophold’ | AN_STAA | STAA |
| AN_STOR-emer | R.CANC | Modtag advisering om annulleret ‘Advis om sygehusophold’ | AN_STOR | STAA, SLHJ |
| AN_MORS-emer | R.CANC | Modtag advisering om annulleret ‘Advis om sygehusophold’ | AN_MORS | STAA, MORS |

#### Patient Flow

| **Testscript** | **Description** | **Type** |
|---|---|---|
| **Inpatient** |  |  |
| PF-receive-imp-01 | Admit patient, register patient as being on leave, register patient as returned from leave, discharge patient. | STIN, STOR, SLOR, SLHJ |
| PF-receive-imp-02 | Admit patient, register patient as being on leave, patient doesn’t return from leave, discharge patient. | STIN, STOR, SLHJ |
| PF-receive-imp-03 | Admit patient, register patient as being on leave, patient returns from leave, patient dies | STIN, STOR, SLOR, MORS |
| PF-receive-imp-04 | Admit patient, *register patient as being on leave, patient returns from leave*, * to * x2  | STIN,  STOR, SLOR, STOR, SLOR |
| PF-receive-imp-05 | Admit patient, correct message due to incorrect hospital department | STIN, RE_STIN |
| PF-receive-imp-06 | Admit patient, correct message due to incorrect time of admission | STIN, RE_STIN |
| **Emergency** |  |  |
| PF-receive-emer-01 | Admit patient, correct message due to incorrect hospital department | STAA, RE_STAA |
| PF-receive-emer-02 | Admit patient, correct message due to incorrect time of admission | STAA, RE_STAA |
| **Emergency/Inpatient** |  |  |
| PF-receive-emer/imp-01 | Admit patient as emergency, Admit patient as inpatient, discharge patient | STAA, STIN, SLHJ |
| **Technical use cases** |  |  |
| PF-receive-tec-01 | Receive dublet: Admit patient, doesn't get acknowledged, send admit patient. Ids are handled correct | STIN, STIN |
| PF-receive-tec-02 | Cancel a correction: Admit patient, correct admit patient and cancel the correction | STIN, RE_STIN, AN_STIN |
| PF-receive-tec-03 | Messages received in wrong order: Acute ambulant, discharge patient, admit patient. | STAA, SLHJ, STIN |


### FHIR Shorthand Resources
<!-- 
FHIR Shorthand calls currently are the second Thursday of every month at 9 am Eastern US Time. Click here to join(https://teams.microsoft.com/l/meetup-join/19%3ameeting_OGJmYmVlM2UtYzVkZi00YWJjLWJlNzMtN2ZkYTVkYTA1Mzlk%40thread.v2/0?context=%7b%22Tid%22%3a%22c620dc48-1d50-4952-8b39-df4d54d74d82%22%2c%22Oid%22%3a%22f9a60b6f-fbcc-48d0-bc8e-d6d742b4b339%22%7d)

[HL7 Confluence site](https://confluence.hl7.org/display/FHIRI/FHIR+Shorthand)

[FHIR Shorthand Documentation](https://build.fhir.org/ig/HL7/fhir-shorthand) 

[FHIR Shorthand documentation code repository](https://github.com/HL7/fhir-shorthand)

[SUSHI code repository](https://github.com/FHIR/sushi)

[Zulip](https://chat.fhir.org) channel: #shorthand -->