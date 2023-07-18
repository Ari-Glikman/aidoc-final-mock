/// Patient update.
/// Dispatch class defined by RESTSpec in Aidoc.spec
Class Aidoc.disp Extends %CSP.REST [ GeneratedBy = Aidoc.spec.cls, ProcedureBlock ]
{

/// The class containing the RESTSpec which generated this class
Parameter SpecificationClass = "Aidoc.spec";

/// Ignore any writes done directly by the REST method.
Parameter IgnoreWrites = 1;

/// Default the Content-Type for this application.
Parameter CONTENTTYPE = "application/json";

/// By default convert the input stream to Unicode
Parameter CONVERTINPUTSTREAM = 1;

/// The default response charset is utf-8
Parameter CHARSET = "utf-8";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
  <!-- Server availability check -->
  <Route Url="/Hello" Method="get" Call="Hello" />
  <!-- Update Patient Data -->
  <Route Url="/UpdatePatientData" Method="post" Call="UpdatePatientData" />
</Routes>
}

/// Server availability check
ClassMethod Hello() As %Status
{
    Try {
        Do ##class(%REST.Impl).%SetContentType("plain/text")
        If '##class(%REST.Impl).%CheckAccepts("plain/text") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        Set response=##class(Aidoc.impl).Hello()
        Do ##class(Aidoc.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Aidoc.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

/// Update Patient Data
ClassMethod UpdatePatientData() As %Status
{
    Try {
        If $case(%request.ContentType,"application/json":0,:1) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP415UNSUPPORTEDMEDIATYPE,$$$ERROR($$$RESTContentType,%request.ContentType)) Quit
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts)) Quit
        If '$isobject(%request.Content) || (%request.Content.Size=0) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"body")) Quit
        Set pbody=##class(%DynamicAbstractObject).%FromJSON(%request.Content)
        Set response=##class(Aidoc.impl).UpdatePatientData(pbody)
        Do ##class(Aidoc.impl).%WriteResponse(response)
    } Catch (ex) {
        Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("Aidoc.impl","ExposeServerExceptions"))
    }
    Quit $$$OK
}

}
