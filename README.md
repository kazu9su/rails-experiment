# How to test


## Build & start containers

```
$ docker-compose build
```

```
$ docker-compose up
```

## Exec the curl on the container


### Access to the container

* i.e) rails_puma_5_6_5_app

```
$ docker-compose run --rm puma_5_6_5_app bash
```

### Accessable containers

* puma_4_3_3_app
* puma_5_6_5_app
* unicorn_6_1_0_app

### Curl

```
$ dd if=/dev/zero bs=1 count=10 | curl puma_5_6_5_app:3000/webapi -X POST  -H 'Transfer-Encoding: chunked' --data-binary @-
```

And you can see the result on the log like this

```
rails-experiment-puma_5_6_5_app-1     | "rack.input: \u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000"
rails-experiment-puma_5_6_5_app-1     | "request.headers['CONTENT_LENGTH']: 10"
rails-experiment-puma_5_6_5_app-1     | "request.body: #<File:0x0000aaaaeeade910>"
rails-experiment-puma_5_6_5_app-1     | "request.body: 10"
rails-experiment-puma_5_6_5_app-1     | "request.raw_post: \u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000"
rails-experiment-puma_5_6_5_app-1     | Completed 200 OK in 18ms (ActiveRecord: 0.0ms | Allocations: 2556)
```


### Debug code
It's in each app's app/controllers/webapi_controller.rb
