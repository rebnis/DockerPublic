# RabbitMQ

RabbitMQ message broker.

[Dockerfile](https://github.com/rebnis/DockerPublic/tree/master/RabbitMQ)

## Using

```powershell
docker run -d `
--hostname rabbitmq `
-p 5672:5672 `
rebnis/rabbitmq
```

Management UI can be reached via http://rabbitmq:15672 (or publish 15672 to localhost)

Login: guest/guest

## Version

Tag "latest" uses following versions:

* Windows Server 2016 (servercore:ltsc2016)
* RabbitMQ 3.7.12
* Erlang 21.2

## Links

* [RabbitMQ](https://www.rabbitmq.com/)
* [Erlang](http://www.erlang.org/)
