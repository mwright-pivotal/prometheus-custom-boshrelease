# BOSH Release for prometheus-custom

## Usage
These are the files needed to customize the (Prometheus BOSH release)[https://github.com/cloudfoundry-community/prometheus-boshrelease/].

To use it you need to fork this repository, edit any files you wish to customize and cut a new release:

`bosh create release --final --with-tarball`

Once the release is created you can upload it to the BOSH director and use it on the `prometheus` job.

## LICENSE

This release is created by extracting the jobs and source from the prometheus bosh release, please see https://github.com/cloudfoundry-community/prometheus-boshrelease/blob/master/LICENSE.

