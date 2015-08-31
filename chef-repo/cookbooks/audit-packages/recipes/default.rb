#
# Cookbook Name:: audit-packages
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
if node['platform_family'] == 'rhel'
  packages = %w(openssl ca-certificates openssh tzdata)
  control_group 'Critical Packages' do
    packages.each do |package|
      control package do
        it 'is up to date' do
          expect(command("yum list updates #{package} | grep '^#{package}\.'").exit_status).to_not eq 0
        end
      end
    end
  end
elsif node['platform_family'] == 'debian'
  packages = %w(openssl ca-certificates openssh-client openssh-server tzdata)
  control_group 'Critical Packages' do
    packages.each do |package|
      control package do
        it 'is up to date' do
          expect(command("dpkg --get-selections | xargs apt-cache policy {} | grep -1 Installed | sed -r 's/(:|Installed: |Candidate: )//' | uniq -u | tac | sed '/--/I,+1 d' | tac | sed '$d' | sed -n 1~2p | grep '^#{package}$'").exit_status).to_not eq 0
        end
      end
    end
  end
end
