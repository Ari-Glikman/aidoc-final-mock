Class Aidoc.RES.UpdatePatientData Extends (%Persistent, Ens.Request, %JSON.Adaptor) [ ProcedureBlock ]
{

Property Success As %Boolean;

Property ErrorMessage As %VarString;

Storage Default
{
<Data name="UpdatePatientDataDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Success</Value>
</Value>
<Value name="3">
<Value>ErrorMessage</Value>
</Value>
</Data>
<DataLocation>^Aidoc.RES.UpdatePatientDataD</DataLocation>
<DefaultData>UpdatePatientDataDefaultData</DefaultData>
<IdLocation>^Aidoc.RES.UpdatePatientDataD</IdLocation>
<IndexLocation>^Aidoc.RES.UpdatePatientDataI</IndexLocation>
<StreamLocation>^Aidoc.RES.UpdatePatientDataS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
