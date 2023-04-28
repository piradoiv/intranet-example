#tag Class
Protected Class MainWebToolbar
Inherits WebToolbar
	#tag Event
		Sub Opening()
		  Var iconColor As Color = Color.White
		  
		  Var dashboardButton As New WebToolbarButton("Dashboard")
		  dashboardButton.Tag = "dashboard"
		  dashboardButton.Icon = WebPicture.BootstrapIcon("house", iconColor)
		  AddItem(dashboardButton)
		  
		  Var peopleButton As New WebToolbarButton("People")
		  peopleButton.Tag = "people"
		  peopleButton.Icon = WebPicture.BootstrapIcon("person-circle", iconColor)
		  AddItem(peopleButton)
		  
		  Var flexibleSpace As New WebToolbarButton
		  flexibleSpace.Style = WebToolbarButton.ButtonStyles.FlexibleSpace
		  AddItem(flexibleSpace)
		  
		  Var logoutButton As New WebToolbarButton("Logout")
		  logoutButton.Tag = "logout"
		  logoutButton.Icon = WebPicture.BootstrapIcon("box-arrow-right", iconColor)
		  AddItem(logoutButton)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Pressed(Item as WebToolbarButton)
		  Select Case Item.Tag
		  Case "dashboard"
		    If Session.CurrentPage IsA DashboardWebPage Then Return
		    Session.CurrentPage.Close
		    DashboardWebPage.Show
		  Case "people"
		    If Session.CurrentPage IsA PeopleWebPage Then Return
		    Session.CurrentPage.Close
		    PeopleWebPage.Show
		  Case "logout"
		    Session.Quit
		    GoToURL("/")
		  End Select
		End Sub
	#tag EndEvent

	#tag Event
		Sub TitlePressed()
		  If Session.CurrentPage IsA DashboardWebPage Then Return
		  
		  Session.CurrentPage.Close
		  DashboardWebPage.Show
		End Sub
	#tag EndEvent


	#tag Note, Name = Read me
		This subclass overrides defaults using the "Inspector Behavior".
		
	#tag EndNote


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
		#tag ViewProperty
			Name="_mPanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ControlID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Behavior"
			InitialValue="56"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockHorizontal"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockVertical"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Behavior"
			InitialValue="600"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Indicator"
			Visible=true
			Group="Visual Controls"
			InitialValue="3"
			Type="WebUIControl.Indicators"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Primary"
				"2 - Secondary"
				"3 - Success"
				"4 - Danger"
				"5 - Warning"
				"6 - Info"
				"7 - Light"
				"8 - Dark"
				"9 - Link"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Visual Controls"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Visible=true
			Group="Toolbar"
			InitialValue="Intranet"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FullWidth"
			Visible=true
			Group="Toolbar"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Position"
			Visible=true
			Group="Toolbar"
			InitialValue="1"
			Type="WebToolbar.Positions"
			EditorType="Enum"
			#tag EnumValues
				"0 - Inset"
				"1 - Top"
				"2 - Bottom"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
