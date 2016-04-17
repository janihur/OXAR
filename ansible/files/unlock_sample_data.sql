whenever oserror exit 1
whenever sqlerror exit sql.sqlcode

set verify off

define p_password = '&1'

alter user hr account unlock;
alter user hr identified by &p_password;

exit
