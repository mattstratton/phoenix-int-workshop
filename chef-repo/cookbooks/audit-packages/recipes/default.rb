#
# Cookbook Name:: audit-packages
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
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
