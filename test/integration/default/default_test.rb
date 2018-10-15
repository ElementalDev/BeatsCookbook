# # encoding: utf-8

# Inspec test for recipe beats::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package 'filebeat' do
  it { should be_installed }
  its('version') { should match /6\.4/ }
end

describe package 'metricbeat' do
  it { should be_installed }
  its('version') { should match /6\.4/ }
end

describe file("/etc/apt/trusted.gpg") do
  it { should exist }
  its('content') { should match /4609 5ACC 8548 582C 1A26 99A9 D27D 666C D88E 42B4/ }
end

describe file("/etc/filebeat/filebeat.yml") do
  it { should exist }
end

describe file("/etc/metricbeat/metricbeat.yml") do
  it { should exist }
end

describe service("filebeat") do
  it { should be_enabled }
  it { should be_running }
end

describe service("metricbeat") do
  it { should be_enabled }
  it { should be_running }
end

describe port(5044) do
  it { should be_listening }
  its("addresses") { should include '0.0.0.0' }
end

describe port(5045) do
  it { should be_listening }
  its("addresses") { should include '0.0.0.0' }
end
