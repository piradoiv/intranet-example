#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Function HandleURL(Request As WebRequest, Response As WebResponse) As Boolean
		  Select Case True
		    
		  Case API.Person.CanHandleRequest(Request)
		    // api/v1/people/(:id)
		    Return Api.Person.HandleRequest(Request, Response)
		    
		  Case API.People.CanHandleRequest(Request)
		    // api/v1/people
		    Return Api.People.HandleRequest(Request, Response)
		    
		  End Select
		  
		  Return False
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub DoUpdateSessions()
		  For Each s As Session In Self.Sessions
		    s.Update
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNewDatabase() As SQLiteDatabase
		  Var result As New SQLiteDatabase(SpecialFolder.Resource("database.sqlite"))
		  result.WriteAheadLogging = True
		  result.Connect
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateSessions()
		  // While going through every session works, this code
		  // is being called as a result of a user action, or
		  // after an API call.
		  //
		  // We don't want to block the responses, or call
		  // Session.Update method more than once. That's why
		  // we are just scheduling an update, instead of actually
		  // updating everything at this point.
		  
		  // First, we cancel any scheduled update.
		  Timer.CancelCallLater(WeakAddressOf DoUpdateSessions)
		  
		  // Now we can re-schedule it again.
		  Timer.CallLater(0, WeakAddressOf DoUpdateSessions)
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
