#tag Class
Protected Class People
	#tag Method, Flags = &h0
		Shared Function CanHandleRequest(request As WebRequest) As Boolean
		  Return request.Path.Compare("api/v1/people", ComparisonOptions.CaseSensitive) = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function Create(request As WebRequest, response As WebResponse) As Boolean
		  Var result As New JSONItem
		  
		  Try
		    #Pragma BreakOnExceptions False
		    Var repository As New Intranet.PeopleRepository(App.GetNewDatabase)
		    Var input As Dictionary = ParseJSON(request.Body)
		    Var name As String = input.Lookup("name", "")
		    
		    repository.Create(name)
		    
		    result.Value("status") = "ok"
		    response.Status = 200
		  Catch e As RuntimeException
		    result.Value("status") = "error"
		    result.Value("message") = "Invalid request"
		    response.Status = 400
		  End Try
		  
		  response.Write(result.ToString)
		  response.MIMEType = "application/json"
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function HandleRequest(request As WebRequest, response As WebResponse) As Boolean
		  Select Case request.Method.Uppercase
		  Case "POST"
		    Return Create(request, response)
		  Case "GET"
		    Return Read(request, response)
		  Case "PUT"
		    #Pragma Warning "TODO: Implement this"
		    // Return Update(request, response)
		  Case "DELETE"
		    #Pragma Warning "TODO: Implement this"
		    // Return Delete(request, response)
		  End Select
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function Read(request As WebRequest, response As WebResponse) As Boolean
		  #Pragma Unused request
		  
		  Var repository As New Intranet.PeopleRepository(App.GetNewDatabase)
		  Var people() As Intranet.Person = repository.GetAll
		  
		  Var result As New JSONItem
		  Var data As New JSONItem
		  result.Value("status") = "ok"
		  
		  For Each person As Intranet.Person In people
		    data.Add(person.ToDictionary)
		  Next
		  
		  If people.Count = 0 Then
		    data = New JSONItem("[]")
		  End If
		  
		  result.Value("data") = data
		  
		  response.Write(result.ToString)
		  response.MIMEType = "application/json"
		  response.Status = 200
		  Return True
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
