# boiler-docs

Materials to enter custom text into boiler documents.

## Usage

1. Open custom document you want to edit (e.g., `custom.txt`).

1. Enter the custom text under the appropriate headings. These headings must match exactly with the headings in the boiler document for those that need custom text (e.g., `boiler.txt`).

1. Run `R/build.R` to copy the custom text in the custom document into the boiler document: `source("R/build.R")`

1. Marvel at the new boiler document to see your changes.

## Required R packages

- `here`