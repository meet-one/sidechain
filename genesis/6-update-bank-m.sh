cleos set account permission bank.m transfer '{"threshold":1,"keys":[{"key":"EOS7Z5ck4434RWJWzpBtZvskM2xfckqRZvpFbJoPMedrb91XsGqxj","weight":1}]}' "active" -p bank.m@active
cleos set action permission bank.m bank.m synctransfer transfer
cleos set action permission bank.m bank.m setglobal transfer


cleos set account permission bank.m sync '{"threshold":1,"keys":[{"key":"EOS7Z5ck4434RWJWzpBtZvskM2xfckqRZvpFbJoPMedrb91XsGqxj","weight":1}]}' "active" -p bank.m@active
cleos set action permission bank.m bank.m synchrobook sync
cleos set action permission bank.m bank.m setglobal sync