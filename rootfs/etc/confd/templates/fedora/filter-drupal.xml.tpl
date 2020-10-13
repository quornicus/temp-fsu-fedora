<?xml version="1.0" encoding="UTF-8"?>
<FilterDrupal_Connection>
  <connection server="{{getv "/db/endpoint"}}" port="3306" dbname="{{getv "/drupal/db"}}" user="{{getv "/drupal/db/user"}}" password="{{getv "/drupal/db/pass"}}">
  <sql>
     SELECT DISTINCT u.uid AS userid, u.name AS Name, u.pass AS Pass,r.name AS Role FROM (users u LEFT JOIN users_roles ON u.uid=users_roles.uid) LEFT JOIN role r ON r.rid=users_roles.rid WHERE u.name=? AND u.pass=?;
  </sql>
  </connection>
</FilterDrupal_Connection>
