default['reapr']['version'] = '1.0.18'
default['reapr']['install_path'] = '/usr/local'
default['reapr']['dirname'] = 'Reapr_' + default['reapr']['version']
default['reapr']['filename'] = "Reapr_#{node['reapr']['version']}.tar.gz"
default['reapr']['url'] = "ftp://ftp.sanger.ac.uk/pub/resources/software/reapr/#{node['reapr']['filename']}"
 # The following is to install perl modules that behave with Ensembl
default['perlbrew']['perl_version'] = 'perl-5.14.4'
# These options are absolutely vital for installing mod_perl
# see https://perl.apache.org/docs/2.0/user/install/install.html
# WARNING - These are flags for 64 bit architecture, which we
# assume we are on. This probably won't work on 32 bit, so would
# need to test architecture here and use default options if 32 bit.
# should test node['kernel']['machine']
# notetest and switch are perlbrew options to skip testing perl compile
# and --switch makes the new perl the default
default['perlbrew']['install_options'] = '--notest -des -A ccflags=-fPIC'
