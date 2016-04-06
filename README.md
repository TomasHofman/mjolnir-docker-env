# mjolnir-docker-env

Dockerized development environment for [mjolnir](https://github.com/jboss-set/mjolnir).

## Requirements

Provided containers are intended to be run with [docker-compose](<https://docs.docker.com/compose/>) utility. Obviously,
you also need to have [docker](https://www.docker.com) installed.

## Usage

### Starting containers

If you didn't already, clone the repo and then run the containers with:

```
cd path/to/mjolnir-docker-env
docker-compose up -d
```

You can verify that the container are running using `docker-compose ps` - three containers should be listed. Wildfly
should be accessible at <localhost:8080>.

Sometimes docker port linking doesn't work properly, so localhost:8080 is not accessible. In that case
you may need to determine 'wildfly' container IP address and use that address instead of localhost.

### Deploy mjolnir

Compile and deploy mjolnir:

```
cd path/to/mjolnir
mvn clean package wildfly:deploy -Ddev
```

You will get a prompt asking for management user credentials, fill in username "admin" and password "Admin#123".

Now, mjolnir should be available on <https://localhost:8080/mjolnir>.

### Stopping containers

Stop containers with `docker-compose stop`. Eventually, you may delete containers with `docker-compose rm`.

## Description of defined containers

### postgresdb

Provides PostgreSQL database initialized with data necessary to run Mjolnir.

### apacheds

Provides an ApacheDS instance with configured LDAP and Kerberos servers and initialized with some sample users.
This container utilizes a JAR file compiled from
[kerberos-using-apacheds](https://github.com/kwart/kerberos-using-apacheds) repository for creating and configuring
the ApacheDS instance.

### wildfly

Contains Wildfly container with pre-configured PostgreSQL datasource. Currently it does not contain Mjolnir webapp,
so you need to compile and deploy it yourself. Wildfly is listening on usual ports:

 - 8080 for http,
 - 8443 for https,
 - 8787 for remote debugging,
 - 9990 for management.

## TBD

 - Some simulation of GitHub API, so mjolnir doesn't need to connect to a real GitHub API.