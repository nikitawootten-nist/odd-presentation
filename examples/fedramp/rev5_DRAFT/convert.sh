#!/usr/bin/env bash

# Convert provided examples to JSON

function oscal-convert () {
    oscal-cli "${1}" convert --overwrite --to="${2}" "${3}" "${3/xml/${2}}"
}

echo Converting profiles...
for profile in ./*profile.xml; do
    oscal-convert profile json "${profile}"
done

echo Converting resolved catalogs...
for profile in ./*resolved-catalog*.xml; do
    oscal-convert catalog json "${profile}"
done
