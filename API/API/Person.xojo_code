#tag Class
Protected Class Person
	#tag Method, Flags = &h0
		Shared Function CanHandleRequest(request As WebRequest) As Boolean
		  If RouteRegex = Nil Then
		    RouteRegex = New RegEx
		    RouteRegex.SearchPattern = "^api/v1/people/\d+$"
		    RouteRegex.Options.CaseSensitive = True
		  End If
		  
		  Var matches As RegExMatch = RouteRegex.Search(request.Path)
		  
		  Return matches <> Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function HandleRequest(request As WebRequest, response As WebResponse) As Boolean
		  Var personId As Integer = request.Path.NthField("/", 4).Val
		  
		  Select Case request.Method.Uppercase
		  Case "POST"
		    // Create must not be supported on individual items.
		    Return False
		  Case "GET"
		    Return Read(request, response, personId)
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
		Private Shared Function Read(request As WebRequest, response As WebResponse, personId As Integer) As Boolean
		  #Pragma Unused request
		  
		  Var repository As New Intranet.PeopleRepository(App.GetNewDatabase)
		  Var person As Intranet.Person = repository.FindPersonById(personId)
		  
		  Var result As New JSONItem
		  
		  If person = Nil Then
		    result.Value("status") = "error"
		    result.Value("message") = "Can't find a person with the specified ID."
		    response.Status = 404
		  Else
		    result.Value("status") = "ok"
		    result.Value("data") = person.ToDictionary
		    response.Status = 200
		  End If
		  
		  response.Write(result.ToString)
		  response.MIMEType = "application/json"
		  
		  Return True
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared RouteRegex As RegEx
	#tag EndProperty


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
