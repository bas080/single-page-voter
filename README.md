# Single Page Voter

A simple webpage that enables users to create a poll and vote.

See it in action over [here][5].

## Documentation

Documentation of the code and project can be found [here][3].

## Building

Single page voter uses the [lit][1] program to build the code and code
documentation.

```sh
$ lit index.lit

```

## Tests

We use [prove][2] conventions for testing. All tests are therefore located in
the `./t` directory.

The tests use NPM's tape library. Make sure to `npm i` before running the
tests.

Run lit before running the tests to make sure the generated files are up to
date.

```sh
$ lit index.lit && prove
t/state.t ..... ok
t/to_pairs.t .. ok
All tests successful.
Files=2, Tests=9,  0 wallclock secs ( 0.02 usr  0.01 sys +  0.15 cusr  0.01 csys =  0.19 CPU)
Result: PASS
```

## Contributing

Most files in this project are generated by lit.

Install [lit][1]. See the literate GitHub for more information. Now you can
edit the [index.lit][4] file. See the build and tests sections for more
information.

## License

GNU General Public License 3.0

[1]:https://github.com/zyedidia/Literate
[2]:https://perldoc.perl.org/prove.html
[3]:https://bas080.github.io/single-page-voter/
[4]:./index.lit
[5]:https://bas080.github.io/single-page-voter/dist/voter.html
