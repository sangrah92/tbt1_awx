#!/bin/bash
git clone https://github.com/ansible/awx-operator.git
cd awx-operator
git checkout tags/2.7.2
set VERSION=2.7.2
make deploy