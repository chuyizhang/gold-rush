goldrush.out : main.s information.s data.s week.s routine.s
	gcc -no-pie -o goldrush.out main.s information.s data.s week.s routine.s
