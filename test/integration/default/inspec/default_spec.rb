
# Check that the installation directory was created successfully
describe file('/usr/local/Reapr_1.0.18') do
  it { should be_directory }
end

describe command('. /etc/profile; reapr') do
  its('exit_status') { should eq 255 }
  its('stderr') { should match(/REAPR version: 1.0.18/) }
end

# Check that the test data directory was created successfully
describe file('/usr/local/Reapr_1.0.18/Reapr_1.0.18.test_data/') do
  it { should be_directory }
end

# Use the test data to test the installation
describe bash('. /etc/profile; cd /usr/local/Reapr_1.0.18/Reapr_1.0.18.test_data; ./test.sh') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match(/All done!/) }
  its('stdout') { should match(/All looked OK so cleaning files.../) }
end
