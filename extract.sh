#!/bin/bash

# Get all jobs for alerts and dashboards
jobs=$(find $1/jobs -name "*_alerts")
jobs="$jobs
$(find $1/jobs -name "*_dashboards")"

# Extract them
for job in $jobs; do
    echo $job
    job_name=$(basename $job)
    rm -rf packages/$job_name jobs/$job_name src/$job_name
    bosh-gen extract-job "$job"
done

# Same for packages
pkgs=$(find $1/packages -name "*_alerts")
pkgs="$pkgs
$(find $1/packages -name "*_dashboards")"

for pkg in $pkgs; do
    echo $pkg
    bosh-gen extract-pkg "$pkg"
done

# Copy all the sources
srcs=$(find $1/src -name "*_alerts")
srcs="$srcs
$(find $1/src -name "*_dashboards")"

for src in $srcs; do
    echo $src
    cp -r $src src/
done

