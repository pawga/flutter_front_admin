### Finding a solution to the problem of HTTPS requests to servers with self-signed certificates.
The issue has only been identified for the web build. For other platforms (Android and iOS), the problem has not been investigated. Also, I think for Android and iOS, for obvious reasons, it makes no sense since there is a public Firebase.
A web configuration with self-signed certificates could be used in closed enterprise segments. To my regret, React and Angular "wins" in these segments. And flutter web assembly for the web platform is not good now :(.
### Getting Started

```
docker pull pawga777/pawga_ssl_demo:0.0.1
docker run -d -p 8443:8443 pawga777/pawga_ssl_demo:0.0.1

https://127.0.0.1:8443/actuator/health
https://127.0.0.1:8443/actuator/info
https://127.0.0.1:8443/
https://127.0.0.1:8443/say-hello?username=Serg
```

### Additional Information
* [Server source code with self-signed certificate](https://github.com/pawga/ssl-demo)
