extends Enemy


	
func slow_down(time, mult):
	slownessTime = time 
	if mult/2 > slow_effect:
		slow_effect = mult/2
