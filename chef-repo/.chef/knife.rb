# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "chefadmin"
client_key               "#{current_dir}/chefadmin.pem"
validation_client_name   "chef-validator"
validation_key           "#{current_dir}/chef-validator.pem"
chef_server_url          "https://ec2-54-237-123-168.compute-1.amazonaws.com/organizations/chef"
cookbook_path            ["#{current_dir}/../cookbooks"]

knife[:aws_ssh_key_id]  = ENV['NATHENHARVEY_AWS_KEYPAIR_NAME']
knife[:aws_access_key_id]  = ENV['NATHENHARVEY_AWS_ACCESS_KEY_ID']
knife[:aws_secret_access_key] = ENV['NATHENHARVEY_AWS_SECRET_ACCESS_KEY']
knife[:region] = ENV['AWS_REGION']

