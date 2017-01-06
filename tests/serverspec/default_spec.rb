require 'spec_helper'
require 'serverspec'

describe package("apt-transport-https") do
  it { should be_installed }
end

describe command("apt-key list") do
  its(:stdout) { should match(/^pub\s+2048R\/D88E42B4\s+.*$/) }
end

describe file("/etc/apt/sources.list.d/artifacts_elastic_co_packages_5_x_apt.list") do
  its(:content) { should match(/^deb #{ Regexp.escape("https://artifacts.elastic.co/packages/5.x/apt") } stable main$/) }
end

describe file("/etc/apt/sources.list.d/ppa_webupd8team_java_trusty.list") do
  its(:content) { should match(/^deb #{ Regexp.escape("http://ppa.launchpad.net/webupd8team/java/ubuntu") } trusty main$/) }
end 