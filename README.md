[Codecov][1] Elixir (Umbrella Project) Example
=======================

[![Build Status](https://travis-ci.org/vealor/example-elixir-umbrella-codecov.svg?branch=master)](https://travis-ci.org/vealor/example-elixir-umbrella-codecov) [![codecov](https://codecov.io/gh/vealor/example-elixir-umbrella-codecov/branch/master/graph/badge.svg?token=)](https://codecov.io/gh/vealor/example-elixir-umbrella-codecov)

This repository serves as an **example** on how to use [Codecov Global][4] for an Elixir Umbrella Project.

# Mix.exs
The main configuration required for the projects to work.
#### Add Depenency:
Add [excoveralls](https://hex.pm/packages/excoveralls) to your mix.exs deps.
```elixir
defp deps do
  [
    {:excoveralls, "~> 0.7", only: :test},
  ]
end
```
#### In Project:
```elixir
preferred_cli_env: [
   "coveralls": :test,
   "coveralls.html": :test,
   "coveralls.json": :test,
 ],
test_paths: test_paths(),
test_coverage: [tool: ExCoveralls],
```
#### Add the function test_paths():
Assuming this matches your apps path and you have tests available for each subapp!  
```elixir
defp test_paths do
  "apps/*/test" |> Path.wildcard |> Enum.sort
end
```

# Travis CI

Add to your `.travis.yml` file.  
NOTE: Use any elixir or otp_release versions you need, these are examples.
```yml
language: elixir
elixir:
  - 1.3
  - 1.4
  - 1.5
otp_release:
  - 18
  - 19
  - 20

script:
  - "MIX_ENV=test mix do compile, coveralls.json --umbrella"

after_success:
  - bash <(curl -s https://codecov.io/bash)
```
NOTE: You may want to include "--warnings-as-errors" if you know your dependencies in your project are clean otherwise the build will fail.  If you include it during a build, use this for the script:
```elixir
script:
  - "MIX_ENV=test mix do compile --warnings-as-errors, coveralls.json --umbrella"
```

See the [Travis CI documentation](https://docs.travis-ci.com/user/languages/elixir/) for more information.


View source and learn more about [Codecov Global Uploader][4]

# Subapp configuration:
For each subapp:
###### Add to your project in mix.exs (ONLY FOR THE SUBAPPS YOU WANT TO TRACK):
```elixir
test_coverage: [tool: ExCoveralls]
```
Currently if you are using a framework or something that does not include a full test suite by default, you are losing code coverage points by adding that subapp to coverage testing!

In the example subapps, only **example_one** and **example_two** are included in the coverage.  This can be seen on both [codecov.io][3] and on [travis-ci][2] at the end of the build when it shows the results.

# Testing coverage locally:
###### Run these commands at the umbrella project roo
To test the coverage of each individual app:
```bash
mix coveralls
```
To test the coverage of all coverage-included subapps in the umbrella project:
```bash
mix coveralls --umbrella
```

----
Need help? Contact support https://github.com/codecov/support

[1]: https://codecov.io/
[2]: https://travis-ci.org/vealor/example-elixir-umbrella-codecov
[3]: https://codecov.io/gh/vealor/example-elixir-umbrella-codecov
[4]: https://github.com/codecov/codecov-bash
