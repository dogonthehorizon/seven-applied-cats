# seven-applied-cats

This repository contains notes and exercise solutions related to ["An Invitation
to Applied Category Theory" by Fong and Spivak][cats] implemented in [Haskell].
I'm working through the softcover copy with [ISBN 978-1-108-71182-1][isbn].

Most solutions live in `src/ChapterX` where `X` is the chatper number.
Tests for solutions live in `test/ChatperXTests` where X is the chapter number.
If a file doesn't exist in `src` for a chapter then the solution and tests are
contained in the same file (the solutions were not interesting enough to 
define on their own, or the test was the solution itself).

## Getting Started

It is assumed you have [Stack] installed.

You can build the project by running `stack build`, to validate that solutions
are passing all tests you can run `stack test`.

If you'd like to iterate on a solution or implement a new test, I like the
following command for fast code/compile/test cycles:

```shell
stack build --fast --test --file-watch
```

[Stack]: https://docs.haskellstack.org/en/stable/README/
[cats]: https://arxiv.org/abs/1803.05316
[Haskell]: https://www.haskell.org/
[isbn]: https://books.google.com/books?id=jGuhDwAAQBAJ&dq=isbn+978-1-108-71182-1&source=gbs_navlinks_s
