require 'spec_helper'

describe 'prep_analytics::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  context 'ntp' do
    it 'is running' do
      expect(service 'ntpd').to be_running
    end

    it 'is enabled' do
      expect(service 'ntpd').to be_enabled
    end
  end
  context 'qpidd' do
    it 'is stopped' do
      expect(service 'qpidd').not_to be_running
    end

    it 'is enabled' do
      expect(service 'qpidd').not_to be_enabled
    end
  end
  context 'selinux' do
    it 'is stopped' do
      expect(service 'selinux').not_to be_running
    end

    it 'is enabled' do
      expect(service 'selinux').not_to be_enabled
    end
  end
end
