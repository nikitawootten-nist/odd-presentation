# OSCAL "Deep Diff" Introduction Presentation

This repository holds a presentation introducing [OSCAL-deep-diff](https://github.com/usnistgov/oscal-deep-diff), initially presented during the June 8th 2023 session of [FedRAMP Data Bites](https://www.fedramp.gov/blog/2022-08-18-fedramp-launches-oscal-developer-data-bites-series/).

This presentation has been adapted from an earlier PowerPoint-driven presentation originally presented during the [2022 OSCAL Conference](https://csrc.nist.gov/Events/2022/3rd-oscal-workshop) (Day 2 Track 1).

## Build

The raw presentation is located at [`presentation.md`](./presentation.md) and is rendered with [MARP](https://marpit.marp.app/).

To render the presentation into a PDF or HTML page, clone the repository and run:

```sh
$ make presentations
```

Other makefile targets can be accessed with `make help`.

## Examples

This presentation includes several demonstrations in the [`examples/`](./examples/) directory.

More details about these demos can be found in the appendix slides of the presentation.
