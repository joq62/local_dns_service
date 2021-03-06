all:
	rm -rf ebin/* src/*~;
	erlc -o ebin src/*.erl;
	erl -pa ebin -s controll start -sname controller

local:
	rm -rf ebin/* src/*~ test_ebin/* test_src/*~;
	erlc -o ebin src/*.erl;
	erlc -o test_ebin test_src/*.erl;
	cp src/*.app ebin;
	erl -pa ebin -pa test_ebin -s local_dns_service_test test -sname local_dns_test

test:
	rm -rf ebin/* src/*~ test_ebin/* test_src/*~;
	erlc -o ebin src/*.erl;
	erlc -o test_ebin test_src/*.erl;
	erl -pa ebin -pa test_ebin -s test_iaas_service test -sname test_iaas_service
