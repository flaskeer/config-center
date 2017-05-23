create table app(
 id uuid,
 appId text,
 appName text,
 description text,
 createTime date,
 configurations map<text,text>,
 primary key(id)
 );

 create table user (
   id uuid,
   userId text,
   username text,
   password text,
   role text,
   primary key(id)
   );


   create table userApp(
   id uuid,
   userId text,
   username text,
   appId text,
   keyRole text,
   primary key(id)
   );