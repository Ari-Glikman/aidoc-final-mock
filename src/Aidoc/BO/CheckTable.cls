Class Aidoc.BO.CheckTable Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method GetPatientFromTable(pRequest As Aidoc.REQ.NewPatientData, Output pResponse As Aidoc.RES.PatientInfo) As %Status
{

    set myquery = "SELECT FirstName, LastName, TeudatZehut, DateOfBirth, Observation, PatientClass, IDPatientVisit FROM Aidoc_POC.""Table"" WHERE TeudatZehut Like ?"
    set tStatement = ##class(%SQL.Statement).%New()
    set qStatus = tStatement.%Prepare(myquery)
    set rset = tStatement.%Execute(pRequest.TeudatZehut) 


     set pResponse = ##class(Aidoc.RES.PatientInfo).%New()
    
    if rset.%Next(){
        set pResponse.FirstName = rset.%Get("FirstName")
        set pResponse.LastName = rset.%Get("LastName")
        set pResponse.TeudatZehut = rset.%Get("TeudatZehut")
        set pResponse.DateOfBirth = rset.%Get("DateOfBirth")
        set pResponse.Observation = rset.%Get("Observation")
        set pResponse.PatientClass = rset.%Get("PatientClass")
        set pResponse.IDPatientVisit = rset.%Get("IDPatientVisit")
    }

    set st = pResponse.%Save()

    return $$$OK
}

/// once post has returned successfully this is called
Method UpdatePatientInTable(pRequest As Aidoc.REQ.UpdatePatientTable, Output pResponse As Aidoc.RES.PatientInfo) As %Status
{
   set myquery = "Insert Or Update Aidoc.""Table"""
                _" (TeudatZehut, FirstName, LastName, DateOfBirth, Observation, PatientClass, IDPatientVisit)" 
                _" VALUES (?, ? , ? , ?, ? , ?, ?)"
    set tStatement = ##class(%SQL.Statement).%New()
    set qStatus = tStatement.%Prepare(myquery)
    set rset = tStatement.%Execute(pRequest.TeudatZehut, pRequest.FirstName, pRequest.LastName, pRequest.DateOfBirth, pRequest.Observation, pRequest.PatientClass, pRequest.IDPatientVisit) 
  set pResponse = ##class(Aidoc.RES.PatientInfo).%New()
  set st = pResponse.%Save()

  return $$$OK
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Aidoc.REQ.NewPatientData">
    <Method>GetPatientFromTable</Method>
  </MapItem>
  <MapItem MessageType="Aidoc.REQ.UpdatePatientTable">
    <Method>UpdatePatientInTable</Method>
  </MapItem>
</MapItems>
}

}
