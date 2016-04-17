whenever oserror exit 1
whenever sqlerror exit sql.sqlcode

alter database default tablespace users;
alter profile default limit password_life_time unlimited;

exit
