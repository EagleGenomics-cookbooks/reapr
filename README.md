# REAPR

Description
===========
This Cookbook installs REAPR, a tool that evaluates the accuracy of a genome assembly using mapped paired end reads, without the use of a reference genome for comparison. 

Requirements
============

## Platform:

* Ubuntu 14.04

Notes
=====

Usage
=====
Simply include the recipe wherever you would like it installed, such as a run list (recipe[reapr]) or a cookbook (include_recipe 'reapr')


## Testing
To test the recipe we use chef test kitchen:

kitchen converge

kitchen login

kitchen verify

kitchen destroy

kitchen test

Attributes
==========
See attributes/default.rb for default values.

default['reapr']['version']

License and Authors
===================

* Authors:: Daniel Barrell (<chef@eaglegenomics.com>)

Copyright:: 2016, Eagle Genomics Ltd

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software

distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
