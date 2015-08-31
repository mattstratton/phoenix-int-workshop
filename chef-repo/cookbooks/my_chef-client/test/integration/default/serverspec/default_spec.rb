require 'spec_helper'

describe 'my_chef-client::default' do
  it 'runs the chef-client daemon' do
    expect(service 'chef-client').to be_running
  end

  it 'enables the chef-client daemon' do
    expect(service 'chef-client').to be_enabled
  end

  it 'enables audit_mode' do
    expect(file '/etc/chef/client.rb').to contain(/^audit_mode\s*:enabled\s*$/)
  end
end
