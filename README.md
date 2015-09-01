# Compliance Demo

# WIP

Use at your own risk ;)

I'm sure I'll come back and update this README with more relevant information at some point in the future.

### Goals

* Demonstrate audit-mode during development
* Demonstrate audit-mode on running infrastructure
* Demonstrate node overview and status in Analytics
* Demonstrate email-based notifications in Analytics
* Demonstrate webhook (slack) notifications in Analytics
* Demonstrate remote execution

### Pre-requisites

* Chef Server
* Chef Analytics
* A place to provision nodes (AWS, Azure, Digital Ocean, etc.)

### Set-up

* Install [Chef Development Kit](https://downloads.chef.io/chef-dk/)
* Clone [this repository](https://github.com/nathenharvey/devopsdc-compliance-demo.git)
* Download or create appropriate `knife.rb` and `.pem` files
* Configure `knife.rb` with credentials for your IaaS provider
  * Install the appropriate knife plugins (eg, knife-ec2)
* `berks install` and `berks upload --no-ssl-verify` each of the cookbooks
* Provision 3 or more nodes (node1, node2, node3, etc.)
  * knife ec2 server create --image ami-12663b7a --ssh-user ec2-user --security-group-ids sg-2ee7694b --flavor t2.micro --run-list 'recipe[my_chef-client]' --node-name node1
* login to the box and run `sudo yum downgrade -y bash` until you get to the lowest version readily available

### Demo

* Add 'role[audit]' to the node's run list or to the base role
* Use `knife ssh` to re-run chef-client
* See the failing audit
  * in the shell output
  * in Analytics
* Add the notification and rule in Analytics
* Use `knife ssh` to re-run chef-client
* See the failing audit
  * in the shell output
  * in Analytics
  * in notification (email, slack, etc.)
* Add 'role[remediation]' to the node's run list or to the base role
* Use `knife ssh` to re-run chef-client
* See the passing audit
  * in the shell output
  * in Analytics
  * in notification (email, slack, etc.)
* Show how Test Kitchen can be used to run audits before you even get to production.
