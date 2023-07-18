/// <br/>Service : UpdatePatientData
Class Aidoc.REQ.UpdatePatientData Extends (%Persistent, Ens.Request, %JSON.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

Property PatientId As %VarString [ Required ];

Property PatientClass As %VarString;

Property PatientDOB As %VarString;

Property PatientFirstName As %VarString;

Property PatientLastName As %VarString;

Property StudyId As %VarString;
U
Property StudyData As %VarString;

Storage Default
{
<Data name="UpdatePatientDataDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PatientId</Value>
</Value>
<Value name="3">
<Value>PatientClass</Value>
</Value>
<Value name="4">
<Value>PatientDOB</Value>
</Value>
<Value name="5">
<Value>PatientFirstName</Value>
</Value>
<Value name="6">
<Value>PatientLastName</Value>
</Value>
<Value name="7">
<Value>StudyId</Value>
</Value>
<Value name="8">
<Value>StudyData</Value>
</Value>
</Data>
<DataLocation>^Aidoc.REQ.UpdatePatientDataD</DataLocation>
<DefaultData>UpdatePatientDataDefaultData</DefaultData>
<IdLocation>^Aidoc.REQ.UpdatePatientDataD</IdLocation>
<IndexLocation>^Aidoc.REQ.UpdatePatientDataI</IndexLocation>
<StreamLocation>^Aidoc.REQ.UpdatePatientDataS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
