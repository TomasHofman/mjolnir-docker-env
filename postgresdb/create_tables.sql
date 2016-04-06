create sequence sq_github_orgs;

create table github_orgs (
    id bigint default nextval('sq_github_orgs') primary key,
    name varchar(255) unique
);

create sequence sq_github_teams;

create table github_teams (
    id bigint default nextval('sq_github_teams') primary key,
    org_id bigint not null,
    name varchar(255),
    github_id bigint unique,
    constraint fk_github_teams_org_id foreign key (org_id) references github_orgs (id)
);

create sequence sq_users;

create table users (
    id bigint default nextval('sq_users') primary key,
    krb_name varchar(255) unique,
    github_name varchar(255) unique,
    admin boolean not null default false,
    whitelisted boolean not null default false
);

create table application_parameters (
    param_name varchar(255) primary key,
    param_value varchar(255)
);