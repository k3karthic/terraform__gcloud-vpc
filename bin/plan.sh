#!/usr/bin/env bash

terraform plan -var-file=google.tfvars --out=tf.plan $@
