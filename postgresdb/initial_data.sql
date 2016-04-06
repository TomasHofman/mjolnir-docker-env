insert into application_parameters (param_name, param_value) values ('github.token', '***');
insert into application_parameters (param_name, param_value) values ('github.host', 'localhost');
insert into application_parameters (param_name, param_value) values ('ldap.url', 'ldap://ds');
insert into application_parameters (param_name, param_value) values ('application.reporting_email', 'developer@example.com');

insert into github_orgs (name) values ('some org');

insert into github_teams (org_id, name, github_id) values (currval('sq_github_orgs'), 'some team', 123);
insert into github_teams (org_id, name, github_id) values (currval('sq_github_orgs'), 'some other team', 1234);
