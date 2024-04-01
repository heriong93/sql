create user team2 identified by team2;

grant connect, resource to team2;
grant create session to team2;
grant create table to team2;
GRANT DBA TO team2;

create user samjo identified by samjo;
grant connect, resource to samjo;
grant create session to samjo;
grant create table to samjo;
GRANT DBA TO samjo;

commit;