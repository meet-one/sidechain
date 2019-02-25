# 6. update bank.m permission

cleos set account permission bank.m transfer '{"threshold":1,"keys":[{"key":"EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9","weight":1}]}' "active" -p bank.m@active
cleos set action permission bank.m bank.m synctransfer transfer
cleos set action permission bank.m bank.m setglobal transfer


cleos set account permission bank.m sync '{"threshold":1,"keys":[{"key":"EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9","weight":1}]}' "active" -p bank.m@active
cleos set action permission bank.m bank.m synchrobook sync
cleos set action permission bank.m bank.m setglobal sync