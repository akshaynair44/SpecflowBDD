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