goldrush.out : main.s information.s data.s week.s routine.s event.s
	gcc -no-pie -o goldrush.out main.s information.s data.s week.s routine.s event.s

clean :
	rm goldrush.out
