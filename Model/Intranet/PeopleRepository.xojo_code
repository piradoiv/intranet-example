#tag Class
Protected Class PeopleRepository
	#tag Method, Flags = &h0
		Sub Constructor()
		  mDatabase = Session.Database
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(database As SQLiteDatabase)
		  mDatabase = database
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Const query = "SELECT COUNT(*) AS counter FROM people"
		  
		  Var rows As RowSet = mDatabase.SelectSQL(query)
		  For Each row As DatabaseRow In rows
		    Return row.Column("counter").IntegerValue
		  Next
		  
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Create(name As String)
		  Const query = "INSERT INTO people (name) VALUES (?)"
		  
		  mDatabase.ExecuteSQL(query, name)
		  
		  App.UpdateSessions
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteById(personId As Integer)
		  Const query = "DELETE FROM people WHERE id = ?"
		  
		  mDatabase.ExecuteSQL(query, personId)
		  
		  App.UpdateSessions
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindPersonById(personId As Integer) As Intranet.Person
		  Const query = "SELECT * FROM people WHERE id = ?"
		  
		  Var rows As RowSet = mDatabase.SelectSQL(query, personId)
		  For Each row As DatabaseRow In rows
		    Var p As New Person
		    p.Id = row.Column("id").IntegerValue
		    p.Name = row.Column("name").StringValue
		    Return p
		  Next
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAll() As Person()
		  Const query = "SELECT * FROM people"
		  
		  Var result() As Person
		  Var rows As RowSet = mDatabase.SelectSQL(query)
		  For Each row As DatabaseRow In rows
		    Var p As New Person
		    p.Id = row.Column("id").IntegerValue
		    p.Name = row.Column("name").StringValue
		    result.Add(p)
		  Next
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update(updatedPerson As Intranet.Person)
		  Const query = "UPDATE people SET name = ? WHERE id = ?"
		  
		  mDatabase.ExecuteSQL(query, updatedPerson.Name, updatedPerson.Id)
		  
		  App.UpdateSessions
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mDatabase As SQLiteDatabase
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
