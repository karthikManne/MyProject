<?xml version="1.0" encoding="UTF-8"?>
<TestCase name="loginTom" version="5">

<meta>
   <create author="kmanne" buildNumber="8.2.0.244" date="02/08/2017" host="LNAR-PB3YHMZ" version="8.2.0"/>
   <lastEdited author="kmanne" buildNumber="8.2.0.244" date="02/22/2017" host="LNAR-PB3YHMZ" version="8.2.0"/>
</meta>

<id>557774BEE6311E68C834AE520524153</id>
<Documentation>Put documentation of the Test Case here.</Documentation>
<IsInProject>true</IsInProject>
<sig>ZWQ9NSZ0Y3Y9NSZsaXNhdj04LjIuMCAoOC4yLjAuMjQ0KSZub2Rlcz0tMjA4Njc3NjYxNg==</sig>
<subprocess>false</subprocess>

<initState>
</initState>

<resultState>
</resultState>

<deletedProps>
</deletedProps>

    <Node log="" name="Execute the Test" next="Subprocess Environment_Selection" quiet="true" think="500-1S" type="com.itko.lisa.test.NoTransNode" uid="F7866929EEF811E6849B503E20524153" useFilters="true" version="1"> 


      <!-- Filters -->
      <Filter type="com.itko.lisa.test.TimeStampFilter">
        <valueToFilterKey>lisa.Execute the Test.rsp</valueToFilterKey>
<pre>true</pre>
<post>false</post>
<datePattern>WSDL DATE</datePattern>
<preprop>timeval</preprop>
<postprop/>
<Offset>1h</Offset>
      </Filter>

      <Filter type="com.itko.lisa.test.TimeStampFilter">
        <valueToFilterKey>lisa.Execute the Test.rsp</valueToFilterKey>
<pre>true</pre>
<post>false</post>
<datePattern>WSDL DATETIME (SAML)</datePattern>
<preprop>timevalTZ</preprop>
<postprop/>
<Offset>0</Offset>
      </Filter>


      <!-- Data Sets -->
<readrec>Read Specific rows from Excel</readrec>

      <!-- Assertions -->
<CheckResult assertTrue="false" name="CustomListener" type="com.itko.lisa.test.AssertByScript">
<log>Assertion name: CustomListener checks for: false  is of type: Assert by Script Execution.</log>
<then>continue</then>
<valueToAssertKey/>
        <script>import com.itko.lisa.test.*;&#xd;
import java.text.*;&#xd;
&#xd;
testExec.setStateValue("AssertMessage",""); &#xd;
TestEventListener custom_listener = new com.itko.lisa.test.TestEventListener()&#xd;
{&#xd;
public void testEvent(com.itko.lisa.test.TestEvent testevent)&#xd;
    {&#xd;
if(testevent.getEventId() == com.itko.lisa.test.TestEvent.EVENT_TRANSFAILED)&#xd;
        { &#xd;
testExec.setStateValue("AssertMessage",testevent.getLongDesc()); &#xd;
}&#xd;
}&#xd;
};&#xd;
&#xd;
testExec.setStateValue("Custom_Listener",custom_listener); &#xd;
testExec.getTestEventMgr().addListener(custom_listener,com.itko.lisa.test.TestEvent.noFilter); &#xd;
return true;&#xd;
</script>
        <language>BeanShell</language>
        <copyprops>TestExecPropsAndSystemProps</copyprops>
</CheckResult>

<CheckResult assertTrue="false" name="Check if test case execution required." type="com.itko.lisa.test.CheckResultPropRegEx">
<log>TC_Execute</log>
<then>Execute the Test</then>
<valueToAssertKey/>
        <prop>TC_EXECUTE</prop>
        <param>Yes</param>
</CheckResult>

    </Node>


    <Node log="" name="Subprocess Environment_Selection" next="Login" quiet="true" think="0H" type="com.itko.lisa.utils.ExecSubProcessNode" uid="E2F24272EEFE11E6849B503E20524153" useFilters="true" version="1"> 

<Subprocess>{{LISA_RELATIVE_PROJ_ROOT}}/Tests/Subprocesses/Environment_Selection.tst</Subprocess>
<fullyParseProps>false</fullyParseProps>
<sendCommonState>false</sendCommonState>
<getCommonState>false</getCommonState>
<onAbort>abort</onAbort>
<Parameters>
    <Parameter>
    <key>EnvironmentTested</key>
    <value>{{EnvironmentTested}}</value>
    <name>Environment Selected</name>
    </Parameter>
</Parameters>
<SaveProps>
<save>BASEPATH</save>
<save>HOST</save>
<save>PASSWORD</save>
<save>USERNAME</save>
</SaveProps>
    </Node>


    <Node log="" name="Login" next="Write Results to File" quiet="true" think="500-1S" type="com.itko.lisa.ws.rest.RESTNode" uid="C72A6A0BEF0111E6849B503E20524153" useFilters="true" version="3"> 


      <!-- Assertions -->
<CheckResult assertTrue="false" name="Scripted Assertion" type="com.itko.lisa.test.AssertByScript">
<log>Assertion name: Scripted Assertion checks for: true is of type: Assert by Script Execution.</log>
<then>continue</then>
<valueToAssertKey/>
        <script>import com.itko.lisa.test.TestEvent;&#xd;
import java.text.*;&#xd;
&#xd;
if(testExec.getStateValue("AssertMessage").equals(""))&#xd;
{&#xd;
testExec.setStateValue("Test_Execution_Status", "Passed");&#xd;
testExec.setStateValue("Timing Log Location", testExec.getStateValue("Log Location"));&#xd;
testExec.setStateValue("Unique BODID", testExec.getStateValue("BODID"));&#xd;
if(testExec.getStateValue("Test_Script_Status")!= "Failed")&#xd;
{&#xd;
testExec.setStateValue("Test_Script_Status", "Passed");&#xd;
 }   &#xd;
}&#xd;
else&#xd;
{&#xd;
testExec.setStateValue("Test_Execution_Status", "Failed");&#xd;
testExec.setStateValue("Timing Log Location", testExec.getStateValue("Log Location"));&#xd;
testExec.setStateValue("Unique BODID", testExec.getStateValue("BODID"));  &#xd;
testExec.setStateValue("Test_Script_Status", "Failed");&#xd;
  //  testExec.raiseEvent(TestEvent.EVENT_TRANSFAILED,"XML Comparison","Test_Execution_XML_Comparision FAILED");&#xd;
}&#xd;
&#xd;
return true;&#xd;
</script>
        <language>BeanShell</language>
        <copyprops>TestExecPropsAndSystemProps</copyprops>
</CheckResult>

<url>https://{{HOST}}/{{BASEPATH}}/store/10551/guestidentity</url>
<content-type/>
<data-type>text</data-type>
      <header field="user" value="{{USERNAME}}"/>
      <header field="password" value="{{PASSWORD}}"/>
<httpMethod>POST</httpMethod>
<onError>abort</onError>
    </Node>


    <Node log="" name="Write Results to File" next="Logout" quiet="true" think="500-1S" type="com.itko.lisa.utils.WritePropsNode" uid="79EB21DACED411E6B0120021CCD0244D" useFilters="true" version="1"> 

<file>{{LISA_PROJ_ROOT}}/Data/OutputFiles/{{LISA_PROJ_NAME}}_{{testCase}}.csv</file>
<encoding>DEFAULT</encoding>
<props>
    <Parameter>
    <key>TestCase_Name</key>
    <value>{{LISA_LAST_STEP}}</value>
    </Parameter>
    <Parameter>
    <key>Status</key>
    <value> {{Test_Execution_Status}}</value>
    </Parameter>
    <Parameter>
    <key>Remarks</key>
    <value>{{AssertMessage}}</value>
    </Parameter>
    <Parameter>
    <key>ExecutionDate</key>
    <value>{{timevalTZ}}</value>
    </Parameter>
    <Parameter>
    <key>Response Code</key>
    <value>{{lisa.Login.http.responseCode}}</value>
    </Parameter>
    <Parameter>
    <key>Response Time</key>
    <value>{{lisa.Login.rsp.time}}</value>
    </Parameter>
    <Parameter>
    <key>Response</key>
    <value>{{LASTRESPONSE}}</value>
    </Parameter>
</props>
    </Node>


    <Node log="" name="Logout" next="end" quiet="false" think="500-1S" type="com.itko.lisa.ws.rest.RESTNode" uid="FF3EA8CCF22F11E6858FAEC920524153" useFilters="true" version="3"> 

<url>https://{{HOST}}/{{BASEPATH}}/store/10551/guestidentity/@self</url>
<content-type/>
<data-type>text</data-type>
<httpMethod>DELETE</httpMethod>
<onError>fail</onError>
    </Node>


    <Node log="" name="abort" next="" quiet="true" think="0h" type="com.itko.lisa.test.AbortStep" uid="557774DEE6311E68C834AE520524153" useFilters="true" version="1"> 

    </Node>


    <Node log="" name="fail" next="abort" quiet="true" think="0h" type="com.itko.lisa.test.Abend" uid="557774FEE6311E68C834AE520524153" useFilters="true" version="1"> 

    </Node>


    <Node log="" name="end" next="fail" quiet="true" think="0h" type="com.itko.lisa.test.NormalEnd" uid="5577751EE6311E68C834AE520524153" useFilters="true" version="1"> 

    </Node>


    <DataSet atend="end" local="true" maxItemsToFetch="0" name="Read Specific rows from Excel" random="false" type="custom.dataset.ExcelDataFile">
<sample>rO0ABXNyABFqYXZhLnV0aWwuSGFzaE1hcAUH2sHDFmDRAwACRgAKbG9hZEZhY3RvckkACXRocmVzaG9sZHhwP0AAAAAAAAx3CAAAABAAAAAHdAAJVGVzdFNldElkdAAGNDEwMDc2dAAkUmVhZCBTcGVjaWZpYyByb3dzIGZyb20gRXhjZWxfUm93TnVtdAABMXQACFRlc3RDYXNldAAFbG9naW50AARTLk5PdAABMXQABlRlc3RJZHQABzQxNTA1Nzd0AApUQ19FWEVDVVRFdAADWWVzdAARRW52aXJvbm1lbnRUZXN0ZWR0AAZkbGFiMDN4</sample>
    <location>{{LISA_RELATIVE_PROJ_ROOT}}/Data/TomServices.xlsx</location>
    <sheetname>Sheet1</sheetname>
    <sRow>1</sRow>
    <eRow>2</eRow>
    </DataSet>

</TestCase>