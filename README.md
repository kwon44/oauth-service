使用Spring Security來實作OAuth 2認證授權
---
oauth2 service主要針對oauth2請求，產生accessToken把角色（authorities）權限（scope）放入，當resource service接受請求會先  
驗證accessToken，驗證通過後才會進到method，method部份可以使用spring security annotation進行更細部的管控。　　

Docker環境初使化
---
####Redis  
```
sudo docker pull redis  
sudo docker run -p 6379:6379 --name myredis -d redis redis-server  
sudo docker exec -it myredis redis-cli
```
####Database
```
docker pull mysql
docker run -p 3306:3306 --name dbmysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql
sudo docker exec -it dbmysql bash
mysql -h 127.0.0.1 -u root -p
```
####初使化DB
1. 建立db:demo_account
2. 執行project initialize package裡的sql  

測試  
---
####前置作業
1. redis與db初使化完成
2. 啟動eurekaserver
3. 使用postman或其它client工具發送請求
####Resource Owner Password Credentials Grant Flow （使用者的帳號密碼）
取得token（Basic Auth：beclient/123456）
````
curl -X POST \
  'http://localhost:8888/oauth/token?username=admin123&password=a123456&grant_type=password' \
  -H 'Accept: */*' \
  -H 'Authorization: Basic YmVjbGllbnQ6MTIzNDU2' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Host: localhost:8888' \
  -H 'User-Agent: PostmanRuntime/7.13.0' \
  -H 'accept-encoding: gzip, deflate' \
  -H 'cache-control: no-cache' \
  -H 'content-length: ' \
  -H 'cookie: JSESSIONID=58724C454EED0C3FEA6718D6F5B01024' \
  -b JSESSIONID=58724C454EED0C3FEA6718D6F5B01024
````
驗證token
````
curl -X POST \
  http://localhost:8888/oauth/check_token \
  -H 'Accept: */*' \
  -H 'Authorization: Basic YmVjbGllbnQ6MTIzNDU2' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Host: localhost:8888' \
  -H 'User-Agent: PostmanRuntime/7.13.0' \
  -H 'accept-encoding: gzip, deflate' \
  -H 'cache-control: no-cache' \
  -H 'content-length: 42' \
  -H 'cookie: JSESSIONID=58724C454EED0C3FEA6718D6F5B01024' \
  -b JSESSIONID=58724C454EED0C3FEA6718D6F5B01024 \
  -d token=8472b699-1a4f-4609-a8e7-1878ee20ad5d
````
更新token
````
curl -X POST \
  'http://localhost:8888/oauth/token?grant_type=refresh_token&refresh_token=2d28039c-80ec-4860-a002-cf1bfe724fd7' \
  -H 'Accept: */*' \
  -H 'Authorization: Basic YmVjbGllbnQ6MTIzNDU2' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Host: localhost:8888' \
  -H 'User-Agent: PostmanRuntime/7.13.0' \
  -H 'accept-encoding: gzip, deflate' \
  -H 'cache-control: no-cache' \
  -H 'content-length: ' \
  -H 'cookie: JSESSIONID=58724C454EED0C3FEA6718D6F5B01024' \
  -b JSESSIONID=58724C454EED0C3FEA6718D6F5B01024
````  
####Client Credentials Grant Flow （Client 的帳號密碼）  
取得token
````
curl -X POST \
  'http://localhost:8888/oauth/token?grant_type=client_credentials&scope=infomessage.2c.marquee.read%20infomessage.2c.marquee.create' \
  -H 'Accept: */*' \
  -H 'Authorization: Basic bWVzc2FnZWNsaWVudDoxMjM0NTY=' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Host: localhost:8888' \
  -H 'User-Agent: PostmanRuntime/7.13.0' \
  -H 'accept-encoding: gzip, deflate' \
  -H 'cache-control: no-cache' \
  -H 'content-length: ' \
  -H 'cookie: JSESSIONID=58724C454EED0C3FEA6718D6F5B01024' \
  -b JSESSIONID=58724C454EED0C3FEA6718D6F5B01024
````
實作
---
  1.BeClientDetailsService可動態配置client資訊  
  2.BeTokenService調整createAccessToken可動態放入權限(scope)  
  3.BeUserService可動態放入角色(authorities)  
  4.~~CustomTokenEnhancer可增加token新的屬性~~  
  5.~~UniqueAuthenticationKeyGenerator可客製化自己產生token~~  
  
說明
---  
1.BeClientDetailsService、BeTokenService與BeUserService請依照商業邏輯進行修改    
2.如果現行token不滿足需求可額外進行客製CustomTokenEnhancer與UniqueAuthenticationKeyGenerator    
