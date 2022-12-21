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
* thin_1_8_1_app

### Curl

```
$ dd if=/dev/zero bs=1 count=10 | curl unicorn_6_1_0_app:3000/webapi -X POST  -H 'Transfer-Encoding: chunked' --data-binary @-
```

And you can see the result on the log like this

```
rails-experiment-unicorn_6_1_0_app-1  | "rack.input: \u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000"
rails-experiment-unicorn_6_1_0_app-1  | "request.headers['CONTENT_LENGTH']: "
rails-experiment-unicorn_6_1_0_app-1  | "request.body: #<Rack::Lint::InputWrapper:0x0000aaab109b4428>"
rails-experiment-unicorn_6_1_0_app-1  | "request.raw_post: "
rails-experiment-unicorn_6_1_0_app-1  | 172.22.0.5 - - [21/Dec/2022:02:38:23 +0000] "POST /webapi HTTP/1.1" 200 - 0.0226
```


### Debug code
It's in each app's app/controllers/webapi_controller.rb
