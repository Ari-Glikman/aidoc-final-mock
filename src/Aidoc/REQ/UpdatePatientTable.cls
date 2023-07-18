Class Aidoc.REQ.UpdatePatientTable Extends (%Persistent, %JSON.Adaptor, %XML.Adaptor, Ens.Request)
{

Property FirstName As %String;

Property LastName As %String;

Property DateOfBirth As %String;

Property TeudatZehut As %String;

Index TeudatZehutIndex On TeudatZehut;

Property Observation As %String;

Property PatientClass As %String;

Property IDPatientVisit As %String;

Storage Default
{
<Data name="UpdatePatientTableDefaultData">
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
<Value>Observation</Value>
</Value>
<Value name="7">
<Value>PatientClass</Value>
</Value>
<Value name="8">
<Value>IDPatientVisit</Value>
</Value>
</Data>
<DataLocation>^Aidoc.REQ.UpdatePatientTableD</DataLocation>
<DefaultData>UpdatePatientTableDefaultData</DefaultData>
<IdLocation>^Aidoc.REQ.UpdatePatientTableD</IdLocation>
<IndexLocation>^Aidoc.REQ.UpdatePatientTableI</IndexLocation>
<StreamLocation>^Aidoc.REQ.UpdatePatientTableS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
