# README

Issue reported here https://github.com/puma/puma/issues/1839#ref-issue-468408843 OP reports an issue with puma perhaps not handling chunked POST requests, the issue looks like a Rails issue rather than puma.

Steps to reproduce the issue;

1. Run this app `bundle exec rails s`
2. Send a chunked post request (below)

`curl -H "Transfer-Encoding: chunked" -H "Content-Type: application/json" -d '{"abc": "123"}' -X POST http://localhost:3000/posts/create`

3. We can see the output of `request.raw_post` empty

If we have a look at `app/controllers/posts_controller.rb` inside the create action, when calling `request.env.*` the outputs are;

```
STDERR.puts request.env['rack.input'].read # => {"abc": "123"}
STDERR.puts request.body # => #<File:0x00007f8460b2b088>
STDERR.puts request.raw_post # =>
STDERR.puts request.body.read # =>
```
