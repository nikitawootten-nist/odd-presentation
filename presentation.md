---
marp: true
title: "OSCAL Deep Diff Intro"
author: Nikita Wootten
theme: csd-workshop2023
class: invert workshop
footer: "![height:25px](https://raw.githubusercontent.com/usnistgov/nist-header-footer/nist-pages/images/nist_logo_brand_white.svg) OSCAL Deep Diff Introduction"
paginate: true
---

<!-- 
_paginate: false
_class: invert workshop radialbg
-->

# OSCAL "Deep Diff" Introduction

---


## The problem: Large documents are difficult to digest

OSCAL catalogs are no exception!

| ✍️ Authors | 🧾 Catalog Consumers | 🧑‍💻 Developers |
| - | - | - |
| How do I track changes that my team has made between revisions of a document? | How can I produce a checklist of controls with relevant changes when a new revision of a control catalog comes out? | How can I track when certain types of changes to a document happens, and make decisions based on those change-lists (such as in a CI/CD pipeline)? |

---

<!--
_footer: "![height:25px invert](https://raw.githubusercontent.com/usnistgov/nist-header-footer/nist-pages/images/nist_logo_brand_white.svg) OSCAL Deep Diff Introduction"
_class: workshop
-->

### The solution: A "diff" tool for OSCAL documents

* A tool that compares OSCAL documents
* Should adapt to different scenarios (not just catalogs)
* Machine-readable and human-readable outputs
* Portable and extendable so that it can be integrated into other tools (such as web applications)

![bg right 100%](./support/screenshot_gh_diff.png)

---

<!--
_footer: "![height:25px invert](https://raw.githubusercontent.com/usnistgov/nist-header-footer/nist-pages/images/nist_logo_brand_white.svg) OSCAL Deep Diff Introduction"
_class: workshop
-->

### OSCAL Deep Diff introduction

* An open-source TypeScript CLI and library that can be used to compare JSON objects
* Does not rely on a schema, can be configured to reproducibly compare documents
* Generates outputs in multiple formats including easy-to-distribute Excel spreadsheets
* Can be integrated into Javascript applications

![bg right 100%](./support/screenshot_gh_odd_repocard.png)

---

<!--
_class: invert workshop radialbg
-->

# Scenario: a basic comparison

---

## Output format

![bg right 100%](./support/screenshot_comparison.png)

- By default OSCAL deep diff produces a JSON document listing the differences between 2 documents
- Array properties (`groups`, `controls`, etc.) have sub-lists of changes for each matched pair.

---

## Output format (continued)

![](./support/screenshot_comparison_excel.png)

Alternatively an Excel output can be used to collect changes from a property (e.g. all controls in a catalog)

---

## Configuration

![bg right 100%](./support/screenshot_config.png)

The tool can be configured to change the comparison behavior:
- Ignore irrelevant changes (`uuid` shifts, etc)
- Specify how properties should be compared (ignore case, string similarity)
- Specify how arrays should be matched and compared

...as well as the output format (JSON, Excel)

---

<!--
_class: invert workshop radialbg
-->

# Scenario: tailoring a catalog comparison

---

## Shortcomings

* Speed of comparisons
    - Array comparison algorithms are computationally expensive!
* Comparison behavior tuning
    - Users must tweak tool to fit a scenario
    - This tool does not replace the job of an analyst!
* Comparison results
    - Some scenarios are not supported yet, such as object demotion/promotion

<!--
An example of object promotion/demotion would be an enhancement becoming a control (or vice versa)
-->

---

<!--
_class: invert workshop radialbg
-->

## Call to action

If this tool is exciting or potentially useful to you:
- Please provide feedback, bug reports, and suggest improvements:

    https://github.com/usnistgov/oscal-deep-diff

![bg right 50%](https://imgs.xkcd.com/comics/data_trap.png)
