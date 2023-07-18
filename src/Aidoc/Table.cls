/// Description
Class Aidoc.POC.Table Extends %Persistent
{

Property FirstName As %String;

Property LastName As %String;

Property DateOfBirth As %String;

/// needs to be string as can start with 0 
Property TeudatZehut As %String;

Index TeudatZehutIndex On TeudatZehut [ Unique ];

Property Observation As %String;

Property PatientClass As %String;

Property IDPatientVisit As %String;

Storage Default
{
<Data name="TableDefaultData">
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
<Value>OBXProperty</Value>
</Value>
<Value name="8">
<Value>PV1Property</Value>
</Value>
<Value name="9">
<Value>Observation</Value>
</Value>
<Value name="10">
<Value>PatientClass</Value>
</Value>
<Value name="11">
<Value>IDPatientVisit</Value>
</Value>
</Data>
<DataLocation>^Aidoc.POC.TableD</DataLocation>
<DefaultData>TableDefaultData</DefaultData>
<ExtentSize>4</ExtentSize>
<IdLocation>^Aidoc.POC.TableD</IdLocation>
<IndexLocation>^Aidoc.POC.TableI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="DateOfBirth">
<AverageFieldSize>11.5</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="FirstName">
<AverageFieldSize>9.25</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="LastName">
<AverageFieldSize>11.25</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="Observation">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="PatientClass">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="TeudatZehut">
<AverageFieldSize>5.75</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="TeudatZehutIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^Aidoc.POC.TableS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
