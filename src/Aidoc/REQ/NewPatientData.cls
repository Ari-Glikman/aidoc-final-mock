/// Description
Class Aidoc.REQ.NewPatientData Extends (%Persistent, %JSON.Adaptor, %XML.Adaptor, Ens.Request)
{

/// put fields...
Property FirstName As %String;

Property LastName As %String;

/// should it be string? //change to string...
Property DateOfBirth As %String;

/// needs to be string as can start with 0 
Property TeudatZehut As %String;

Index TeudatZehutIndex On TeudatZehut;

Property PatientClass As %String;

/// I(npatient), O(utpatient), E(mergency), P(readmit)
Property Observation As %String;

Property IDPatientVisit As %String;

Storage Default
{
<Data name="NewPatientDataDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FirstName</Value>
</Value>
<Value name="3">
<Value>LastName</Value>
</Value>
<Value name="4">
<Value>DateOfBirth</Value>
</Value>
<Value name="5">
<Value>TeudatZehut</Value>
</Value>
<Value name="6">
<Value>TimeofMessage</Value>
</Value>
<Value name="7">
<Value>PatientClass</Value>
</Value>
<Value name="8">
<Value>Observation</Value>
</Value>
<Value name="9">
<Value>IDPatientVisit</Value>
</Value>
</Data>
<DataLocation>^Aidoc.REQ.NewPatientDataD</DataLocation>
<DefaultData>NewPatientDataDefaultData</DefaultData>
<IdLocation>^Aidoc.REQ.NewPatientDataD</IdLocation>
<IndexLocation>^Aidoc.REQ.NewPatientDataI</IndexLocation>
<StreamLocation>^Aidoc.REQ.NewPatientDataS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
