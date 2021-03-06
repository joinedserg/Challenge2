DROP TABLE users CASCADE;
DROP TABLE UserConnection CASCADE;
DROP TABLE UserProfile CASCADE;
DROP TABLE Users CASCADE;

create table UserConnection (
  userId varchar(255) not null,
  providerId varchar(255) not null,
  providerUserId varchar(255),
  rank int not null,
  displayName varchar(255),
  profileUrl varchar(512),
  imageUrl varchar(512),
  accessToken varchar(1024) not null,
  secret varchar(255),
  refreshToken varchar(255),
  expireTime bigint,
  primary key (userId, providerId, providerUserId));
create unique index UserConnectionRank on UserConnection(userId, providerId, rank);

create table UserProfile (
  userId varchar(255) not null,
  email varchar(255),
  firstName varchar(255),
  lastName varchar(255),
  city varchar(255),
  name  varchar(255),
  username varchar(255),
  userEntityId int,
  constraint fk_userprofile_entities foreign key(userEntityId) references entities(entity_id),
  primary key (userId));
create unique index UserProfilePK on UserProfile(userId);

create table Data (
  userId varchar(255) not null,
  data varchar(1024),
  primary key (userId));
create unique index DataPK on Data(userId);

create table relationship (
  entity_id1 int not null,
   entity_id2 int not null,
  primary key (entity_id1,entity_id2));

create table users(
      username varchar(50) not null primary key,
      password varchar(50) not null,
      enabled boolean not null);

create table authorities (
    username varchar(50) not null,
    authority varchar(50) not null,
    constraint fk_authorities_users foreign key(username) references users(username));
    create unique index ix_auth_username on authorities (username,authority);


create sequence serial start 1;
