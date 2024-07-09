use jwdb;

INSERT INTO dir_user (id, username, password, firstName, lastName, email, active, timeZone, locale) 
VALUES ('000001', '000001', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'admin', 'dadan.setiadi@itasoft.co.id', 1, '7','');

INSERT INTO dir_user_role (roleId, userId)
VALUES ('ROLE_ADMIN','000001');
