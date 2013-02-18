# AWS Elastic IP remapper

Quick-and-dirty Ruby script that remaps an elastic IP address to the EC2 instance on which it's run. Includes an upstart (for Ubuntu and friends) compatible config for launching the script at system start time.


### Usage

1. Use the [Chef installer](https://github.com/madebymade/chef-aws-remap-elastic-ip)

or..

1. Copy the repository to `/var/lib/aws/remap_ip/`
2. Copy `upstart.conf` to `/etc/init/aws_remap_ip.conf` and CHMOD to 0644
3. Edit `config.json` to reflect your environment
4. Run `gem install bundler` (if you don't already have Bundler on your system)
5. Run `bundle install` in the `/var/lib/aws/remap_ip/` directory


###License

Licensed under [New BSD License](http://opensource.org/licenses/BSD-3-Clause)