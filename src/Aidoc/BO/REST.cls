Class Aidoc.BO.REST Extends EnsLib.REST.Operation [ ProcedureBlock ]
{

/// This operation allows you to check if you have acces to Ensemble. <br> - <b>Operate it only in develeopment!</b><br> - It can be operated from a browser as well. <br> - It should show you the IP you are connected from
Method GETHello(pRequest As Aidoc.REQ.Hello, pResponse As Aidoc.RES.UpdatePatientData) As %Status
{
	Set tStatus = $$$OK
	#dim Err as %Exception.AbstractException
	set pResponse=##class(Aidoc.RES.UpdatePatientData).%New()
	try {
		set pURL 						= ..Adapter.URL_"/Hello"
		set pHttpRequestIn				= ##class(%Net.HttpRequest).%New()
		Set pHttpRequestIn.ContentType 	= "application/json"

		set tStatus=..Adapter.SendFormDataArray(.pHttpResponse, "get", pHttpRequestIn , , , pURL)
		if $$$ISERR(tStatus) {
			set pResponse.Success=0
			set pResponse.ErrorMessage=$system.Status.GetErrorText(tStatus)
			quit
		}		
		If $Isobject(pHttpResponse) {
			if pHttpResponse.StatusCode'=200 {
				set pResponse.Success=0
				set pResponse.ErrorMessage="Status code "_pHttpResponse.StatusCode
				quit
			}
			set pResponse.ErrorMessage=pHttpResponse.Data.Read()
		}
	}
	catch Err {
		set tStatus=Err.AsStatus()
		set pResponse.Success=0
		set pResponse.ErrorMessage=$system.Status.GetErrorText(tStatus)
	}
	Return tStatus
}

/// This method updates the patient data - extracted from HL7 messages
Method POSTUpdatePatientData(pRequest As Aidoc.REQ.UpdatePatientData, pResponse As Aidoc.RES.UpdatePatientData) As %Status
{
	Set tStatus = $$$OK
	#dim Err as %Exception.AbstractException
	#dim pHttpResponse as %Net.HttpResponse
	set pResponse=##class(Aidoc.RES.UpdatePatientData).%New()
	try {
		set pURL 						= ..Adapter.URL_"/UpdatePatientData"
		set pHttpRequestIn				= ##class(%Net.HttpRequest).%New()
		Set pHttpRequestIn.ContentType 	= "application/json"
		
		do pRequest.%JSONExportToStream(pHttpRequestIn.EntityBody)
		set tStatus=..Adapter.SendFormDataArray(.pHttpResponse, "post", pHttpRequestIn , , , pURL)
		if $$$ISERR(tStatus) {
			set pResponse.Success=0
			set pResponse.ErrorMessage=$system.Status.GetErrorText(tStatus)
			quit
		}		
		If $Isobject(pHttpResponse) {
			if pHttpResponse.StatusCode'=200 {
				set pResponse.Success=0
				set pResponse.ErrorMessage="Status code "_pHttpResponse.StatusCode
				quit
			}
			do pResponse.%JSONImport(pHttpResponse.Data)
		}
		
	}
	catch Err {
		set tStatus=Err.AsStatus()
		set pResponse.Success=0
		set pResponse.ErrorMessage=$system.Status.GetErrorText(tStatus)
	}
	Return tStatus
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Aidoc.REQ.Hello">
		<Method>GETHello</Method>
	</MapItem>
	<MapItem MessageType="Aidoc.REQ.UpdatePatientData">
		<Method>POSTUpdatePatientData</Method>
	</MapItem>
</MapItems>
}

}
