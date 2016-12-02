#!/bin/bash

ansible-playbook $@ -s -u turnofarm -i inventory ../ansible/site.yml
