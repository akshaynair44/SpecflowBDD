Feature: RDS
	Test cases regarding remote disconnect switch

Scenario Outline: Control mode switches for mode 0
	Given Control mode is set to <Mode_A>
	And Read the control state
	And Control state is <State_A>
	And Control mode is set to <Mode_B>
	When Read the control state
	Then Control state should be <State_B>

	Examples:
		| Mode_A | Mode_B | State_A   | State_B   |
		| 0      | 1      | Connected | Connected |
		| 0      | 2      | Connected | Connected |
		| 0      | 3      | Connected | Connected |
		| 0      | 4      | Connected | Connected |
		| 0      | 5      | Connected | Connected |
		| 0      | 6      | Connected | Connected |

Scenario Outline: Control mode switches for mode 1 to 6
	Given Control mode is set to <Mode_A>
	And Read the Control state 
	And Set the control state to <State_A>
	And Control mode is set to <Mode_B>
	When Read the Control state
	Then Control state should be <State_B>

	Examples:
		| Mode_A | Mode_B | State_A                | State_B                |
		| 1      | 0      | Disconnected           | Connected              |
		| 1      | 2      | Ready for Reconnection | Ready for Reconnection |
		| 1      | 3      | Connected              | Connected              |
		| 1      | 4      | Disconnected           | Disconnected           |
		| 1      | 5      | Connected              | Connected              |
		| 1      | 6      | Ready for Reconnection | Ready for Reconnection |
		| 2      | 0      | Disconnected           | Connected              |
		| 2      | 1      | Ready for Reconnection | Ready for Reconnection |
		| 2      | 3      | Connected              | Connected              |
		| 2      | 4      | Disconnected           | Disconnected           |
		| 2      | 5      | Connected              | Connected              |
		| 2      | 6      | Ready for Reconnection | Ready for Reconnection |
		| 3      | 0      | Disconnected           | Connected              |
		| 3      | 1      | Ready for Reconnection | Ready for Reconnection |
		| 3      | 2      | Connected              | Connected              |
		| 3      | 4      | Disconnected           | Disconnected           |
		| 3      | 5      | Connected              | Connected              |
		| 3      | 6      | Ready for Reconnection | Ready for Reconnection |
		| 4      | 0      | Disconnected           | Connected              |
		| 4      | 1      | Ready for Reconnection | Ready for Reconnection |
		| 4      | 2      | Connected              | Connected              |
		| 4      | 3      | Disconnected           | Disconnected           |
		| 4      | 5      | Connected              | Connected              |
		| 4      | 6      | Ready for Reconnection | Ready for Reconnection |
		| 5      | 0      | Disconnected           | Connected              |
		| 5      | 1      | Ready for Reconnection | Ready for Reconnection |
		| 5      | 2      | Connected              | Connected              |
		| 5      | 3      | Disconnected           | Disconnected           |
		| 5      | 4      | Connected              | Connected              |
		| 5      | 6      | Ready for Reconnection | Ready for Reconnection |
		| 6      | 0      | Disconnected           | Connected              |
		| 6      | 1      | Ready for Reconnection | Ready for Reconnection |
		| 6      | 2      | Connected              | Connected              |
		| 6      | 3      | Disconnected           | Disconnected           |
		| 6      | 4      | Connected              | Connected              |
		| 6      | 5      | Ready for Reconnection | Ready for Reconnection |

Scenario: Remote Disconnect_Verify Remote disconnect/reconnect with control mode 2 for disconnection operation.
	Given The Meter is powered on
	And Read the Control state of the meter using obis code ""
	And Set the Control mode to "2"
	And Perform remote_diconnect using obis code ""
	And Read the Control state of the meter using obis code ""
	And Control state should be "Disonnected"
	And Perform remote_reconnect using obis code ""
	When Read the Control state of the meter using obis code ""
	Then Control state should be "Connected"

Scenario Outline: Remote Disconnect_Verify manual disconnect/reconnect with control mode 2 for disconnection operation.
	Given The Meter is powered on
	And Read the Control state of the meter using obis code ""
	And Set the Control mode to "2"
	And Perform remote_diconnect using obis code ""
	And Check the control state, it should be "Disconnected"
	And Perform remote_reconnect using obis code ""
	And Check the control state, it should be "Connected"
	And Perform manual_disconnect 
	And Read the Control state using obis code ""
	And The control state should be "Ready for Reconnection"
	And Perform manual_reconnect
	When read the control state using obis code ""
	Then Control state should be "Connected"

Scenario Outline: Remote Disconnect_Verify local disconnect/reconnect with control mode 2 for disconnection operation.
	Given The Meter is powered on
	And Read the Control state of the meter using obis code ""
	And Set the Control mode to "2"
	And Perform remote_diconnect using obis code ""
	And Check the control state, it should be "Disconnected"
	And Perform remote_reconnect using obis code ""
	And Check the control state, it should be "Connected"
	And Perform local_disconnect using obis code ""
	When Read the control state using obis code ""
	Then Control state should be "Ready for Reconnection"

Scenario Outline: Remote Disconnect_Verify Remote disconnect/reconnect with control mode 3 for disconnection operation.
	Given The Meter is powered on
	And Read the Control state of the meter using obis code ""
	And Set the Control mode to "3"
	And Perform remote_diconnect using obis code ""
	And Check the control state, it should be "Disconnected"
	And Perform remote_reconnect using obis code ""
	And Check the control state, it should be "Ready for Reconnection"
	And Perform remote_disconnect using obis code ""
	When Read the control state using obis code ""
	Then Control state should be "Disconnected"

Scenario Outline: Remote Disconnect_Verify manual disconnect/reconnect with control mode 3 for disconnection operation.
	Given The Meter is powered on
	And Read the Control state of the meter using obis code ""
	And Set the Control mode to "3"
	And Perform remote_diconnect using obis code ""
	And Check the control state, it should be "Disconnected"
	And Perform remote_reconnect using obis code ""
	And Check the control state, it should be "Ready for Reconnection"
	And Perform manual_reconnect 
	When Read the control state using obis code ""
	Then Control state should be "Connected"

Scenario Outline: Remote Disconnect_Verify local disconnect/reconnect with control mode 3 for disconnection operation.
	Given The Meter is powered on
	And Read the Control state of the meter using obis code ""
	And Set the Control mode to "3"
	And Perform remote_diconnect using obis code ""
	And Check the control state, it should be "Disconnected"
	And Perform remote_reconnect using obis code ""
	And Check the control state, it should be "Ready for Reconnection"
	And Perform manual_reconnect 
	And Read the control state using obis code ""
	And Control state should be "Connected"
	And Perform local_diconnect
	When Read the control state using obis code ""
	Then Control state should be "Ready for Reconnection"

Scenario Outline: Remote Disconnect_Verify Remote disconnect/reconnect with control mode 6 for disconnection operation.
	Given The Meter is powered on
	And Read the Control state of the meter using obis code ""
	And Set the Control mode to "3"
	And Perform remote_diconnect using obis code ""
	And Check the control state, it should be "Disconnected"
	And Perform remote_reconnect using obis code ""
	And Check the control state, it should be "Ready for Reconnection"
	And Perform remote_disconnect 
	When Read the control state using obis code ""
	Then Control state should be "Disconnected"
	
Scenario Outline: Remote Disconnect_Verify manual disconnect/reconnect with control mode 6 for disconnection operation.
	Given The Meter is powered on
	And Read the Control state of the meter using obis code ""
	And Set the Control mode to "3"
	And Perform remote_diconnect using obis code ""
	And Check the control state, it should be "Disconnected"
	And Perform remote_reconnect using obis code ""
	And Check the control state, it should be "Ready for Reconnection"
	And Perform manual_reconnect 
	When Read the control state using obis code ""
	Then Control state should be "Connected"

Scenario Outline: Remote Disconnect_Verify local disconnect/reconnect with control mode 6 for disconnection operation.
	Given The Meter is powered on
	And Read the Control state of the meter using obis code ""
	And Set the Control mode to "3"
	And Perform remote_diconnect using obis code ""
	And Check the control state, it should be "Disconnected"
	And Perform remote_reconnect using obis code ""
	And Check the control state, it should be "Ready for Reconnection"
	And Perform local_reconnect 
	And Read the control state using obis code ""
	And Control state should be "Connected"
	And Perform local_disconnect 
	When Read the control state using obis code ""
	Then Control state should be "Ready for Reconnection"




