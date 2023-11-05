/*1. Write a PL/SQL program to find the largest of three numbers.*/

declare
	a number;
	b number;
	c number;
begin
	a:=5;
	b:=9;
	c:=13;
	if(a>b and a>c) then
		dbms_output.put_line('a is largest '||a);
	elsif(b>a and b>c) then
		dbms_output.put_line('b is largest '||b);
	else
		dbms_output.put_line('c is largest '||c);
	end if;
end;

/*2. Write a PL/SQL program to generate reverse for given number*/

declare
	a number;
	b number;
	c number;
begin
	a:=1259;
	b:=0;
	c:=a;
	while(c>0)
        loop
        	b:=(b*10)+(mod(c,10));
			c:=trunc(c/10);
		end loop;
	dbms_output.put_line('The reverse of '||a||' is '||b);
end;

/*3. Write a PL/SQL program to find the factorial of a given number*/

declare
	a number(10);
	b number;
begin
	a:=6;
	b:=1;
	if(a=0 or a=1) then
		b:=1;
	else
		while(a>1)
			loop
				b:=b*a;
				a:=(a-1);
			end loop;
	end if;
	dbms_output.put_line('Factorial is : '||b);
end;

/*4. Write a PL/SQL program to check whether given number is prime or not*/

declare
	a number;
	b number;
	counter number;
begin
	a:=15911;
	b:=2;
	counter:=2;
	while(b<a)
	loop
		if(mod(a,b)=0) then
			counter:=counter+1;
		end if;
		b:=b+1;
	end loop;
	if(counter>2) then
		dbms_output.put_line('Given number is not prime!');
	else
		dbms_output.put_line('Given Number is prime!');
	end if;
end;

/*5. Write a PL/SQL program to generate Fibonacci series upto N*/

declare
	a number:=0;
	b number:=1;
	c number;
	n number;
begin
	n:=16;
	dbms_output.put('0,1,');
	while(n>=0)
	loop
		c:=a+b;
		a:=b;
		b:=c;
		n:=n-1;
		dbms_output.put(c||',');
	end loop;
	dbms_output.new_line();
end;

/*6. Write a PL/SQL program for calculating sum of two numbers.*/

declare
	a number:=155;
	b number:=62;
	c number;
begin
	c:=a+b;
	dbms_output.put_line('Sum is '||c);
end;

/*7. Write a PL/SQL program to check the given year is leap year or not*/
declare
	a number(4);
	b number(1);
begin
	a:=1900;
	if(mod(a,400)=0) then
		b:=1;
	else
		if(mod(a,4)=0 and mod(a,100)!=0) then
			b:=1;
		else
			b:=0;
		end if;
	end if;
	if(b=1)then
		dbms_output.put_line('Leap Year');
	else
		dbms_output.put_line('Not Leap Year');
	end if;
end;

/*8. Find the sum of the digits of a given number*/

declare
	a number:=1564;
	b number:=0;
	c number:=a;
begin
	while(c>0)
	loop
		b:=b+(mod(c,10));
		c:=trunc(c/10);
	end loop;
	dbms_output.put_line('Sum of digits of '||a||' is '||b);
end;

/*9. Check the number of vowels and consonants in a given string*/

declare
	a varchar(15):='Hello Everybody';
	v number:=0;
	c number:=0;
	i number;
	ch varchar(1);
begin
	a:=upper(a);
	for i IN 1..length(a) loop
	        ch := substr(a, i, 1);
	        if regexp_like(ch, '[A-Z]') then
	            if ch in ('A', 'E', 'I', 'O', 'U') then
	                v := v + 1;
	            else
	                c := c + 1;
	            end if;
	        end if;
	    end loop;
	dbms_output.put_line('No of vowels: '||v||' and no of consonats: '||c);
end;

/*10. Count odd and even digits in a number*/

declare
	a number:=564132987;
	o number:=0;
	e number:=0;
	v number;
begin
	while(a!=0)
	loop
		v:=mod(a,10);
		if(mod(v,2)=0) then
			e:=e+1;
		else
			o:=o+1;
		end if;
		a:=trunc(a/10);
	end loop;
	dbms_output.put_line('No of even: '||e||' and no of odd: '||o);
end;

/*Q. Explain the concepts of stored procedure and triggers in a database management system.*/
/*Answer: A stored procedure is a precompiled collection of SQL statements that are stored in the database and can be executed as a single unit. Stored procedures can be used to encapsulate complex logic, improve performance, and reduce network traffic. They are also useful for enforcing business rules and data integrity.
A trigger is a database object that is automatically executed when a specific event occurs, such as inserting, updating, or deleting data. Triggers are used to enforce business rules, maintain data integrity, and automate tasks.*/