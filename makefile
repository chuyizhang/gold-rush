goldrush.out : main.s information.s data.s week.s routine.s event.s art.s
	gcc -no-pie -o goldrush.out main.s information.s data.s week.s routine.s event.s art.s

clean :
	rm goldrush.out
